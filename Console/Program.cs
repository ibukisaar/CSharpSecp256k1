using System;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Diagnostics;
using CSharpSecp256k1;
using System.Threading;

namespace Console {
    class Program {
        static bool IsHex(char c) => (uint)c - '0' <= 9u || ((uint)c | 32) - 'a' <= 5u;
        static int HexCharToInt(char c) => ((c & 31) + 9) % 25;

        static byte[] ParseHex(string hexString) {
            if (hexString.Length != 64) throw new ArgumentException();
            byte[] ret = new byte[32];
            for (int i = 0; i < 32; i++) {
                if (!IsHex(hexString[2 * i]) || !IsHex(hexString[2 * i + 1])) throw new ArgumentException();
                ret[31 - i] = (byte)((HexCharToInt(hexString[2 * i]) << 4) | HexCharToInt(hexString[2 * i + 1]));
            }
            return ret;
        }

        static byte[] ParseBytes(string hexString) {
            byte[] ret = new byte[hexString.Length / 2];
            for (int i = 0; i < ret.Length; i++) {
                if (!IsHex(hexString[2 * i]) || !IsHex(hexString[2 * i + 1])) throw new ArgumentException();
                ret[i] = (byte)((HexCharToInt(hexString[2 * i]) << 4) | HexCharToInt(hexString[2 * i + 1]));
            }
            return ret;
        }

        static void PrintHex(string message, ReadOnlySpan<byte> bytes) {
            var sb = new StringBuilder(bytes.Length * 2);
            for (int i = 0; i < bytes.Length; i++) {
                sb.Append($"{bytes[i]:x2}");
            }
            System.Console.WriteLine($"{message}: {sb}");
        }

        static readonly Random random = new Random();

        static void Test1() {
            var msg = ParseBytes("0000000000000000000009000000000000000000000000000100000000000000");
            var pubKey = PublicKey.Parse(ParseBytes("04a34b99f22c790c4e36b2b3c2c35a36db06226e41c692fc82b8b56ac1c540c5bd5b8dec5235a0fa8722476c7709c02559e3aa73aa03918ba2d492eea75abea235"));
            var sigBytes = ParseBytes("3045022100b0182d440c59af7fa61a700aab21a1be1dc207387bed425ff712d85758491d4702205d949f79002847dda119270ce683b4b4ad5fbe1b6b34d1e597f9bab0d43c9cc4");
            var sig = Signature.Parse(sigBytes);
            bool ok = Secp256k1.Verify(pubKey, msg, sig);
            System.Console.WriteLine($"测试1: {ok}");
        }

        static void Test2() {
            var msg = ParseBytes("788bdab359b79ae82485eb4b3c1d1a4d699eb5eb812b7b09c131d01ba0828846");
            var privKey = ParseBytes("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
            var pubKey = Secp256k1.CreatePublicKey(privKey);
            var sig = Secp256k1.Sign(privKey, msg);
            bool ok = Secp256k1.Verify(pubKey, msg, sig);
            System.Console.WriteLine($"测试2: {ok}");
            PrintHex("私钥", privKey);
            PrintHex("短公钥", pubKey.Serialize(true));
            PrintHex("长公钥", pubKey.Serialize());
            PrintHex("消息", msg);
            PrintHex("签名", sig.Serialize());
        }

        static void Test3() {
            const int N = 10000;

            TimeSpan privKeyTime = default, publicKeyTime = default, signTime = default, verifyTime = default;
            var sw = new Stopwatch();

            Span<byte> msg = stackalloc byte[32];
            new Random().NextBytes(msg);

            for (int i = 0; i < N; i++) {
                sw.Restart();
                var privKey = Secp256k1.CreatePrivateKey();
                sw.Stop();
                privKeyTime += sw.Elapsed;

                sw.Restart();
                var publicKey = Secp256k1.CreatePublicKey(privKey);
                sw.Stop();
                publicKeyTime += sw.Elapsed;

                sw.Restart();
                var sign = Secp256k1.Sign(privKey, msg);
                sw.Stop();
                signTime += sw.Elapsed;

                sw.Restart();
                bool result = Secp256k1.Verify(publicKey, msg, sign);
                sw.Stop();
                verifyTime += sw.Elapsed;

                if (result is false) throw new Exception("验证失败");
            }

            System.Console.WriteLine($"单次创建私钥耗时：{privKeyTime / N}");
            System.Console.WriteLine($"单次创建公钥耗时：{publicKeyTime / N}");
            System.Console.WriteLine($"单次签名耗时：{signTime / N}");
            System.Console.WriteLine($"单次验证耗时：{verifyTime / N}");
        }

        static void Main(string[] args) {
            Test1();
            System.Console.WriteLine("===============================================");
            Test2();
            System.Console.WriteLine("===============================================");
            Test3();
        }
    }
}

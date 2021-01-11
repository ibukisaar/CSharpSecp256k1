using System;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Diagnostics;
using CSharpSecp256k1;
using System.Threading;

namespace ConsoleTest {
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
            Console.WriteLine($"{message}: {sb}");
        }

        static void Test() {
            const int N = 10000;

            TimeSpan privKeyTime = default, publicKeyTime = default, signTime = default, verifyTime = default, recoverTime = default;
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

                sw.Restart();
                var publicKey2 = Secp256k1.RecoverPublicKey(msg, sign);
                sw.Stop();
                recoverTime += sw.Elapsed;

                if (publicKey2.X != publicKey.X || publicKey2.Y != publicKey.Y) throw new Exception("恢复失败");
            }

            Console.WriteLine($"单次创建私钥耗时：{privKeyTime / N}");
            Console.WriteLine($"单次创建公钥耗时：{publicKeyTime / N}");
            Console.WriteLine($"单次签名耗时：{signTime / N}");
            Console.WriteLine($"单次验证耗时：{verifyTime / N}");
            Console.WriteLine($"单次恢复公钥耗时：{recoverTime / N}");
        }

        static void Main(string[] args) {
            Test();
        }
    }
}

using System;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Diagnostics;
using Saar.Secp256k1;
using Saar.Secp256k1.Math;

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
			var msg = new byte[32];
			var pubKey = PublicKey.Parse(ParseBytes("04a34b99f22c790c4e36b2b3c2c35a36db06226e41c692fc82b8b56ac1c540c5bd5b8dec5235a0fa8722476c7709c02559e3aa73aa03918ba2d492eea75abea235"));
			var sigBytes = ParseBytes("3045022100c70d3082ba8b7be15f78e1daea1c3969b898bf1fc9811768542db6b2716eb1cb02204fba916ee29794fe2621b46299ae9a95f0b0168634f61730690f854dbea672e1");
			var sig = Signature.Parse(sigBytes);
			bool ok = Secp256k1.Verify(pubKey, msg, sig);
			System.Console.WriteLine($"测试1: {ok}");
		}

		static void Test2() {
			var msg = new byte[32];
			random.NextBytes(msg);
			var privKey = Secp256k1.CreatePrivateKey();
			var pubKey = Secp256k1.CreatePublicKey(privKey);
			var sig = Secp256k1.Sign(privKey, msg);
			bool ok = Secp256k1.Verify(pubKey, msg, sig);
			System.Console.WriteLine($"测试2: {ok}");
			PrintHex("私钥", privKey);
			PrintHex("公钥", pubKey.Serialize());
			PrintHex("消息", msg);
			PrintHex("签名", sig.Serialize());
		}

		static void Test3() {
			const int N = 10000;

			var sw = new Stopwatch();
			var privKey = Secp256k1.CreatePrivateKey();

			sw.Restart();
			for (int i = 0; i < N; i++) {
				Secp256k1.CreatePublicKey(privKey);
			}
			sw.Stop();
			System.Console.WriteLine(sw.Elapsed);
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

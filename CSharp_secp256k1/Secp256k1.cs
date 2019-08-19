using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Globalization;
using System.Security.Cryptography;
using Saar.Secp256k1.Math;

namespace Saar.Secp256k1 {
	unsafe public static class Secp256k1 {
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


		static readonly U256 Gx = new U256(ParseHex("79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798"));
		static readonly U256 Gy = new U256(ParseHex("483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8"));
		static readonly Point G = new Point(Gx, Gy);
		static readonly U256 N = new U256(ParseHex("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141"));
		static readonly U256 N_1 = new U256(ParseHex("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364140"));
		static readonly U256[,] Gx_Table = new U256[32, 256];
		static readonly U256[,] Gy_Table = new U256[32, 256];

		static readonly RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();


		static Secp256k1() {
			var tempGTable = new Point[256];
			tempGTable[0] = G;
			for (int i = 1; i < 256; i++) {
				tempGTable[i] = ModP.Mul2(tempGTable[i - 1]);
			}

			for (int j = 0; j < 32; j++) {
				for (int i = 1; i < 256; i++) {
					var t = Point.Zero;
					if ((i & 1) != 0) t = ModP.Add(t, tempGTable[j * 8 + 0]);
					if ((i & 2) != 0) t = ModP.Add(t, tempGTable[j * 8 + 1]);
					if ((i & 4) != 0) t = ModP.Add(t, tempGTable[j * 8 + 2]);
					if ((i & 8) != 0) t = ModP.Add(t, tempGTable[j * 8 + 3]);
					if ((i & 16) != 0) t = ModP.Add(t, tempGTable[j * 8 + 4]);
					if ((i & 32) != 0) t = ModP.Add(t, tempGTable[j * 8 + 5]);
					if ((i & 64) != 0) t = ModP.Add(t, tempGTable[j * 8 + 6]);
					if ((i & 128) != 0) t = ModP.Add(t, tempGTable[j * 8 + 7]);
					Gx_Table[j, i] = ModP.ToU256(t.X);
					Gy_Table[j, i] = ModP.ToU256(t.Y);
				}
			}
		}

		static Point MulG(in U256 n) {
			Point ret = Point.Zero;
			fixed (U256* p = &n) {
				for (int j = 0; j < 32; j++) {
					var i = ((byte*)p)[j];
					if (i == 0) continue;
					ret = ModP.FastAdd(ret, Gx_Table[j, i], Gy_Table[j, i]);
				}
			}
			return ret;
		}

		public static byte[] CreatePrivateKey() {
			var privateKey = new byte[32];
			U256 k;
			do {
				rng.GetBytes(privateKey);
				k = ModP.U256(privateKey);
			} while (k.IsZero || k > N_1);
			return privateKey;
		}

		public static PublicKey CreatePublicKey(ReadOnlySpan<byte> privateKey) {
			if (privateKey.Length != 32) throw new InvalidPrivateKeyException("私钥长度必须是32字节");
			var k = ModP.U256(privateKey);
			if (k.IsZero || k > N_1) throw new InvalidPrivateKeyException();
			var retPoint = MulG(k);
			return new PublicKey(ModP.ToU256(retPoint.X), ModP.ToU256(retPoint.Y));
		}

		public static Signature Sign(ReadOnlySpan<byte> privateKey, ReadOnlySpan<byte> message) {
			if (privateKey.Length != 32) throw new InvalidPrivateKeyException("私钥长度必须是32字节");
			if (message.Length != 32) throw new InvalidMessageException("消息长度必须是32字节");
			var dA = ModN.U256(privateKey);
			var msg = ModN.U256(message);
			var tempPrivKey = CreatePrivateKey();
			var tempPubKey = CreatePublicKey(tempPrivKey);
			var k = ModN.U256(tempPrivKey);
			var S = ModN.Div(ModN.Add(msg, ModN.Mul(dA, tempPubKey.x)), k);
			return new Signature(tempPubKey.x, S);
		}

		public static bool Verify(PublicKey publicKey, ReadOnlySpan<byte> message, Signature signature) {
			if (message.Length != 32) throw new InvalidMessageException("消息长度必须是32字节");
			var msg = ModN.U256(message);
			var S_inv = ModN.Inverse(signature.S);
			var u1 = ModN.Mul(S_inv, msg);
			var u2 = ModN.Mul(S_inv, signature.R);
			var P = ModP.Add(MulG(u1), ModP.Mul(publicKey.ToPoint(), u2));
			return ModP.Equal(P.X, signature.R);
		}
	}
}

using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Globalization;
using System.Security.Cryptography;
using Saar.Secp256k1.Math;

namespace Saar.Secp256k1 {
	unsafe public static class Secp256k1 {
		static readonly U256 N_1 = new U256("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364140");

		static readonly RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();


		public static void CreatePrivateKey(Span<byte> outPrivateKey) {
			if (outPrivateKey.Length < 32) throw new ArgumentException("缓冲区至少要32字节", nameof(outPrivateKey));
			var privateKey = outPrivateKey.Slice(0, 32);
			U256 k;
			do {
				rng.GetBytes(privateKey);
				k = ModP.U256(privateKey);
			} while (k.IsZero || k > N_1);
		}

		public static byte[] CreatePrivateKey() {
			var privateKey = new byte[32];
			CreatePrivateKey(privateKey);
			return privateKey;
		}

		public static PublicKey CreatePublicKey(ReadOnlySpan<byte> privateKey) {
			if (privateKey.Length != 32) throw new InvalidPrivateKeyException("私钥长度必须是32字节");
			var k = ModP.U256(privateKey, bigEndian: true);
			if (k.IsZero || k > N_1) throw new InvalidPrivateKeyException();
			var retPoint = ModP.MulG(k);
			return new PublicKey(ModP.ToU256(retPoint.X), ModP.ToU256(retPoint.Y));
		}

		public static Signature Sign(ReadOnlySpan<byte> privateKey, ReadOnlySpan<byte> message) {
			if (privateKey.Length != 32) throw new InvalidPrivateKeyException("私钥长度必须是32字节");
			if (message.Length != 32) throw new InvalidMessageException("消息长度必须是32字节");
			var dA = ModN.U256(privateKey, bigEndian: true);
			var msg = ModN.U256(message, bigEndian: true);
			var tempPrivKey = CreatePrivateKey();
			var tempPubKey = CreatePublicKey(tempPrivKey);
			var k = ModN.U256(tempPrivKey, bigEndian: true);
			var S = ModN.Div(ModN.Add(msg, ModN.Mul(dA, tempPubKey.x)), k);
			return new Signature(tempPubKey.x, S);
		}

		public static bool Verify(PublicKey publicKey, ReadOnlySpan<byte> message, Signature signature) {
			if (message.Length != 32) throw new InvalidMessageException("消息长度必须是32字节");
			var msg = ModN.U256(message, bigEndian: true);
			var S_inv = ModN.Inverse(signature.S);
			var u1 = ModN.Mul(S_inv, msg);
			var u2 = ModN.Mul(S_inv, signature.R);
			var P = ModP.Add(ModP.MulG(u1), ModP.Mul(publicKey.ToPoint(), u2));
			return ModP.Equal(P.X, signature.R);
		}
	}
}

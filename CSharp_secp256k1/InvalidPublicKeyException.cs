using System;
using System.Collections.Generic;
using System.Text;

namespace Saar.Secp256k1 {
	public class InvalidPublicKeyException : Exception {
		public InvalidPublicKeyException() : base("无效的公钥") { }
		public InvalidPublicKeyException(string message) : base(message) { }
	}
}

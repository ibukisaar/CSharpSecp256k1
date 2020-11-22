using System;
using System.Collections.Generic;
using System.Text;

namespace CSharpSecp256k1 {
	public class InvalidSignatureException : Exception {
		public InvalidSignatureException() : base("无效的签名") { }
		public InvalidSignatureException(string message) : base(message) { }
	}
}

using CSharpSecp256k1.Math;
using System;
using System.Collections.Generic;
using System.Text;

namespace CSharpSecp256k1 {
    public sealed class Signature {
        public readonly U256 R, S;

        public Signature(in U256 r, in U256 s) => (R, S) = (r, s);

        unsafe public static Signature Parse(ReadOnlySpan<char> chars) {
            if (chars.Length != sizeof(U256) * 4) throw new ArgumentException($"{nameof(chars)}必须是{sizeof(U256) * 4}个十六进制字符");

            var r = new U256(chars[..(sizeof(U256) * 2)]);
            var s = new U256(chars[(sizeof(U256) * 2)..]);
            return new Signature(r, s);
        }

        unsafe public void Serialize(Span<byte> buffer) {
            if (buffer.Length < sizeof(U256) * 2) throw new ArgumentException($"{nameof(buffer)}长度必须>={sizeof(U256) * 2}");

            R.CopyTo(buffer[..sizeof(U256)], bigEndian: true);
            S.CopyTo(buffer[sizeof(U256)..], bigEndian: true);
        }

        unsafe public byte[] Serialize() {
            var buffer = new byte[sizeof(U256) * 2];
            Serialize(buffer);
            return buffer;
        }
    }
}

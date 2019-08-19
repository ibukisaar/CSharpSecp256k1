using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;

namespace Saar.Secp256k1.Math {
	internal struct Point {
		public static readonly Point Zero = new Point(Fraction.Zero, Fraction.Zero) { IsZero = true };

		public Fraction X, Y;
		public bool IsZero;

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public Point(in Fraction x, in Fraction y) {
			X = x;
			Y = y;
			IsZero = false;
		}
	}
}

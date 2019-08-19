using System;
using System.Runtime.CompilerServices;
using static Saar.Secp256k1.Math.U256Lib;

namespace Saar.Secp256k1.Math {
	internal static class ModP {
		public static readonly U256 P = new U256("fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f");

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 U256(ReadOnlySpan<byte> bytes, bool bigEndian = false) {
			var ret = new U256(bytes, bigEndian);
			u256_norm_p(ref ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Add(in U256 a, in U256 b) {
			u256_add_p(a, b, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Sub(in U256 a, in U256 b) {
			u256_sub_p(a, b, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Mul(in U256 a, in U256 b) {
			u256_mul_p(a, b, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Mul(in U256 a, ulong b) {
			u256_mul_u64_p(a, b, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Mul(ulong a, in U256 b) {
			u256_mul_u64_p(b, a, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Div(in U256 a, in U256 b) {
			if (b.IsZero) throw new DivideByZeroException();
			if (a.IsZero) return Math.U256.Zero;
			u256_inv_p(b, out var ret);
			u256_mul_p(a, ret, out ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Neg(in U256 a) {
			u256_neg_p(a, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Pow(in U256 a, in U256 b) {
			u256_pow_p(a, b, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Pow(in U256 a, ulong b) {
			u256_pow_u64_p(a, b, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Sqrt(in U256 a) {
			if (!u256_sqrt_p(a, out var ret)) throw new ArgumentException("没有平方根", nameof(a));
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Square(in U256 a) {
			u256_square_p(a, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 Inverse(in U256 a) {
			u256_inv_p(a, out var ret);
			return ret;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Add(in Fraction a, in Fraction b) {
			if (a.Den == b.Den) {
				return new Fraction(Add(a.Num, b.Num), a.Den);
			} else {
				return new Fraction(Add(Mul(a.Num, b.Den), Mul(a.Den, b.Num)), Mul(a.Den, b.Den));
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Add(in U256 a, in Fraction b) {
			if (b.Den == Math.U256.One) {
				return new Fraction(Add(a, b.Num), Math.U256.One);
			} else {
				return new Fraction(Add(Mul(a, b.Den), b.Num), b.Den);
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Add(in Fraction a, in U256 b) {
			if (a.Den == Math.U256.One) {
				return new Fraction(Add(a.Num, b), Math.U256.One);
			} else {
				return new Fraction(Add(a.Num, Mul(a.Den, b)), a.Den);
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Sub(in Fraction a, in Fraction b) {
			if (a.Den == b.Den) {
				return new Fraction(Sub(a.Num, b.Num), a.Den);
			} else {
				return new Fraction(Sub(Mul(a.Num, b.Den), Mul(a.Den, b.Num)), Mul(a.Den, b.Den));
			}
		}


		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Sub(in U256 a, in Fraction b) {
			if (b.Den == Math.U256.One) {
				return new Fraction(Sub(a, b.Num), Math.U256.One);
			} else {
				return new Fraction(Sub(Mul(a, b.Den), b.Num), b.Den);
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Sub(in Fraction a, in U256 b) {
			if (a.Den == Math.U256.One) {
				return new Fraction(Sub(a.Num, b), Math.U256.One);
			} else {
				return new Fraction(Sub(a.Num, Mul(a.Den, b)), a.Den);
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Neg(in Fraction a) {
			return new Fraction(Neg(a.Num), a.Den);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Mul(in Fraction a, in Fraction b) {
			if (a.IsZero || b.IsZero) return Fraction.Zero;
			return new Fraction(Mul(a.Num, b.Num), Mul(a.Den, b.Den));
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Mul(in Fraction a, in U256 b) {
			if (a.IsZero || b.IsZero) return Fraction.Zero;
			return new Fraction(Mul(a.Num, b), a.Den);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Mul(in U256 a, in Fraction b) {
			if (a.IsZero || b.IsZero) return Fraction.Zero;
			return new Fraction(Mul(a, b.Num), b.Den);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Mul(in Fraction a, ulong b) {
			if (a.IsZero || b == 0) return Fraction.Zero;
			return new Fraction(Mul(a.Num, b), a.Den);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Mul(ulong a, in Fraction b) {
			if (a == 0 || b.IsZero) return Fraction.Zero;
			return new Fraction(Mul(a, b.Num), b.Den);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Div(in Fraction a, in Fraction b) {
			if (a.IsZero || b.IsZero) return Fraction.Zero;
			return new Fraction(Mul(a.Num, b.Den), Mul(a.Den, b.Num));
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Square(in Fraction a) {
			return new Fraction(Square(a.Num), Square(a.Den));
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static bool Equal(in Fraction a, in Fraction b) {
			return Mul(a.Num, b.Den) == Mul(a.Den, b.Num);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static bool Equal(in Fraction a, in U256 b) {
			return a.Num == Mul(a.Den, b);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static bool Equal(in U256 a, in Fraction b) {
			return Mul(a, b.Den) == b.Num;
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static U256 ToU256(in Fraction a) {
			return Div(a.Num, a.Den);
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public static Fraction Mul2(in Fraction a) {
			return new Fraction(Add(a.Num, a.Num), a.Den);
		}

		public static Point Mul2(in Point p) {
			var lambda = Div(Mul(Square(p.X), 3), Mul2(p.Y));
			var x = Sub(Square(lambda), Mul2(p.X));
			var y = Sub(Mul(lambda, Sub(p.X, x)), p.Y);
			return new Point(x, y);
		}

		public static Point Add(in Point p1, in Point p2) {
			if (p1.IsZero) return p2;
			if (p2.IsZero) return p1;
			if (Equal(p1.X, p2.X)) {
				if (Equal(p1.Y, p2.Y)) {
					return Mul2(p1);
				}
				return Point.Zero;
			} else {
				var lambda = Div(Sub(p2.Y, p1.Y), Sub(p2.X, p1.X));
				var x = Sub(Square(lambda), Add(p1.X, p2.X));
				var y = Sub(Mul(lambda, Sub(p1.X, x)), p1.Y);
				return new Point(x, y);
			}
		}

		public static Point FastAdd(in Point p1, in U256 x2, in U256 y2) {
			if (p1.IsZero) return new Point(x2, y2);
			if (Equal(p1.X, x2)) {
				if (Equal(p1.Y, y2)) {
					return Mul2(p1);
				}
				return Point.Zero;
			} else {
				var lambda = Div(Sub(y2, p1.Y), Sub(x2, p1.X));
				var x = Sub(Square(lambda), Add(p1.X, x2));
				var y = Sub(Mul(lambda, Sub(p1.X, x)), p1.Y);
				return new Point(x, y);
			}
		}

		static void Mul(ref Point ret, ref Point temp, ulong n, int bits) {
			for (int i = 0; i < bits - 1; i++) {
				if ((n & (1UL << i)) != 0) ret = Add(ret, temp);
				temp = Mul2(temp);
			}
			if ((n & (1UL << (bits - 1))) != 0) ret = Add(ret, temp);
		}

		static void Mul(ref Point ret, ref Point temp, ulong n) {
			for (int i = 0; i < 64; i++) {
				if ((n & (1UL << i)) != 0) ret = Add(ret, temp);
				temp = Mul2(temp);
			}
		}

		public static Point Mul(in Point p, in U256 n) {
			if (p.IsZero || n.IsZero) return Point.Zero;

			Point ret = Point.Zero, temp = p;
			if (n.v3 != 0) {
				Mul(ref ret, ref temp, n.v0);
				Mul(ref ret, ref temp, n.v1);
				Mul(ref ret, ref temp, n.v2);
				Mul(ref ret, ref temp, n.v3, 64 - lzcnt(n.v3));
			} else if (n.v2 != 0) {
				Mul(ref ret, ref temp, n.v0);
				Mul(ref ret, ref temp, n.v1);
				Mul(ref ret, ref temp, n.v2, 64 - lzcnt(n.v2));
			} else if (n.v1 != 0) {
				Mul(ref ret, ref temp, n.v0);
				Mul(ref ret, ref temp, n.v1, 64 - lzcnt(n.v1));
			} else if (n.v0 != 0) {
				Mul(ref ret, ref temp, n.v0, 64 - lzcnt(n.v0));
			}
			return ret;
		}

		public static Point Neg(in Point p) {
			return new Point(p.X, Neg(p.Y));
		}

		public static bool Equal(in Point p1, in Point p2) {
			if (p1.IsZero && p2.IsZero) return true;
			if (p1.IsZero || p2.IsZero) return false;
			return Equal(p1.X, p2.X) && Equal(p1.Y, p2.Y);
		}

		static readonly U256 Seven = 7;

		public static U256 GetY(in U256 x) {
			return Sqrt(Add(Mul(Square(x), x), Seven));
		}
	}
}

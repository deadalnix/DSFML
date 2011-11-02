module dsfml.graphics.color;

import dsfml.system.utils;

immutable Color black	= Color(0, 0, 0);
immutable Color white	= Color(255, 255, 255);
immutable Color red		= Color(255, 0, 0);
immutable Color green	= Color(0, 255, 0);
immutable Color blue	= Color(0, 0, 255);
immutable Color yellow	= Color(255, 255, 0);
immutable Color magenta	= Color(255, 0, 255);
immutable Color cyan	= Color(0, 255, 255);

struct Color {
	ubyte r;
	ubyte g;
	ubyte b;
	ubyte a = 255;
	
	public this(ubyte red, ubyte green, ubyte blue) {
		r = red;
		g = green;
		b = blue;
	}
	
	public this(ubyte red, ubyte green, ubyte blue, ubyte alpha) {
		this(red, green, blue);
		a = alpha;
	}
	
	public Color opAdd(const Color other) const {
		static if(sseAvailable) {
			auto thisptr	= &this;
			Color ret		= void;
			
			version(D_InlineAsm_X86) {
				asm {
					mov EAX, thisptr;
					movss XMM0, [EAX];	// XMM0 is this
					movss XMM1, other;	// XMM1 is other
					paddusb XMM0, XMM1;	// Saturated addition
					movss ret, XMM0;	// Save result to ret
				}
			} else version(D_InlineAsm_X86_64) {
				asm {
					mov RAX, thisptr;
					movss XMM0, [RAX];	// XMM0 is this
					movss XMM1, other;	// XMM1 is other
					paddusb XMM0, XMM1;	// Saturated addition
					movss ret, XMM0;	// Save result to ret
				}
			}
			
			return ret;
		} else {
			return Color(sadd(r, other.r), sadd(g, other.g), sadd(b, other.b), sadd(a, other.a));
		}
	}
	
	public ref Color opAddAssign(const Color other) {
		static if(sseAvailable) {
			auto thisptr	= &this;
			
			version(D_InlineAsm_X86) {
				asm {
					mov EAX, thisptr;
					movss XMM0, [EAX];	// XMM0 is this
					movss XMM1, other;	// XMM1 is other
					paddusb XMM0, XMM1;	// Saturated addition
					movss [EAX], XMM0;	// Save result to this
				}
			} else version(D_InlineAsm_X86_64) {
				asm {
					mov RAX, thisptr;
					movss XMM0, [RAX];	// XMM0 is this
					movss XMM1, other;	// XMM1 is other
					paddusb XMM0, XMM1;	// Saturated addition
					movss [RAX], XMM0;	// Save result to this
				}
			}
		} else {
			r = sadd(r, other.r);
			g = sadd(g, other.g);
			b = sadd(b, other.b);
			a = sadd(a, other.a);
		}
		
		return this;
	}
	
	// TODO: consider how to do this with MMX/SSE instructions
	// PUNPCKLBW can probably help here
	public Color opMul(const Color other) const {
		static if(sseAvailable) {
			auto thisptr	= &this;
			ushort[4] ret;
			
			version(D_InlineAsm_X86) {
				asm {
					mov EAX, thisptr;
					movss XMM0, [EAX];		// XMM0 is this
					movss XMM1, other;		// XMM1 is other
					xorps XMM2, XMM2;		// XMM2 is 0
					punpcklbw XMM0, XMM2;	// XMM0 contains this packed as ushort[4]
					punpcklbw XMM1, XMM2;	// XMM1 other this packed as ushort[4]
					pmullw XMM0, XMM1;		// XMM0 contains the multiplication of the two colors.
					movq ret, XMM0;
				}
			} else version(D_InlineAsm_X86_64) {
				asm {
					mov RAX, thisptr;
					movss XMM0, [RAX];		// XMM0 is this
					movss XMM1, other;		// XMM1 is other
					xorps XMM2, XMM2;		// XMM2 is 0
					punpcklbw XMM0, XMM2;	// XMM0 contains this packed as ushort[4]
					punpcklbw XMM1, XMM2;	// XMM1 other this packed as ushort[4]
					pmullw XMM0, XMM1;		// XMM0 contains the multiplication of the two colors.
					movq ret, XMM0;
				}
			}
			
			return Color(cast(ubyte) (ret[0] / 255), cast(ubyte) (ret[1] / 255), cast(ubyte) (ret[2] / 255), cast(ubyte) (ret[3] / 255));
		} else {
			return Color(modulate(r, other.r), modulate(g, other.g), modulate(b, other.b), modulate(a, other.a));
		}
	}
	
	public ref Color opMulAssign(const Color other) {
		static if(sseAvailable) {
			auto thisptr	= &this;
			ushort[4] ret;
			
			version(D_InlineAsm_X86) {
				asm {
					mov EAX, thisptr;
					movss XMM0, [EAX];		// XMM0 is this
					movss XMM1, other;		// XMM1 is other
					xorps XMM2, XMM2;		// XMM2 is 0
					punpcklbw XMM0, XMM2;	// XMM0 contains this packed as ushort[4]
					punpcklbw XMM1, XMM2;	// XMM1 other this packed as ushort[4]
					pmullw XMM0, XMM1;		// XMM0 contains the multiplication of the two colors.
					movq ret, XMM0;
				}
			} else version(D_InlineAsm_X86_64) {
				asm {
					mov RAX, thisptr;
					movss XMM0, [RAX];		// XMM0 is this
					movss XMM1, other;		// XMM1 is other
					xorps XMM2, XMM2;		// XMM2 is 0
					punpcklbw XMM0, XMM2;	// XMM0 contains this packed as ushort[4]
					punpcklbw XMM1, XMM2;	// XMM1 other this packed as ushort[4]
					pmullw XMM0, XMM1;		// XMM0 contains the multiplication of the two colors.
					movq ret, XMM0;
				}
			}
			
			// Sadly, no SIMD instruction for integer division.
			r = cast(ubyte) (ret[0] / 255);
			g = cast(ubyte) (ret[1] / 255);
			b = cast(ubyte) (ret[2] / 255);
			a = cast(ubyte) (ret[3] / 255);
		} else {
			r = modulate(r, other.r);
			g = modulate(g, other.g);
			b = modulate(b, other.b);
			a = modulate(a, other.a);
		}
		
		return this;
	}
}

unittest {
	// TODO: add moar unitests
	Color c = black;
	assert((c += white) == white);
	c= magenta;
	assert((c += cyan) == white);
	
	assert((black + white) == white);
	assert((magenta + cyan) == white);
	
	assert((magenta * cyan) == blue);
	c = magenta;
	assert((c *= cyan) == blue);
}


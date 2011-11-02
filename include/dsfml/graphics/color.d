module dsfml.graphics.color;

import csfml.graphics.color;

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
			auto ret		= Color();
			
			version(D_InlineAsm_X86) {
				asm {
					mov EAX, thisptr;
					movss XMM0, [EAX];
					movss XMM1, other;
					paddusb XMM0, XMM1;
					movss ret, XMM0;
				}
			} else version(D_InlineAsm_X86_64) {
				asm {
					mov RAX, thisptr;
					movss XMM0, [RAX];
					movss XMM1, other;
					paddusb XMM0, XMM1;
					movss ret, XMM0;
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
					movss XMM0, [EAX];
					movss XMM1, other;
					paddusb XMM0, XMM1;
					movss [EAX], XMM0;
				}
			} else version(D_InlineAsm_X86_64) {
				asm {
					mov RAX, thisptr;
					movss XMM0, [RAX];
					movss XMM1, other;
					paddusb XMM0, XMM1;
					movss [RAX], XMM0;
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
	public Color opMul(const Color other) const {
		return Color(modulate(r, other.r), modulate(g, other.g), modulate(b, other.b), modulate(a, other.a));
	}
	
	public ref Color opMulAssign(const Color other) {
		r = modulate(r, other.r);
		g = modulate(g, other.g);
		b = modulate(b, other.b);
		a = modulate(a, other.a);
		
		return this;
	}
}

unittest {
	import std.stdio;
	
	Color c = black;
	assert((c += white) == white);
	c= magenta;
	assert((c += cyan) == white);
	
	assert((black + white) == white);
	assert((magenta + cyan) == white);
	
	writeln("OK");
}



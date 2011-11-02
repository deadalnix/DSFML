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

immutable bool sseAvailable = is(typeof({void* foo; asm { mov EAX, foo; movups XMM0, [EAX]; } }));

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
		auto thisptr	= &this;
		auto ret		= Color();
		
		asm {
			mov RAX, thisptr;
			movss XMM0, [RAX];
			movss XMM1, other;
			paddusb XMM0, XMM1;
			movss ret, XMM0;
		}
		
		return ret;
	}
	
	public ref Color opAddAssign(const Color other) {
		auto thisptr	= &this;
		
		asm {
			mov RAX, thisptr;
			movss XMM0, [RAX];
			movss XMM1, other;
			paddusb XMM0, XMM1;
			movss [RAX], XMM0;
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



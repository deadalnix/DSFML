module dsfml.graphics.color;

import csfml.graphics.color;

import dsfml.system.utils;

struct Color {
align(1):
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
		return Color(sadd(r, other.r), sadd(g, other.g), sadd(b, other.b), sadd(a, other.a));
	}
	
	public ref Color opAddAssign(const Color other) {
		r = sadd(r, other.r);
		g = sadd(g, other.g);
		b = sadd(b, other.b);
		a = sadd(a, other.a);
		
		return this;
	}
	
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


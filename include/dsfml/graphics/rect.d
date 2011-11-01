module dsfml.graphics.rect;

import csfml.graphics.rect;

import std.traits;

struct Rect(T) if(isNumeric!(T)) {
	T left		= 0;
	T top		= 0;
	T width		= 0;
	T height	= 0;
	
	public this(T left, T top, T width, T height) {
		this.left	= left;
		this.top	= top;
		this.width	= width;
		this.height	= height;
	}
	
	public this(const T[2] position, const T[2] size) {
		this.left	= position[0];
		this.top	= position[1];
		this.width	= size[0];
		this.height	= size[1];
	}
}

alias Rect!(int) IntRect;
alias Rect!(float) FloatRect;


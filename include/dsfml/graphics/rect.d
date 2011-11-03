module dsfml.graphics.rect;

import std.traits;
import std.algorithm;

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
	
	public bool contains(const ref T[2] position) const {
		return this.contains(position[0], position[1]);
	}
	
	public bool contains(const T x, const T y) const {
		return (x >= left) && (x <= (left + width)) && (x >= top) && (x <= (top + height));
	}
	
	public bool intersect(const ref Rect!(T) rectangle) const {
		Rect!(T) intersection = void;
		return intersect(rectangle, intersection);
	}
	
	public bool intersect(const ref Rect!(T) rectangle, ref Rect!(T) intersection) const {
		// Compute the intersection boundaries
		T ileft		= max(left, rectangle.left);
		T itop		= max(top, rectangle.top);
		T iright	= min(left + width, rectangle.left + rectangle.width);
		T ibottom	= min(top + height, rectangle.top + rectangle.height);
		
		// If the intersection is valid (positive non zero area), then there is an intersection
		if ((ileft < iright) && (itop < ibottom)) {
			intersection = Rect!(T)(ileft, itop, iright - ileft, ibottom - itop);
			return true;
		} else {
			intersection = Rect!(T)(0, 0, 0, 0);
			return false;
		}
	}
}

alias Rect!(int) IntRect;
alias Rect!(float) FloatRect;


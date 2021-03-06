module dsfml.graphics.rect;

import std.traits;
import std.algorithm;

struct Rect(T) if(isNumeric!(T)) {
	T left		= 0;
	T top		= 0;
	T width		= 0;
	T height	= 0;
	
	static if(is(T == int)) {
		@property
		package final ref inout(sfIntRect) rect() inout {
			return *(cast(inout(sfIntRect)*) &this);
		}
	} else static if(is(T == float)) {
		@property
		package final ref inout(sfFloatRect) rect() inout {
			return *(cast(inout(sfFloatRect)*) &this);
		}
	}
	
	this()(T left, T top, T width, T height) {
		this.left	= left;
		this.top	= top;
		this.width	= width;
		this.height	= height;
	}
	
	this()(ref const T[2] position, ref const T[2] size) {
		left	= position[0];
		top		= position[1];
		width	= size[0];
		height	= size[1];
	}
	
	this(U)(ref const Rect!U rectangle) {
		left	= cast(T) rectangle.left;
		top		= cast(T) rectangle.top;
		width	= cast(T) rectangle.width;
		height	= cast(T) rectangle.height;
	}
	
	bool contains(ref const T[2] position) const {
		return this.contains(position[0], position[1]);
	}
	
	bool contains(const T x, const T y) const {
		return (x >= left) && (x <= (left + width)) && (x >= top) && (x <= (top + height));
	}
	
	bool intersect(ref const Rect!(T) rectangle) const {
		Rect!(T) intersection = void;
		return intersect(rectangle, intersection);
	}
	
	bool intersect(ref const Rect!(T) rectangle, ref Rect!(T) intersection) const {
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

package extern(C++) {
	struct sfIntRect {
		void[IntRect.sizeof] data = void;
		
		@property
		package final ref inout(IntRect) rect() inout {
			return *(cast(inout(IntRect)*) &this);
		}
	}
	
	struct sfFloatRect {
		void[FloatRect.sizeof] data = void;
		
		@property
		package final ref inout(FloatRect) rect() inout {
			return *(cast(inout(FloatRect)*) &this);
		}
	}
}


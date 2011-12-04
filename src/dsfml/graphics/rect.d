module dsfml.graphics.rect;

import std.traits;
import std.algorithm;

struct Rect(T) if(isNumeric!(T)) {
	T left		= 0;
	T top		= 0;
	T width		= 0;
	T height	= 0;
	
	static if(is(T == int)) {
		// TODO: Go inout for D2.056
		@property
		package final ref sfIntRect rect() {
			return *(cast(sfIntRect*) &this);
		}
	
		@property
		package final ref const(sfIntRect) rect() const {
			return *(cast(const(sfIntRect)*) &this);
		}
	} else static if(is(T == float)) {
		// TODO: Go inout for D2.056
		@property
		package final ref sfFloatRect rect() {
			return *(cast(sfFloatRect*) &this);
		}
	
		@property
		package final ref const(sfFloatRect) rect() const {
			return *(cast(const(sfFloatRect)*) &this);
		}
	}
	
	this(T left, T top, T width, T height) {
		this.left	= left;
		this.top	= top;
		this.width	= width;
		this.height	= height;
	}
	
	this(const T[2] position, const T[2] size) {
		this.left	= position[0];
		this.top	= position[1];
		this.width	= size[0];
		this.height	= size[1];
	}
	
	bool contains(const T[2] position) const {
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
		
		// TODO: Go inout for D2.056
		// Non const isn't possible due to a compiler mangling bug.
		@property
		package final ref const(IntRect) rect() const {
			return *(cast(const(IntRect)*) &this);
		}
	}
	
	struct sfFloatRect {
		void[FloatRect.sizeof] data = void;
		
		// TODO: Go inout for D2.056
		// Non const isn't possible due to a compiler mangling bug.
		@property
		package final ref const(FloatRect) rect() const {
			return *(cast(const(FloatRect)*) &this);
		}
	}
}


module dsfml.graphics.vertex;

import dsfml.graphics.color;

struct Vertex {
	float[2] position;
	Color color = white;
	float[2] texCoords;
	
	this(ref const float[2] position) {
		this.position	= position;
	}
	
	this(ref const float[2] position, ref const Color color) {
		this.position	= position;
		this.color		= color;
	}
	
	this(ref const float[2] position, ref const float[2] texCoords) {
		this.position	= position;
		this.texCoords	= texCoords;
	}
	
	this(ref const float[2] position, ref const Color color, ref const float[2] texCoords) {
		this.position	= position;
		this.color		= color;
		this.texCoords	= texCoords;
	}
}

package extern(C++) {
	struct sfVertex {
		void[Vertex.sizeof] data = void;
		
		@property
		ref inout Vertex vertex() inout {
			return *(cast(Vertex*) &this);
		}
	}
}


module dsfml.window.contextsettings;

struct ContextSettings {
	uint depthBits;
	uint stencilBits;
	uint antialiasingLevel;
	uint majorVersion = 2;
	uint minorVersion;
	
	@property
	package final ref inout(sfContextSettings) settings() inout {
		return *(cast(inout(sfContextSettings)*) &this);
	}
	
	this(uint depth = 0, uint stencil = 0, uint antialiasing = 0, uint major = 2, uint minor = 0) {
		depthBits			= depth;
		stencilBits			= stencil;
		antialiasingLevel	= antialiasing;
		majorVersion		= major;
		minorVersion		= minor;
	}
}

package extern(C++) {
	struct sfContextSettings {
		void[ContextSettings.sizeof] data = void;
		
		@property
		package final ref inout(ContextSettings) settings() inout {
			return *(cast(inout(ContextSettings)*) &this);
		}
	}
}


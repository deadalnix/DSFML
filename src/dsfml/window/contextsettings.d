module dsfml.window.contextsettings;

struct ContextSettings {
	uint depthBits;
	uint stencilBits;
	uint antialiasingLevel;
	uint majorVersion = 2;
	uint minorVersion;
	
	// TODO: Go inout for D2.056
	@property
	package final ref sfContextSettings settings() {
		return *(cast(sfContextSettings*) &this);
	}
	
	@property
	package final ref const(sfContextSettings) settings() const {
		return *(cast(const(sfContextSettings)*) &this);
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
		package final ref const(ContextSettings) settings() const {
			return *(cast(ContextSettings*) &this);
		}
	}
}


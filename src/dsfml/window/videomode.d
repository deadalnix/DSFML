module dsfml.window.videomode;

struct VideoMode {
	uint width;
	uint height;
	uint bitsPerPixel;
	
	// TODO: Go inout for D2.056
	@property
	package final ref sfVideoMode videoMode() {
		return *(cast(sfVideoMode*) &this);
	}
	
	@property
	package final ref const(sfVideoMode) videoMode() const {
		return *(cast(const(sfVideoMode)*) &this);
	}
	
	this(uint width, uint height, uint bitsPerPixel = 32) {
		this.width			= width;
		this.height			= height;
		this.bitsPerPixel	= bitsPerPixel;
	}
	
	@property
	bool valid() const {
		return sfVideoMode_IsValid(videoMode);
	}
	
	int opCmp(ref const VideoMode other) {
		if(bitsPerPixel == other.bitsPerPixel) {
			if(width == other.width) {
				return height > other.height;
			} else {
				return width > other.width;
			}
		} else {
			return bitsPerPixel > other.bitsPerPixel;
		}
	} 
}

@property
VideoMode desktopMode() {
	return sfVideoMode_GetDesktopMode().videoMode;
}

immutable VideoMode[] fullscreenModes;

static this() {
	size_t count;
	immutable VideoMode* modes = cast(immutable VideoMode*) sfVideoMode_GetFullscreenModes(&count);
	fullscreenModes = modes[0 .. count];
}

package extern(C++) {
	struct sfVideoMode {
		void[VideoMode.sizeof] data = void;
		
		// TODO: Go inout for D2.056
		// Non const isn't possible due to a compiler mangling bug.
		@property
		package final ref const(VideoMode) videoMode() const {
			return *(cast(const(VideoMode)*) &this);
		}
	}
	
	bool sfVideoMode_IsValid(ref const sfVideoMode videoMode);
	sfVideoMode sfVideoMode_GetDesktopMode();
	const(sfVideoMode)* sfVideoMode_GetFullscreenModes(size_t* count);
}


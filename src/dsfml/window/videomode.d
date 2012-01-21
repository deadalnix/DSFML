module dsfml.window.videomode;

struct VideoMode {
	uint width;
	uint height;
	uint bitsPerPixel;
	
	@property
	package final ref inout(sfVideoMode) videoMode() inout {
		return *(cast(inout(sfVideoMode)*) &this);
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
		
		@property
		package final ref inout(VideoMode) videoMode() inout {
			return *(cast(inout(VideoMode)*) &this);
		}
	}
	
	bool sfVideoMode_IsValid(ref const sfVideoMode videoMode);
	sfVideoMode sfVideoMode_GetDesktopMode();
	const(sfVideoMode)* sfVideoMode_GetFullscreenModes(size_t* count);
}


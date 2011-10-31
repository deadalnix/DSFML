module dsfml.window.videomode;

import csfml.window.videomode;

struct VideoMode {
	uint width;
	uint height;
	uint bitsPerPixel;
	
	public this(uint width, uint height, uint bitsPerPixel = 32) {
		this.width			= width;
		this.height			= height;
		this.bitsPerPixel	= bitsPerPixel;
	}
	
	public bool isValid() {
		return sfVideoMode_IsValid(cast(sfVideoMode) this);
	}
	
	public static VideoMode getDesktopMode() {
		return cast(VideoMode) sfVideoMode_GetDesktopMode();
	}
	
	public static immutable(VideoMode[]) getFullscreenModes() {
        size_t count;
        VideoMode* cmodes = cast(VideoMode*) sfVideoMode_GetFullscreenModes(&count);
        
		return cmodes[0 .. count].idup;
	}
}


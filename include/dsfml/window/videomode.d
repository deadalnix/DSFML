module dsfml.window.videomode;

import csfml.window.videomode;

// FIXME: this is so fucked up.
struct VideoMode {
	ulong width;
	ulong height;
	ulong bitsPerPixel;
	
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
	
	public static VideoMode[] getFullscreenModes() {
		// TODO: implement that.
		return null;
	}
}


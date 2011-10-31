module csfml.window.videomode;

struct sfVideoMode {
	uint width;
	uint height;
	uint bitsPerPixel;
}

extern(C) {
	sfVideoMode sfVideoMode_GetDesktopMode();
	sfVideoMode* sfVideoMode_GetFullscreenModes(size_t* count);
	bool sfVideoMode_IsValid(sfVideoMode mode);
}


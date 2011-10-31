module csfml.window.videomode;

struct sfVideoMode {
	uint Width;
	uint Height;
	uint BitsPerPixel;
}

extern(C) {
	sfVideoMode sfVideoMode_GetDesktopMode();
	sfVideoMode* sfVideoMode_GetFullscreenModes(size_t* count);
	bool sfVideoMode_IsValid(sfVideoMode mode);
}


module csfml.window.window;

public import csfml.window.types;

import csfml.window.event;
import csfml.window.videomode;
import csfml.window.windowhandle;

immutable uint sfNone = 0;
immutable uint sfTitlebar = 1 << 0;
immutable uint sfResize = 1 << 1;
immutable uint sfClose = 1 << 2;
immutable uint sfFullscreen = 1 << 3;
immutable uint sfDefaultStyle = sfTitlebar | sfResize | sfClose;

struct sfContextSettings {
	uint depthBits			= 0;
	uint stencilBits		= 0;
	uint antialiasingLevel	= 0;
	uint majorVersion		= 2;
	uint minorVersion		= 0;
}

extern(C) {
	sfWindow* sfWindow_Create(sfVideoMode mode, const char* title, ulong style, const sfContextSettings* settings);
	sfWindow* sfWindow_CreateFromHandle(sfWindowHandle handle, const sfContextSettings* settings);
	void sfWindow_Destroy(sfWindow* window);
	void sfWindow_Close(sfWindow* window);
	bool sfWindow_IsOpened(const sfWindow* window);
	uint sfWindow_GetWidth(const sfWindow* window);
	uint sfWindow_GetHeight(const sfWindow* window);
	sfContextSettings sfWindow_GetSettings(const sfWindow* window);
	bool sfWindow_PollEvent(sfWindow* window, sfEvent* event);
	bool sfWindow_WaitEvent(sfWindow* window, sfEvent* event);
	void sfWindow_EnableVerticalSync(sfWindow* window, bool enabled);
	void sfWindow_ShowMouseCursor(sfWindow* window, bool show);
	void sfWindow_SetPosition(sfWindow* window, int left, int top);
	void sfWindow_SetSize(sfWindow* window, uint width, uint height);
	void sfWindow_SetTitle(sfWindow* window, const char* title);
	void sfWindow_Show(sfWindow* window, bool show);
	void sfWindow_EnableKeyRepeat(sfWindow* window, bool enabled);
	void sfWindow_SetIcon(sfWindow* window, uint width, uint height, const ubyte* pixels);
	bool sfWindow_SetActive(sfWindow* window, bool active);
	void sfWindow_Display(sfWindow* window);
	void sfWindow_SetFramerateLimit(sfWindow* window, uint limit);
	uint sfWindow_GetFrameTime(const sfWindow* window);
	void sfWindow_SetJoystickThreshold(sfWindow* window, float threshold);
	sfWindowHandle sfWindow_GetSystemHandle(const sfWindow* window);
}


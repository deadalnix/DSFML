module dsfml.window.window;

import csfml.window.window;
import csfml.window.videomode;

import dsfml.window.videomode;
import dsfml.window.windowhandle;

import std.string;

class Window {
	private sfWindow* window;
	
	public this(VideoMode mode, string title, uint style = sfDefaultStyle, ref const sfContextSettings settings = sfContextSettings()) {
		window = sfWindow_Create(cast(sfVideoMode) mode, toStringz(title), style, &settings);
	}
	
	public this(WindowHandle handle, ref const sfContextSettings settings = sfContextSettings()) {
		window = sfWindow_CreateFromHandle(handle, &settings);
	}
	
	public ~this() {
		sfWindow_Destroy(window);
	}
	
	public sfWindow* getCWindow() {
		return window;
	}
	
	public const(sfWindow*) getCWindow() const {
		return window;
	}
	
	/*
	void sfWindow_Close(window);
	bool sfWindow_IsOpened(const window);
	uint sfWindow_GetWidth(const window);
	uint sfWindow_GetHeight(const window);
	sfContextSettings sfWindow_GetSettings(const window);
	bool sfWindow_PollEvent(window, sfEvent* event);
	bool sfWindow_WaitEvent(window, sfEvent* event);
	void sfWindow_EnableVerticalSync(window, bool enabled);
	void sfWindow_ShowMouseCursor(window, bool show);
	void sfWindow_SetPosition(window, int left, int top);
	void sfWindow_SetSize(window, uint width, uint height);
	void sfWindow_SetTitle(window, const char* title);
	void sfWindow_Show(window, bool show);
	void sfWindow_EnableKeyRepeat(window, bool enabled);
	void sfWindow_SetIcon(window, uint width, uint height, const sfUint8* pixels);
	bool sfWindow_SetActive(window, bool active);
	void sfWindow_Display(window);
	void sfWindow_SetFramerateLimit(window, uint limit);
	sfUint32 sfWindow_GetFrameTime(const window);
	void sfWindow_SetJoystickThreshold(window, float threshold);
	sfWindowHandle sfWindow_GetSystemHandle(const window);
	*/
}


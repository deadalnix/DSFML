module dsfml.window.window;

import dsfml.window.contextsettings;
import dsfml.window.event;
import dsfml.window.videomode;
import dsfml.window.windowhandle;
import dsfml.window.windowstyle;
import dsfml.sizes;

import std.conv;
import std.string;

class Window {
	private void[windowSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfWindow* window() {
		return cast(sfWindow*) data.ptr;
	}
	
	@property
	package final const(sfWindow)* window() const {
		return cast(const(sfWindow)*) data.ptr;
	}
	
	this() {
		sfWindow_Create(window);
	}
	
	this(VideoMode mode, string title, uint style = Style.Default, ref const ContextSettings settings = ContextSettings()) {
		this();
		
		create(mode, title, style, settings);
	}
	
	this(WindowHandle handle, ref const ContextSettings settings = ContextSettings()) {
		this();
		
		create(handle, settings);
	}
	
	~this() {
		sfWindow_Destroy(window);
	}
	
	final void create(VideoMode mode, string title, uint style = Style.Default, ref const ContextSettings settings = ContextSettings()) {
		sfWindow_Create(window, mode.videoMode, toStringz(title), style, settings.settings);
	}
	
	final void create(WindowHandle handle, ref const ContextSettings settings = ContextSettings()) {
		sfWindow_Create(window, handle, settings.settings);
	}
	
	final void close() {
		sfWindow_Close(window);
	}
	
	@property
	final bool opened() const {
		return sfWindow_IsOpened(window);
	}
	
	@property
	final uint width() const {
		return sfWindow_GetWidth(window);
	}
	
	@property
	final uint height() const {
		return sfWindow_GetHeight(window);
	}
	
	@property
	final ref const(ContextSettings) settings() const {
		return sfWindow_GetSettings(window).settings;
	}
	
	final bool pollEvent(ref Event event) {
		return sfWindow_PollEvent(window, event.event);
	}
	
	final bool waitEvent(ref Event event) {
		return sfWindow_WaitEvent(window, event.event);
	}
	
	final void enableVerticalSync(bool enabled) {
		sfWindow_EnableVerticalSync(window, enabled);
	}
	
	final void showMouseCursor(bool show) {
		sfWindow_ShowMouseCursor(window, show);
	}
	
	final void setPosition(int x, int y) {
		sfWindow_SetPosition(window, x, y);
	}
	
	final void setSize(uint width, uint height) {
		sfWindow_SetSize(window, width, height);
	}
	
	@property
	final void title(string title) {
		sfWindow_SetTitle(window, toStringz(title));
	}
	
	final void show(bool show) {
		sfWindow_Show(window, show);
	}
	
	final void enableKeyRepeat(bool enabled) {
		sfWindow_EnableKeyRepeat(window, enabled);
	}
	
	final void setIcon(uint width, uint height, const ubyte[] pixels) in {
		assert(pixels.length == (width * height * 4), "pixels length (" ~ to!string(pixels.length) ~ ") isn't what is expected (" ~ to!string(width * height * 4) ~ ").");
	} body {
		sfWindow_SetIcon(window, width, height, pixels.ptr);
	}
	
	final bool setActive(bool active) const {
		return sfWindow_SetActive(window, active);
	}
	
	final void display() {
		sfWindow_Display(window);
	}
	
	@property
	final void frameRateLimit(uint limit) {
		sfWindow_SetFramerateLimit(window, limit);
	}
	
	@property
	final uint frameTime() const {
		return sfWindow_GetFrameTime(window);
	}
	
	@property
	final void joystickThreshold(float threshold) {
		sfWindow_SetJoystickThreshold(window, threshold);
	}
	
	@property
	final WindowHandle windowHandle() const {
		return sfWindow_GetSystemHandle(window);
	}
}

package extern(C++) {
	struct sfWindow {
		void[windowSize] data = void;
	}
	
	void sfWindow_Create(sfWindow* window);
	void sfWindow_Destroy(sfWindow* window);
	
	void sfWindow_Create(sfWindow* window, sfVideoMode mode, const char* title, uint style, ref const sfContextSettings settings);
	void sfWindow_Create(sfWindow* window, WindowHandle handle, ref const sfContextSettings settings);
	
	void sfWindow_Close(sfWindow* window);
	
	bool sfWindow_IsOpened(const sfWindow* window);
	uint sfWindow_GetWidth(const sfWindow* window);
	uint sfWindow_GetHeight(const sfWindow* window);
	
	ref const(sfContextSettings) sfWindow_GetSettings(const sfWindow* window);
	
	bool sfWindow_PollEvent(sfWindow* window, ref sfEvent event);
	bool sfWindow_WaitEvent(sfWindow* window, ref sfEvent event);
	
	void sfWindow_EnableVerticalSync(sfWindow* window, bool enabled);
	void sfWindow_ShowMouseCursor(sfWindow* window, bool show);
	
	void sfWindow_SetPosition(sfWindow* window, int x, int y);
	void sfWindow_SetSize(sfWindow* window, uint width, uint height);
	void sfWindow_SetTitle(sfWindow* window, const char* title);
	
	void sfWindow_Show(sfWindow* window, bool show);
	void sfWindow_EnableKeyRepeat(sfWindow* window, bool enabled);
	void sfWindow_SetIcon(sfWindow* window, uint width, uint height, const ubyte* pixels);
	bool sfWindow_SetActive(const sfWindow* window, bool active);
	void sfWindow_Display(sfWindow* window);
	
	void sfWindow_SetFramerateLimit(sfWindow* window, uint limit);
	uint sfWindow_GetFrameTime(const sfWindow* window);
	void sfWindow_SetJoystickThreshold(sfWindow* window, float threshold);
	WindowHandle sfWindow_GetSystemHandle(const sfWindow* window);
}


module dsfml.window.window;

import csfml.window.event;
import csfml.window.window;
import csfml.window.videomode;

import dsfml.window.event;
import dsfml.window.videomode;
import dsfml.window.windowhandle;

import std.string;

class Window {
	private sfWindow* window;
	
	public this(VideoMode mode, string title, uint style = sfDefaultStyle, ref const sfContextSettings settings = sfContextSettings()) {
		create(mode, title, style, settings);
	}
	
	public this(WindowHandle handle, ref const sfContextSettings settings = sfContextSettings()) {
		create(handle, settings);
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
	
	public void create(VideoMode mode, string title, uint style = sfDefaultStyle, ref const sfContextSettings settings = sfContextSettings()) {
		if(window != null) sfWindow_Destroy(window);
		
		window = sfWindow_Create(cast(sfVideoMode) mode, toStringz(title), style, &settings);
	}
	
	public void create(WindowHandle handle, ref const sfContextSettings settings = sfContextSettings()) {
		if(window != null) sfWindow_Destroy(window);
		
		window = sfWindow_CreateFromHandle(handle, &settings);
	}
	
	public void close() {
		sfWindow_Close(window);
	}
	
	public bool isOpened() const {
		return sfWindow_IsOpened(window);
	}
	
	public uint getWidth() const {
		return sfWindow_GetWidth(window);
	}
	
	public uint getHeight() const {
		return sfWindow_GetHeight(window);
	}
	
	public sfContextSettings getSettings() const {
		return sfWindow_GetSettings(window);
	}
	
	public bool pollEvet(ref Event event) {
		return sfWindow_PollEvent(window, cast(sfEvent*) &event);
	}
	
	public bool waitEvet(ref Event event) {
		return sfWindow_WaitEvent(window, cast(sfEvent*) &event);
	}
	
	public void enableVerticalSync(bool enabled) {
		sfWindow_EnableVerticalSync(window, enabled);
	}
	
	public void showMouseCursor(bool show) {
		sfWindow_ShowMouseCursor(window, show);
	}
	
	public void setPosition(int x, int y) {
		sfWindow_SetPosition(window, x, y);
	}
	
	public void setSize(uint width, uint height) {
		sfWindow_SetSize(window, width, height);
	}
	
	public void setTitle(string title) {
		sfWindow_SetTitle(window, toStringz(title));
	}
	
	public void show(bool show) {
		sfWindow_Show(window, show);
	}
	
	public void enableKeyRepeat(bool enabled) {
		sfWindow_EnableKeyRepeat(window, enabled);
	}
	
	public void setIcon(uint width, uint height, const ubyte[] pixels) {
		sfWindow_SetIcon(window, width, height, pixels.ptr);
	}
	
	public bool setActive(bool active) {
		return sfWindow_SetActive(window, active);
	}
	
	public void display() {
		sfWindow_Display(window);
	}
	
	public void setFrameRateLimit(uint limit) {
		sfWindow_SetFramerateLimit(window, limit);
	}
	
	public uint getFrameTime() const {
		return sfWindow_GetFrameTime(window);
	}
	
	public void setJoystickThreshold(float threshold) {
		sfWindow_SetJoystickThreshold(window, threshold);
	}
	
	public WindowHandle getWindowHandle() const {
		return sfWindow_GetSystemHandle(window);
	}
}


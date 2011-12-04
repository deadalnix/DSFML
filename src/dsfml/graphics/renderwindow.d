module dsfml.graphics.renderwindow;

import dsfml.window.event;
import dsfml.window.videomode;
import dsfml.window.window;
import dsfml.window.windowhandle;
import dsfml.sizes;

import core.stdc.config;
import std.string;

class RenderWindow : Window {
	private void[renderWindowSize - windowSize] data = void;
	
	/*
	private sfRenderWindow* renderWindow;
	
	public this(VideoMode mode, string title, uint style = sfDefaultStyle, const ref sfContextSettings settings = sfContextSettings()) {
		create(mode, title, style, settings);
	}
	
	public this(WindowHandle handle, const ref sfContextSettings settings = sfContextSettings()) {
		create(handle, settings);
	}
	
	public ~this() {
		sfRenderWindow_Destroy(renderWindow);
	}
	
	// TODO: use inout as of D2.056
	public const(sfWindow*) getCWindow() const {
		throw new Exception("Invalid on this object.");
	}
	
	public immutable(sfWindow*) getCWindow() immutable {
		throw new Exception("Invalid on this object.");
	}
	
	public sfWindow* getCWindow() {
		throw new Exception("Invalid on this object.");
	}
	
	public void create(VideoMode mode, string title, uint style = sfDefaultStyle, const ref sfContextSettings settings = sfContextSettings()) {
		if(renderWindow != null) sfRenderWindow_Destroy(renderWindow);
		
		renderWindow = sfRenderWindow_Create(cast(sfVideoMode) mode, toStringz(title), style, &settings);
	}
	
	public void create(WindowHandle handle, const ref sfContextSettings settings = sfContextSettings()) {
		if(renderWindow != null) sfRenderWindow_Destroy(renderWindow);
		
		renderWindow = sfRenderWindow_CreateFromHandle(handle, &settings);
	}
	
	public void close() {
		sfRenderWindow_Close(renderWindow);
	}
	
	public bool isOpened() const {
		return sfRenderWindow_IsOpened(renderWindow);
	}
	
	public uint getWidth() const {
		return sfRenderWindow_GetWidth(renderWindow);
	}
	
	public uint getHeight() const {
		return sfRenderWindow_GetHeight(renderWindow);
	}
	
	public sfContextSettings getSettings() const {
		return sfRenderWindow_GetSettings(renderWindow);
	}
	
	public bool pollEvet(ref Event event) {
		return sfRenderWindow_PollEvent(renderWindow, cast(sfEvent*) &event);
	}
	
	public bool waitEvet(ref Event event) {
		return sfRenderWindow_WaitEvent(renderWindow, cast(sfEvent*) &event);
	}
	
	public void enableVerticalSync(bool enabled) {
		sfRenderWindow_EnableVerticalSync(renderWindow, enabled);
	}
	
	public void showMouseCursor(bool show) {
		sfRenderWindow_ShowMouseCursor(renderWindow, show);
	}
	
	public void setPosition(int x, int y) {
		sfRenderWindow_SetPosition(renderWindow, x, y);
	}
	
	public void setSize(uint width, uint height) {
		sfRenderWindow_SetSize(renderWindow, width, height);
	}
	
	public void setTitle(string title) {
		sfRenderWindow_SetTitle(renderWindow, toStringz(title));
	}
	
	public void show(bool show) {
		sfRenderWindow_Show(renderWindow, show);
	}
	
	public void enableKeyRepeat(bool enabled) {
		sfRenderWindow_EnableKeyRepeat(renderWindow, enabled);
	}
	
	public void setIcon(uint width, uint height, const ubyte[] pixels) {
		sfRenderWindow_SetIcon(renderWindow, width, height, pixels.ptr);
	}
	
	public bool setActive(bool active) {
		return sfRenderWindow_SetActive(renderWindow, active);
	}
	
	public void display() {
		sfRenderWindow_Display(renderWindow);
	}
	
	public void setFrameRateLimit(uint limit) {
		sfRenderWindow_SetFramerateLimit(renderWindow, limit);
	}
	
	public uint getFrameTime() const {
		return sfRenderWindow_GetFrameTime(renderWindow);
	}
	
	public void setJoystickThreshold(float threshold) {
		sfRenderWindow_SetJoystickThreshold(renderWindow, threshold);
	}
	
	public WindowHandle getWindowHandle() const {
		return sfRenderWindow_GetSystemHandle(renderWindow);
	}
	
	/*
	void sfRenderWindow_SaveGLStates(renderWindow);
	void sfRenderWindow_RestoreGLStates(renderWindow);
	void sfRenderWindow_DrawSprite(renderWindow, const sfSprite* sprite);
	void sfRenderWindow_DrawShape (renderWindow, const sfShape* shape);
	void sfRenderWindow_DrawText (renderWindow, const sfText* text);
	void sfRenderWindow_DrawSpriteWithShader(renderWindow, const sfSprite* sprite, const sfShader* shader);
	void sfRenderWindow_DrawShapeWithShader (renderWindow, const sfShape* shape, const sfShader* shader);
	void sfRenderWindow_DrawTextWithShader (renderWindow, const sfText* text, const sfShader* shader);
	void sfRenderWindow_Clear(renderWindow, sfColor color);
	void sfRenderWindow_SetView(renderWindow, const sfView* view);
	const(sfView*) sfRenderWindow_GetView(const renderWindow);
	const(sfView*) sfRenderWindow_GetDefaultView(const renderWindow);
	sfIntRect sfRenderWindow_GetViewport(const renderWindow, const sfView* view);
	void sfRenderWindow_ConvertCoords(const renderWindow, uint windowX, uint windowY, float* viewX, float* viewY, const sfView* targetView);
	sfImage* sfRenderWindow_Capture(const renderWindow);
	*/
}


module csfml.graphics.renderwindow;

public import csfml.graphics.types;

import csfml.graphics.color;
import csfml.graphics.rect;
import csfml.window.event;
import csfml.window.videomode;
import csfml.window.window;
import csfml.window.windowhandle;

import core.stdc.config;

extern(C) {
	sfRenderWindow* sfRenderWindow_Create(sfVideoMode mode, const char* title, c_ulong style, const sfContextSettings* settings);
	sfRenderWindow* sfRenderWindow_CreateFromHandle(sfWindowHandle handle, const sfContextSettings* settings);
	void sfRenderWindow_Destroy(sfRenderWindow* renderWindow);
	void sfRenderWindow_Close(sfRenderWindow* renderWindow);
	bool sfRenderWindow_IsOpened(const sfRenderWindow* renderWindow);
	uint sfRenderWindow_GetWidth(const sfRenderWindow* renderWindow);
	uint sfRenderWindow_GetHeight(const sfRenderWindow* renderWindow);
	sfContextSettings sfRenderWindow_GetSettings(const sfRenderWindow* renderWindow);
	bool sfRenderWindow_PollEvent(sfRenderWindow* renderWindow, sfEvent* event);
	bool sfRenderWindow_WaitEvent(sfRenderWindow* renderWindow, sfEvent* event);
	void sfRenderWindow_EnableVerticalSync(sfRenderWindow* renderWindow, bool enabled);
	void sfRenderWindow_ShowMouseCursor(sfRenderWindow* renderWindow, bool show);
	void sfRenderWindow_SetPosition(sfRenderWindow* renderWindow, int left, int top);
	void sfRenderWindow_SetSize(sfRenderWindow* renderWindow, uint width, uint height);
	void sfRenderWindow_SetTitle(sfRenderWindow* renderWindow, const char* title);
	void sfRenderWindow_Show(sfRenderWindow* renderWindow, bool show);
	void sfRenderWindow_EnableKeyRepeat(sfRenderWindow* renderWindow, bool enabled);
	void sfRenderWindow_SetIcon(sfRenderWindow* renderWindow, uint width, uint height, const ubyte* pixels);
	bool sfRenderWindow_SetActive(sfRenderWindow* renderWindow, bool active);
	void sfRenderWindow_SaveGLStates(sfRenderWindow* renderWindow);
	void sfRenderWindow_RestoreGLStates(sfRenderWindow* renderWindow);
	void sfRenderWindow_Display(sfRenderWindow* renderWindow);
	void sfRenderWindow_SetFramerateLimit(sfRenderWindow* renderWindow, uint limit);
	uint sfRenderWindow_GetFrameTime(const sfRenderWindow* renderWindow);
	void sfRenderWindow_SetJoystickThreshold(sfRenderWindow* renderWindow, float threshold);
	sfWindowHandle sfRenderWindow_GetSystemHandle(const sfRenderWindow* renderWindow);
	void sfRenderWindow_DrawSprite(sfRenderWindow* renderWindow, const sfSprite* sprite);
	void sfRenderWindow_DrawShape (sfRenderWindow* renderWindow, const sfShape* shape);
	void sfRenderWindow_DrawText (sfRenderWindow* renderWindow, const sfText* text);
	void sfRenderWindow_DrawSpriteWithShader(sfRenderWindow* renderWindow, const sfSprite* sprite, const sfShader* shader);
	void sfRenderWindow_DrawShapeWithShader (sfRenderWindow* renderWindow, const sfShape* shape, const sfShader* shader);
	void sfRenderWindow_DrawTextWithShader (sfRenderWindow* renderWindow, const sfText* text, const sfShader* shader);
	void sfRenderWindow_Clear(sfRenderWindow* renderWindow, sfColor color);
	void sfRenderWindow_SetView(sfRenderWindow* renderWindow, const sfView* view);
	const(sfView*) sfRenderWindow_GetView(const sfRenderWindow* renderWindow);
	const(sfView*) sfRenderWindow_GetDefaultView(const sfRenderWindow* renderWindow);
	sfIntRect sfRenderWindow_GetViewport(const sfRenderWindow* renderWindow, const sfView* view);
	void sfRenderWindow_ConvertCoords(const sfRenderWindow* renderWindow, uint windowX, uint windowY, float* viewX, float* viewY, const sfView* targetView);
	sfImage* sfRenderWindow_Capture(const sfRenderWindow* renderWindow);
}


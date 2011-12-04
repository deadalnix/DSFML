#include<SFML/Window/Window.hpp>
#include<new>

typedef sf::Window sfWindow;

void sfWindow_Create(sfWindow* window) {
	new(window) sfWindow();
}

void sfWindow_Destroy(sfWindow* window) {
	window->~sfWindow();
}

typedef sf::VideoMode sfVideoMode;
typedef sf::ContextSettings sfContextSettings;

void sfWindow_Create(sfWindow* window, sfVideoMode mode, const std::string& title, sf::Uint32 style, const sfContextSettings& settings) {
	window->Create(mode, title, style, settings);
}

typedef sf::WindowHandle sfWindowHandle;

void sfWindow_Create(sfWindow* window, sfWindowHandle handle, const sfContextSettings& settings) {
	window->Create(handle, settings);
}

void sfWindow_Close(sfWindow* window) {
	window->Close();
}

bool sfWindow_IsOpened(const sfWindow* window) {
	return window->IsOpened();
}

unsigned int sfWindow_GetWidth(const sfWindow* window) {
	return window->GetWidth();
}

unsigned int sfWindow_GetHeight(const sfWindow* window) {
	return window->GetHeight();
}

typedef sf::ContextSettings sfContextSettings;

const sfContextSettings& sfWindow_GetSettings(const sfWindow* window) {
	return window->GetSettings();
}

typedef sf::Event sfEvent;

bool sfWindow_PollEvent(sfWindow* window, sfEvent& event) {
	return window->PollEvent(event);
}

bool sfWindow_WaitEvent(sfWindow* window, sfEvent& event) {
	return window->WaitEvent(event);
}

void sfWindow_EnableVerticalSync(sfWindow* window, bool enabled) {
	window->EnableVerticalSync(enabled);
}

void sfWindow_ShowMouseCursor(sfWindow* window, bool show) {
	window->ShowMouseCursor(show);
}

void sfWindow_SetPosition(sfWindow* window, int x, int y) {
	window->SetPosition(x, y);
}

void sfWindow_SetSize(sfWindow* window, unsigned int width, unsigned int height) {
	window->SetSize(width, height);
}

void sfWindow_SetTitle(sfWindow* window, const char* title) {
	window->SetTitle(title);
}

void sfWindow_Show(sfWindow* window, bool show) {
	window->Show(show);
}

void sfWindow_EnableKeyRepeat(sfWindow* window, bool enabled) {
	window->EnableKeyRepeat(enabled);
}

void sfWindow_SetIcon(sfWindow* window, unsigned int width, unsigned int height, const sf::Uint8* pixels) {
	window->SetIcon(width, height, pixels);
}

bool sfWindow_SetActive(const sfWindow* window, bool active) {
	return window->SetActive(active);
}

void sfWindow_Display(sfWindow* window) {
	window->Display();
}

void sfWindow_SetFramerateLimit(sfWindow* window, unsigned int limit) {
	window->SetFramerateLimit(limit);
}

sf::Uint32 sfWindow_GetFrameTime(const sfWindow* window) {
	return window->GetFrameTime();
}

void sfWindow_SetJoystickThreshold(sfWindow* window, float threshold) {
	window->SetJoystickThreshold(threshold);
}

typedef sf::WindowHandle WindowHandle;

WindowHandle sfWindow_GetSystemHandle(const sfWindow* window) {
	return window->GetSystemHandle();
}


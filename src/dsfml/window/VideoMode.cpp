#include<SFML/Window/VideoMode.hpp>

typedef sf::VideoMode sfVideoMode;

bool sfVideoMode_IsValid(const sfVideoMode& videoMode) {
	return videoMode.IsValid();
}

sfVideoMode sfVideoMode_GetDesktopMode() {
	return sfVideoMode::GetDesktopMode();
}

const sfVideoMode* sfVideoMode_GetFullscreenModes(std::size_t* count) {
	std::vector<sfVideoMode> modes = sfVideoMode::GetFullscreenModes();
	*count = modes.size();
	return &modes[0];
}


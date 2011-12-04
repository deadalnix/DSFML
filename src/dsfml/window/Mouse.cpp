#include<SFML/Window/Mouse.hpp>
#include<SFML/System/Enumeration.hpp>

bool sfMouse_IsButtonPressed(unsigned int button) {
	return sf::Mouse::IsButtonPressed(sf::Enumeration<sf::Mouse::Button, unsigned int>(button));
}

sf::Vector2i sfMouse_GetPosition() {
	return sf::Mouse::GetPosition();
}

typedef sf::Window sfWindow;

sf::Vector2i sfMouse_GetPosition(const sfWindow& relativeTo) {
	return sf::Mouse::GetPosition(relativeTo);
}

void sfMouse_SetPosition(const int* position) {
	sf::Mouse::SetPosition(*reinterpret_cast<const sf::Vector2i*>(position));
}

void sfMouse_SetPosition(const int* position, const sfWindow& relativeTo) {
	sf::Mouse::SetPosition(*reinterpret_cast<const sf::Vector2i*>(position), relativeTo);
}


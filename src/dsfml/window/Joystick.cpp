#include<SFML/Window/Joystick.hpp>
#include<SFML/System/Enumeration.hpp>
#include<new>

bool sfJoystick_IsConnected(unsigned int joystick) {
	return sf::Joystick::IsConnected(joystick);
}

unsigned int sfJoystick_GetButtonCount(unsigned int joystick) {
	return sf::Joystick::GetButtonCount(joystick);
}

bool sfJoystick_HasAxis(unsigned int joystick, unsigned int axis) {
	return sf::Joystick::HasAxis(joystick, sf::Enumeration<sf::Joystick::Axis, unsigned int>(axis));
}

bool sfJoystick_IsButtonPressed(unsigned int joystick, unsigned int button) {
	return sf::Joystick::IsButtonPressed(joystick, button);
}

float sfJoystick_GetAxisPosition(unsigned int joystick, unsigned int axis) {
	return sf::Joystick::GetAxisPosition(joystick, sf::Enumeration<sf::Joystick::Axis, unsigned int>(axis));
}

void sfJoystick_Update() {
	return sf::Joystick::Update();
}


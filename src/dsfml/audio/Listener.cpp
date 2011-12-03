#include<SFML/Audio/Listener.hpp>

void sfListener_SetGlobalVolume(float volume) {
	sf::Listener::SetGlobalVolume(volume);
}

float sfListener_GetGlobalVolume() {
	return sf::Listener::GetGlobalVolume();
}

void sfListener_SetPosition(float x, float y, float z) {
	sf::Listener::SetPosition(x, y, z);
}

void sfListener_SetPosition(const float* position) {
	sf::Listener::SetPosition(*reinterpret_cast<const sf::Vector3f*>(position));
}

sf::Vector3f sfListener_GetPosition() {
	return sf::Listener::GetPosition();
}

void sfListener_SetDirection(float x, float y, float z) {
	sf::Listener::SetDirection(x, y, z);
}

void sfListener_SetDirection(const float* direction) {
	sf::Listener::SetDirection(*reinterpret_cast<const sf::Vector3f*>(direction));
}

sf::Vector3f sfListener_GetDirection() {
	return sf::Listener::GetDirection();
}


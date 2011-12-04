#include<SFML/Window/Keyboard.hpp>
#include<SFML/System/Enumeration.hpp>

bool sfKeyboard_IsKeyPressed(unsigned int key) {
	sf::Keyboard::IsKeyPressed(sf::Enumeration<sf::Keyboard::Key, unsigned int>(key));
}


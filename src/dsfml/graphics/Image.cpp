#include<SFML/Graphics/Image.hpp>
#include<new>

typedef sf::Image sfImage;

void sfImage_Create(sfImage* image) {
	new(image) sfImage();
}

void sfImage_Destroy(sfImage* image) {
	image->~sfImage();
}

typedef sf::Color sfColor;

void sfImage_Create(sfImage* image, unsigned int width, unsigned int height, const sfColor& color) {
	image->Create(width, height, color);
}

void sfImage_Create(sfImage* image, unsigned int width, unsigned int height, const sf::Uint8* pixels) {
	image->Create(width, height, pixels);
}


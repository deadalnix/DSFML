#include<SFML/Graphics/Image.hpp>
#include<new>

typedef sf::Image sfImage;

void sfImage_Create(sfImage* image) {
	new(image) sfImage();
}

void sfImage_Destroy(sfImage* image) {
	image->~sfImage();
}


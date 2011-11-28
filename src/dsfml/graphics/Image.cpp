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

bool sfImage_LoadFromFile(sfImage* image, const char* filename) {
	return image->LoadFromFile(filename);
}

bool sfImage_LoadFromMemory(sfImage* image, const void* data, size_t size) {
	return image->LoadFromMemory(data, size);
}

typedef sf::InputStream sfInputStream;

bool sfImage_LoadFromStream(sfImage* image, sfInputStream* stream) {
	return image->LoadFromStream(*stream);
}

bool sfImage_SaveToFile(const sfImage* image, const char* filename) {
	return image->SaveToFile(filename);
}

unsigned int sfImage_GetWidth(const sfImage* image) {
	return image->GetWidth();
}

unsigned int sfImage_GetHeight(const sfImage* image) {
	return image->GetHeight();
}

void sfImage_CreateMaskFromColor(sfImage* image, const sfColor& color, sf::Uint8 alpha) {
	image->CreateMaskFromColor(color, alpha);
}


#include<SFML/Graphics/Texture.hpp>
#include<SFML/System/Enumeration.hpp>
#include<new>

typedef sf::Texture sfTexture;

void sfTexture_Create(sfTexture* texture) {
	new(texture) sfTexture();
}

void sfTexture_Copy(const sfTexture* texture, sfTexture* destination) {
	new(destination) sfTexture(*texture);
}

void sfTexture_Destroy(sfTexture* texture) {
	texture->~sfTexture();
}

void sfTexture_Create(sfTexture* texture, unsigned int width, unsigned int height) {
	texture->Create(width, height);
}

bool sfTexture_LoadFromFile(sfTexture* texture, const char* filename) {
	return texture->LoadFromFile(filename);
}

bool sfTexture_LoadFromMemory(sfTexture* texture, const void* data, size_t size) {
	return texture->LoadFromMemory(data, size);
}

typedef sf::InputStream sfInputStream;

bool sfTexture_LoadFromStream(sfTexture* texture, sfInputStream* stream) {
	return texture->LoadFromStream(*stream);
}

unsigned int sfTexture_GetWidth(const sfTexture* texture) {
	return texture->GetWidth();
}

unsigned int sfTexture_GetHeight(const sfTexture* texture) {
	return texture->GetHeight();
}

typedef sf::Image sfImage;

sfImage sfTexture_CopyToImage(const sfTexture* texture) {
	return texture->CopyToImage();
}

void sfTexture_Update(sfTexture* texture, const sf::Uint8* pixels) {
	texture->Update(pixels);
}

void sfTexture_Update(sfTexture* texture, const sf::Uint8* pixels, unsigned int width, unsigned int height, unsigned int x, unsigned int y) {
	texture->Update(pixels, width, height, x, y);
}

void sfTexture_Update(sfTexture* texture, const sfImage& image) {
	texture->Update(image);
}

void sfTexture_Update(sfTexture* texture, const sfImage& image, unsigned int x, unsigned int y) {
	texture->Update(image, x, y);
}

typedef sf::Window sfWindow;

void sfTexture_Update(sfTexture* texture, const sfWindow& window) {
	texture->Update(window);
}

void sfTexture_Update(sfTexture* texture, const sfWindow& window, unsigned int x, unsigned int y) {
	texture->Update(window, x, y);
}

void sfTexture_Bind(const sfTexture* texture, unsigned int coordinateType) {
	texture->Bind(sf::Enumeration<sf::Texture::CoordinateType, unsigned int>(coordinateType));
}

void sfTexture_SetSmooth(sfTexture* texture, bool smooth) {
	texture->SetSmooth(smooth);
}

bool sfTexture_IsSmooth(const sfTexture* texture) {
	return texture->IsSmooth();
}

void sfTexture_SetRepeated(sfTexture* texture, bool repeated) {
	texture->SetRepeated(repeated);
}

bool sfTexture_IsRepeated(const sfTexture* texture) {
	return texture->IsRepeated();
}

unsigned int sfTexture_GetMaximumSize() {
	return sfTexture::GetMaximumSize();
}


#include<SFML/Graphics/Font.hpp>
#include<new>

typedef sf::Font sfFont;

void sfFont_Create(sfFont* font) {
	new(font) sfFont();
}

void sfFont_Copy(const sfFont* font, sfFont* destination) {
	new(destination) sfFont(*font);
}

void sfFont_Destroy(sfFont* font) {
	font->~sfFont();
}

bool sfFont_LoadFromFile(sfFont* font, const char* filename) {
	return font->LoadFromFile(filename);
}

bool sfFont_LoadFromMemory(sfFont* font, const void* data, size_t sizeInBytes) {
	return font->LoadFromMemory(data, sizeInBytes);
}

typedef sf::InputStream InputStream;

bool sfFont_LoadFromStream(sfFont* font, InputStream* stream) {
	return font->LoadFromStream(*stream);
}

typedef sf::Glyph sfGlyph;

const sfGlyph& sfFont_GetGlyph(const sfFont* font, sf::Uint32 codePoint, unsigned int characterSize, bool bold) {
	return font->GetGlyph(codePoint, characterSize, bold);
}

int sfFont_GetKerning(const sfFont* font, sf::Uint32 first, sf::Uint32 second, unsigned int characterSize) {
	return font->GetKerning(first, second, characterSize);
}

int sfFont_GetLineSpacing(const sfFont* font, unsigned int characterSize) {
	return font->GetLineSpacing(characterSize);
}


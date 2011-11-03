module csfml.graphics.font;

public import csfml.graphics.types;

import csfml.graphics.glyph;
import csfml.system.inputstream;

extern(C) {
	sfFont* sfFont_CreateFromFile(const char* filename);
	sfFont* sfFont_CreateFromMemory(const void* data, size_t sizeInBytes);
	sfFont* sfFont_CreateFromStream(sfInputStream* stream);
	sfFont* sfFont_Copy(sfFont* font);
	void sfFont_Destroy(sfFont* font);
	sfGlyph sfFont_GetGlyph(sfFont* font, uint codePoint, uint characterSize, bool bold);
	int sfFont_GetKerning(sfFont* font, uint first, uint second, uint characterSize);
	int sfFont_GetLineSpacing(sfFont* font, uint characterSize);
	const(sfTexture*) sfFont_GetTexture(sfFont* font, uint characterSize);
	const(sfFont*) sfFont_GetDefaultFont();
}


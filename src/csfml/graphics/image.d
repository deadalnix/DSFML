module csfml.graphics.image;

public import csfml.graphics.types;

import csfml.graphics.color;
import csfml.graphics.rect;
import csfml.system.inputstream;

extern(C) {
	sfImage* sfImage_CreateFromColor(uint width, uint height, sfColor color);
	sfImage* sfImage_CreateFromPixels(uint width, uint height, const ubyte* data);
	sfImage* sfImage_CreateFromFile(const char* filename);
	sfImage* sfImage_CreateFromMemory(const void* data, size_t sizeInBytes);
	sfImage* sfImage_CreateFromStream(sfInputStream* stream);
	sfImage* sfImage_Copy(sfImage* image);
	void sfImage_Destroy(sfImage* image);
	bool sfImage_SaveToFile(const sfImage* image, const char* filename);
	void sfImage_CreateMaskFromColor(sfImage* image, sfColor colorKey, ubyte alpha);
	void sfImage_CopyImage(sfImage* image, const sfImage* source, uint destX, uint destY, sfIntRect sourceRect, bool applyAlpha);
	void sfImage_SetPixel(sfImage* image, uint x, uint y, sfColor color);
	sfColor sfImage_GetPixel(const sfImage* image, uint x, uint y);
	const(ubyte)* sfImage_GetPixelsPtr(const sfImage* image);
	uint sfImage_GetWidth(const sfImage* image);
	uint sfImage_GetHeight(const sfImage* image);
	void sfImage_FlipHorizontally(sfImage* image);
	void sfImage_FlipVertically(sfImage* image);
}


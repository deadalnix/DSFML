module csfml.graphics.texture;

public import csfml.graphics.types;

import csfml.graphics.rect;
import csfml.system.inputstream;
import csfml.window.window;

extern(C) {
	sfTexture* sfTexture_Create(uint width, uint height);
	sfTexture* sfTexture_CreateFromFile(const char* filename, const sfIntRect* area);
	sfTexture* sfTexture_CreateFromMemory(const void* data, size_t sizeInBytes, const sfIntRect* area);
	sfTexture* sfTexture_CreateFromStream(sfInputStream* stream, const sfIntRect* area);
	sfTexture* sfTexture_CreateFromImage(const sfImage* image, const sfIntRect* area);
	sfTexture* sfTexture_Copy(sfTexture* texture);
	void sfTexture_Destroy(sfTexture* texture);
	uint sfTexture_GetWidth(const sfTexture* texture);
	uint sfTexture_GetHeight(const sfTexture* texture);
	sfImage* sfTexture_CopyToImage(const sfTexture* texture);
	void sfTexture_UpdateFromPixels(sfTexture* texture, const ubyte* pixels, uint width, uint height, uint x, uint y);
	void sfTexture_UpdateFromImage(sfTexture* texture, const sfImage* image, uint x, uint y);
	void sfTexture_UpdateFromWindow(sfTexture* texture, const sfWindow* window, uint x, uint y);
	void sfTexture_UpdateFromRenderWindow(sfTexture* texture, const sfRenderWindow* renderWindow, uint x, uint y);
	void sfTexture_Bind(const sfTexture* texture);
	void sfTexture_SetSmooth(sfTexture* texture, bool smooth);
	bool sfTexture_IsSmooth(const sfTexture* texture);
	sfFloatRect sfTexture_GetTexCoords(const sfTexture* texture, sfIntRect rectangle);
	uint sfTexture_GetMaximumSize();
}


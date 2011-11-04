module dsfml.graphics.texture;

import csfml.graphics.texture;
import csfml.graphics.rect;

import dsfml.graphics.image;
import dsfml.graphics.rect;
import dsfml.system.inputstream;

import std.string;

struct Texture {
	private sfTexture* texture;
	
	public this(uint width, uint height) {
		texture = sfTexture_Create(width, height);
	}
	
	public this(string filename, const ref IntRect area = IntRect()) {
		texture = sfTexture_CreateFromFile(toStringz(filename), cast(const sfIntRect*) &area);
	}
	
	public this(const void[] data, const ref IntRect area = IntRect()) {
		texture = sfTexture_CreateFromMemory(data.ptr, data.length, cast(const sfIntRect*) &area);
	}
	
	public this(InputStream istream, const ref IntRect area = IntRect()) {
		texture = sfTexture_CreateFromStream(istream.getCInputStream(), cast(const sfIntRect*) &area);
	}
	
	public this(const ref Image image, const ref IntRect area = IntRect()) {
		texture = sfTexture_CreateFromImage(image.getCImage(), cast(const sfIntRect*) &area);
	}
	
	public ~this() {
		sfTexture_Destroy(texture);
	}
	
	/*
	sfTexture_Copy(texture);
	uint sfTexture_GetWidth(const texture);
	uint sfTexture_GetHeight(const texture);
	sfImage* sfTexture_CopyToImage(const texture);
	void sfTexture_UpdateFromPixels(texture, const sfUint8* pixels, uint width, uint height, uint x, uint y);
	void sfTexture_UpdateFromImage(texture, const sfImage* image, uint x, uint y);
	void sfTexture_UpdateFromWindow(texture, const sfWindow* window, uint x, uint y);
	void sfTexture_UpdateFromRenderWindow(texture, const sfRenderWindow* renderWindow, uint x, uint y);
	void sfTexture_Bind(const texture);
	void sfTexture_SetSmooth(texture, bool smooth);
	bool sfTexture_IsSmooth(const texture);
	sfFloatRect sfTexture_GetTexCoords(const texture, sfIntRect rectangle);
	*/
}

immutable uint maximumSize;

static this() {
	maximumSize = sfTexture_GetMaximumSize();
}

uint getMaximumSize() {
	return maximumSize;
}


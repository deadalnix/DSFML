module dsfml.graphics.texture;

import csfml.graphics.texture;
import csfml.graphics.rect;

import dsfml.graphics.image;
import dsfml.graphics.rect;
import dsfml.system.inputstream;
import dsfml.window.window;

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
	
	private this(this) {
		texture = sfTexture_Copy(texture);
	}
	
	public ~this() {
		sfTexture_Destroy(texture);
	}
	
	public uint getWidth() const {
		return sfTexture_GetWidth(texture);
	}
	
	public uint getHeight() const {
		return sfTexture_GetHeight(texture);
	}
	
	public ref Image copyToImage() const {
		return Image(sfTexture_CopyToImage(texture));
	}
	
	public void update(const ubyte[] pixels, uint width = getWidth(), uint height = getHeight(), uint x = 0, uint y = 0) in {
		assert(pixels.length == (width * height * 4), "Pixels size is inconsistent with width and height");
	} body {
		sfTexture_UpdateFromPixels(texture, pixels.ptr, width, height, x, y);
	}
	
	public void update(const ref Image image, uint x = 0, uint y = 0) {
		sfTexture_UpdateFromImage(texture, image.getCImage(), x, y);
	}
	
	public void update(const ref Window window, uint x = 0, uint y = 0) {
		sfTexture_UpdateFromWindow(texture, window.getCWindow(), x, y);
	}
	
	public void bind() const {
		sfTexture_Bind(texture);
	}
	
	public void setSmooth(bool smooth) {
		sfTexture_SetSmooth(texture, smooth);
	}
	
	public bool getSmooth() const {
		return sfTexture_IsSmooth(texture);
	}
	
	public FloatRect getTexCoords(const ref IntRect rectangle) const {
		return cast(FloatRect) sfTexture_GetTexCoords(texture, cast(sfIntRect) rectangle);
	}
	
	/*
	void sfTexture_UpdateFromRenderWindow(texture, const sfRenderWindow* renderWindow, uint x, uint y);
	*/
}

immutable uint maximumSize;

static this() {
	maximumSize = sfTexture_GetMaximumSize();
}

uint getMaximumSize() {
	return maximumSize;
}


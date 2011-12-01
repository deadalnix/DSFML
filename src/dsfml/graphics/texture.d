module dsfml.graphics.texture;

import dsfml.graphics.image;
import dsfml.graphics.rect;
import dsfml.system.inputstream;
import dsfml.window.window;
import dsfml.sizes;

import std.string;

final class Texture {
	private void[textureSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfTexture* texture() {
		return cast(sfTexture*) &this;
	}
	
	@property
	package final const(sfTexture)* texture() const {
		return cast(const(sfTexture)*) &this;
	}
	
	this() {
		sfTexture_Create(texture);
	}
	
	this(const Texture t) {
		sfTexture_Copy(t.texture, texture);
	}
	
	~this() {
		sfTexture_Destroy(texture);
	}
	
	final void create(uint width, uint height) {
		sfTexture_Create(texture, width, height);
	}
	
	final bool loadFromFile(string filename) {
		return sfTexture_LoadFromFile(texture, toStringz(filename));
	}
	
	final bool loadFromMemory(const void[] data) {
		return sfTexture_LoadFromMemory(texture, data.ptr, data.length);
	}
	
	final bool loadFromStream(InputStream stream) {
		return sfTexture_LoadFromStream(texture, stream);
	}
	
	@property
	final uint width() const {
		return sfTexture_GetWidth(texture);
	}
	
	@property
	final uint height() const {
		return sfTexture_GetHeight(texture);
	}
	
	Image copyToImage() const {
		// 
		sfImage i = sfTexture_CopyToImage(texture);
		return new Image(i);
	}
	
	void update(const ubyte[] pixels) in {
		assert(pixels.length == (width * height * 4), "Pixels size is inconsistent with width and height");
	} body {
		sfTexture_Update(texture, pixels.ptr);
	}
	
	void update(const ubyte[] pixels, uint width, uint height, uint x, uint y) in {
		assert(x + width <= this.width);
		assert(y + height <= this.height);
		assert(pixels.length == (width * height * 4), "Pixels size is inconsistent with width and height");
	} body {
		sfTexture_Update(texture, pixels.ptr, width, height, x, y);
	}
	
	
	
	
	/*
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
	// maximumSize = sfTexture_GetMaximumSize();
}

package extern(C++) {
	struct sfTexture {
		private void[textureSize] data = void;
	}
	
	void sfTexture_Create(sfTexture* texture);
	void sfTexture_Copy(const sfTexture* texture, sfTexture* destination);
	void sfTexture_Destroy(sfTexture* texture);
	
	void sfTexture_Create(sfTexture* texture, uint width, uint height);
	
	bool sfTexture_LoadFromFile(sfTexture* texture, const char* filename);
	bool sfTexture_LoadFromMemory(sfTexture* texture, const void* data, size_t size);
	bool sfTexture_LoadFromStream(sfTexture* texture, InputStream stream);
	
	uint sfTexture_GetWidth(const sfTexture* texture);
	uint sfTexture_GetHeight(const sfTexture* texture);
	
	sfImage sfTexture_CopyToImage(const sfTexture* texture);
	
	void sfTexture_Update(sfTexture* texture, const ubyte* pixels);
	void sfTexture_Update(sfTexture* texture, const ubyte* pixels, uint width, uint height, uint x, uint y);
	
	// uint sfTexture_GetMaximumSize();
}


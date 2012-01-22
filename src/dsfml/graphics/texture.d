module dsfml.graphics.texture;

import dsfml.graphics.image;
import dsfml.graphics.rect;
import dsfml.system.inputstream;
import dsfml.window.window;
import dsfml.sizes;

import std.conv;
import std.string;

enum CoordinateType {
	Normalized,
	Pixels,
}

final class Texture {
	private void[textureSize] data = void;
	
	@property
	package final inout(sfTexture)* texture() inout {
		return cast(inout(sfTexture)*) &this;
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
	
	void create(uint width, uint height) {
		sfTexture_Create(texture, width, height);
	}
	
	bool loadFromFile(string filename) {
		return sfTexture_LoadFromFile(texture, toStringz(filename));
	}
	
	bool loadFromMemory(const void[] data) {
		return sfTexture_LoadFromMemory(texture, data.ptr, data.length);
	}
	
	bool loadFromStream(InputStream stream) in {
		assert(stream, "Inpustream " ~ /* to!string(stream) ~ */ " is not usable.");
	} body {
		return sfTexture_LoadFromStream(texture, stream);
	}
	
	@property
	uint width() const {
		return sfTexture_GetWidth(texture);
	}
	
	@property
	uint height() const {
		return sfTexture_GetHeight(texture);
	}
	
	Image copyToImage() const {
		sfImage i = sfTexture_CopyToImage(texture);
		return new Image(i);
	}
	
	void update(const ubyte[] pixels) in {
		assert(pixels.length == (width * height * 4), "pixels length (" ~ to!string(pixels.length) ~ ") isn't what is expected (" ~ to!string(width * height * 4) ~ ").");
	} body {
		sfTexture_Update(texture, pixels.ptr);
	}
	
	void update(const ubyte[] pixels, uint width, uint height, uint x, uint y) in {
		assert(x + width <= this.width, "Width exeding texture width");
		assert(y + height <= this.height, "height exeding texture height");
		assert(pixels.length == (width * height * 4), "pixels length (" ~ to!string(pixels.length) ~ ") isn't what is expected (" ~ to!string(width * height * 4) ~ ").");
	} body {
		sfTexture_Update(texture, pixels.ptr, width, height, x, y);
	}
	
	void update(const Image image) {
		sfTexture_Update(texture, *image.image);
	}
	
	void update(const Image image, uint x, uint y) {
		sfTexture_Update(texture, *image.image, x, y);
	}
	
	void update(const Window window) in {
		assert(window, "Window " ~ /* to!string(window) ~ */ " is not usable.");
	} body {
		sfTexture_Update(texture, getWindow(window));
	}
	
	void update(const Window window, uint x, uint y) in {
		assert(window, "Window " ~ /* to!string(window) ~ */ " is not usable.");
	} body {
		sfTexture_Update(texture, getWindow(window), x, y);
	}
	
	void bind(CoordinateType coordinateType = CoordinateType.Normalized) const {
		sfTexture_Bind(texture, coordinateType);
	}
	
	@property
	void smooth(bool smooth) {
		sfTexture_SetSmooth(texture, smooth);
	}
	
	@property
	bool smooth() const {
		return sfTexture_IsSmooth(texture);
	}
	
	@property
	void repeated(bool repeated) {
		sfTexture_SetRepeated(texture, repeated);
	}
	
	@property
	bool repeated() const {
		return sfTexture_IsRepeated(texture);
	}
}

immutable uint maximumSize;

static this() {
	maximumSize = sfTexture_GetMaximumSize();
}

package extern(C++) {
	struct sfTexture {
		void[textureSize] data = void;
	}
	
	struct sfWindow {
		void[windowSize] data = void;
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
	void sfTexture_Update(sfTexture* texture, ref const sfImage image);
	void sfTexture_Update(sfTexture* texture, ref const sfImage image, uint x, uint y);
	void sfTexture_Update(sfTexture* texture, ref const sfWindow window);
	void sfTexture_Update(sfTexture* texture, ref const sfWindow window, uint x, uint y);
	
	void sfTexture_Bind(const sfTexture* texture, uint coordinateType);
	void sfTexture_SetSmooth(sfTexture* texture, bool smooth);
	bool sfTexture_IsSmooth(const sfTexture* texture);
	void sfTexture_SetRepeated(sfTexture* texture, bool repeated);
	bool sfTexture_IsRepeated(const sfTexture* texture);
	
	uint sfTexture_GetMaximumSize();
}

// Dirty hack to get back the SFML window object.
private ref inout(sfWindow) getWindow(inout Window window) {
	return *(cast(inout sfWindow*) ((cast(void*) window) + __traits(classInstanceSize, Window) - windowSize));
}


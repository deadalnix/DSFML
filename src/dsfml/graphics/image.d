module dsfml.graphics.image;

import dsfml.graphics.color;
import dsfml.graphics.rect;
import dsfml.system.inputstream;

import dsfml.sizes;

import std.string;

final class Image {
	private void[imageSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfImage* image() {
		return cast(sfImage*) data.ptr;
	}
	
	@property
	package final const(sfImage)* image() const {
		return cast(const(sfImage)*) data.ptr;
	}
	
	this() {
		sfImage_Create(image);
	}
	
	this(ref const Image i) {
		sfImage_Copy(i.image, image);
	}
	
	package this(ref const sfImage i) {
		sfImage_Copy(&i, image);
	}
	
	~this() {
		sfImage_Destroy(image);
	}
	
	void create()(uint width, uint height, ref const Color color = black) {
		sfImage_Create(image, width, height, color.color);
	}
	
	void create(uint WIDTH, uint HEIGHT)(const ubyte[HEIGHT][WIDTH] pixels) {
		sfImage_Create(image, WIDTH, HEIGHT, pixels.ptr);
	}
	
	void create()(uint width, uint height, const ubyte[] pixels) in {
		assert(pixels.length == width * height * 4, "pixels length (" ~ to!string(pixels.length) ~ ") isn't what is expected (" ~ to!string(width * height * 4) ~ ").");
	} body {
		sfImage_Create(image, width, height, pixels.ptr);
	}
	
	bool loadFromFile(string filename) {
		return sfImage_LoadFromFile(image, toStringz(filename));
	}
	
	bool loadFromMemory(const void[] data) {
		return sfImage_LoadFromMemory(image, data.ptr, data.length);
	}
	
	bool loadFromStream(InputStream stream) {
		return sfImage_LoadFromStream(image, stream);
	}
	
	bool saveToFile(string filename) const {
		return sfImage_SaveToFile(image, toStringz(filename));
	}
	
	@property
	uint width() const {
		return sfImage_GetWidth(image);
	}
	
	@property
	uint height() const {
		return sfImage_GetHeight(image);
	}
	
	void createMaskFromColor(ref const Color color, ubyte alpha = 0) {
		sfImage_CreateMaskFromColor(image, color.color, alpha);
	}
	
	void copy(ref const Image source, uint destX, uint destY, ref const IntRect sourceRect = IntRect(), bool applyAlpha = false) {
		sfImage_Copy(image, *source.image, destX, destY, sourceRect.rect, applyAlpha);
	}
	
	void setPixel(uint x, uint y, ref const Color color) {
		sfImage_SetPixel(image, x, y, color.color);
	}
	
	Color getPixel(uint x, uint y) const {
		return sfImage_GetPixel(image, x, y).color;
	}
	
	const(ubyte)[] getPixelsArray() const {
		return sfImage_GetPixelsPtr(image)[0 .. height * width * 4];
	}
	
	void flipHorizontally() {
		sfImage_FlipHorizontally(image);
	}
	
	void flipVertically() {
		sfImage_FlipVertically(image);
	}
}

package extern(C++) {
	struct sfImage {
		void[imageSize] data = void;
	}
	
	void sfImage_Create(sfImage* image);
	void sfImage_Copy(const sfImage* image, sfImage* destination);
	void sfImage_Destroy(sfImage* image);
	
	void sfImage_Create(sfImage* image, uint width, uint height, ref const sfColor color);
	void sfImage_Create(sfImage* image, uint width, uint height, const ubyte* pixels);
	
	bool sfImage_LoadFromFile(sfImage* image, const char* filename);
	bool sfImage_LoadFromMemory(sfImage* image, const void* data, size_t size);
	bool sfImage_LoadFromStream(sfImage* image, InputStream stream);
	bool sfImage_SaveToFile(const sfImage* image, const char* filename);
	
	uint sfImage_GetWidth(const sfImage* image);
	uint sfImage_GetHeight(const sfImage* image);
	
	void sfImage_CreateMaskFromColor(sfImage* image, ref const sfColor color, ubyte alpha);
	void sfImage_Copy(sfImage* image, ref const sfImage source, uint destX, uint destY, ref const sfIntRect sourceRect, bool applyAlpha);
	void sfImage_SetPixel(sfImage* image, uint x, uint y, ref const sfColor color);
	sfColor sfImage_GetPixel(const sfImage* image, uint x, uint y);
	const(ubyte)* sfImage_GetPixelsPtr(const sfImage* image);
	void sfImage_FlipHorizontally(sfImage* image);
	void sfImage_FlipVertically(sfImage* image);
}


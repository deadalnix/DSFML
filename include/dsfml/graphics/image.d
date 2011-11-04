module dsfml.graphics.image;

import csfml.graphics.color;
import csfml.graphics.rect;
import csfml.graphics.image;

import dsfml.graphics.color;
import dsfml.graphics.rect;
import dsfml.system.inputstream;

import std.string;

struct Image {
	private sfImage* image;
	
	public this(uint width, uint height, const Color color = black) {
		image = sfImage_CreateFromColor(width, height, cast(sfColor) color);
	}
	
	public this(uint width, uint height, const ubyte[] data) {
		if(data.length != width * height * 4) throw new Exception("Data size is inconsistent with width and height");
		
		sfImage_CreateFromPixels(width, height, data.ptr);
	}
	
	public this(string filename) {
		image = sfImage_CreateFromFile(toStringz(filename));
	}
	
	public this(const void[] data) {
		image = sfImage_CreateFromMemory(data.ptr, data.length);
	}
	
	public this(InputStream istream) {
		image = sfImage_CreateFromStream(istream.getCInputStream());
	}
	
	public ref Image clone() {
		return Image(this);
	}
	
	private this(ref Image source) {
		image = sfImage_Copy(source.image);
	}
	
	public ~this() {
		sfImage_Destroy(image);
	}
	
	public const(sfImage*) getCImage() const {
		return image;
	}
	
	public bool saveToFile(string filename) const {
		return sfImage_SaveToFile(image, toStringz(filename));
	}
	
	public uint getWidth() const {
		return sfImage_GetWidth(image);
	}
	
	public uint getHeight() const {
		return sfImage_GetHeight(image);
	}
	
	public void createMaskFromColor(const Color color, ubyte alpha = 0) {
		sfImage_CreateMaskFromColor(image, cast(sfColor) color, alpha);
	}
	
	public void copy(const ref Image source, uint destX, uint destY, const ref IntRect sourceRect = IntRect(), bool applyAlpha = false) {
		sfImage_CopyImage(image, source.image, destX, destY, cast(sfIntRect) sourceRect, applyAlpha);
	}
	
	public void setPixel(uint x, uint y, const Color color) {
		sfImage_SetPixel(image, x, y, cast(sfColor) color);
	}
	
	public Color getPixel(uint x, uint y) const {
		return cast(Color) sfImage_GetPixel(image, x, y);
	}
	
	public const(ubyte)[] getPixelsArray() const {
		return sfImage_GetPixelsPtr(image)[0 .. getHeight() * getWidth() * 4];
	}
	
	public void flipHorizontally() {
		sfImage_FlipHorizontally(image);
	}
	
	public void flipVertically() {
		sfImage_FlipVertically(image);
	}
}


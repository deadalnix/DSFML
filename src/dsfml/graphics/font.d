module dsfml.graphics.font;

import dsfml.graphics.glyph;
import dsfml.graphics.texture;
import dsfml.system.inputstream;
import dsfml.sizes;

import std.string;

final class Font {
	private void[fontSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfFont* font() {
		return cast(sfFont*) data.ptr;
	}
	
	@property
	package final const(sfFont)* font() const {
		return cast(const(sfFont)*) data.ptr;
	}
	
	this() {
		sfFont_Create(font);
	}
	
	this(const Font f) {
		sfFont_Copy(f.font, font);
	}
	
	~this() {
		sfFont_Destroy(font);
	}
	
	final bool loadFromFile(string filename) {
		return sfFont_LoadFromFile(font, toStringz(filename));
	}
	
	final bool loadFromMemory(const void[] data) {
		return sfFont_LoadFromMemory(font, data.ptr, data.length);
	}
	
	final bool loadFromStream(InputStream stream) {
		assert(stream);
		
		return sfFont_LoadFromStream(font, stream);
	}
	
	public ref const(Glyph) getGlyph(uint codePoint, uint characterSize, bool bold) const {
		return sfFont_GetGlyph(font, codePoint, characterSize, bold);
	}
	
	public int getKerning(uint first, uint second, uint characterSize) const {
		return sfFont_GetKerning(font, first, second, characterSize);
	}
	
	public int getLineSpacing(uint characterSize) const {
		return sfFont_GetLineSpacing(font, characterSize);
	}
	
	/*
	public ref const(Texture) getTexture(uint characterSize) const {
		return Texture(sfFont_GetTexture(font, characterSize));
	}
	*/
}

/*
// TODO: this should be immutable
const Font defaultFont;

static this() {
	defaultFont = new Font(sfFont_GetDefaultFont());
}

const(Font) getDefaultFont() {
	return defaultFont;
}
*/

private extern(C++) {
	struct sfFont {}
	
	void sfFont_Create(sfFont* font);
	void sfFont_Copy(const sfFont* font, sfFont* destination);
	void sfFont_Destroy(sfFont* font);
	
	bool sfFont_LoadFromFile(sfFont* font, const char* filename);
	bool sfFont_LoadFromMemory(sfFont* font, const void* data, size_t sizeInBytes);
	bool sfFont_LoadFromStream(sfFont* font, InputStream stream);
	
	ref const(Glyph) sfFont_GetGlyph(const sfFont* font, uint codePoint, uint characterSize, bool bold);
	int sfFont_GetKerning(const sfFont* font, uint first, uint second, uint characterSize);
	int sfFont_GetLineSpacing(const sfFont* font, uint characterSize);
}


module dsfml.graphics.font;

import dsfml.graphics.glyph;
import dsfml.graphics.texture;
import dsfml.system.inputstream;
import dsfml.sizes;

import std.conv;
import std.string;

final class Font {
	private void[fontSize] data = void;
	
	@property
	package final inout(sfFont)* font() inout {
		return cast(inout(sfFont)*) data.ptr;
	}
	
	this() {
		sfFont_Create(font);
	}
	
	this(const Font f) {
		sfFont_Copy(f.font, font);
	}
	
	// Usefull to construct defaultFont
	private this(ref const sfFont source) immutable {
		// Cast away immutable during initialization.
		sfFont_Copy(&source, cast(sfFont*) font);
	}
	
	~this() {
		sfFont_Destroy(font);
	}
	
	bool loadFromFile(string filename) {
		return sfFont_LoadFromFile(font, toStringz(filename));
	}
	
	bool loadFromMemory(const void[] data) {
		return sfFont_LoadFromMemory(font, data.ptr, data.length);
	}
	
	bool loadFromStream(InputStream stream) in {
		assert(stream, "Inpustream " ~ /* to!string(stream) ~ */ " is not usable.");
	} body {
		return sfFont_LoadFromStream(font, stream);
	}
	
	ref const(Glyph) getGlyph(uint codePoint, uint characterSize, bool bold) const {
		return sfFont_GetGlyph(font, codePoint, characterSize, bold);
	}
	
	int getKerning(uint first, uint second, uint characterSize) const {
		return sfFont_GetKerning(font, first, second, characterSize);
	}
	
	int getLineSpacing(uint characterSize) const {
		return sfFont_GetLineSpacing(font, characterSize);
	}
	
	ref const(Texture) getTexture(uint characterSize) const {
		return sfFont_GetTexture(font, characterSize);
	}
}

immutable Font defaultFont;

static this() {
	defaultFont = new Font(sfFont_GetDefaultFont());
}

package extern(C++) {
	struct sfFont {
		void[fontSize] data = void;
	}
	
	void sfFont_Create(sfFont* font);
	void sfFont_Copy(const sfFont* font, sfFont* destination);
	void sfFont_Destroy(sfFont* font);
	
	bool sfFont_LoadFromFile(sfFont* font, const char* filename);
	bool sfFont_LoadFromMemory(sfFont* font, const void* data, size_t sizeInBytes);
	bool sfFont_LoadFromStream(sfFont* font, InputStream stream);
	
	ref const(Glyph) sfFont_GetGlyph(const sfFont* font, uint codePoint, uint characterSize, bool bold);
	int sfFont_GetKerning(const sfFont* font, uint first, uint second, uint characterSize);
	int sfFont_GetLineSpacing(const sfFont* font, uint characterSize);
	ref const(Texture) sfFont_GetTexture(const sfFont* font, uint characterSize);
	
	ref const(sfFont) sfFont_GetDefaultFont();
}


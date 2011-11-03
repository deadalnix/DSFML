module dsfml.graphics.font;

import csfml.graphics.font;

import dsfml.graphics.glyph;
import dsfml.system.inputstream;

import std.string;

class Font {
	private sfFont* font;
	
	public this(string filename) {
		font = sfFont_CreateFromFile(toStringz(filename));
	}
	
	public this(const ubyte[] data) {
		font = sfFont_CreateFromMemory(data.ptr, data.length);
	}
	
	public this(InputStream istream) {
		font = sfFont_CreateFromStream(istream.getCInputStream());
	}
	
	public Font clone() {
		return new Font(this);
	}
	
	private this(Font f) {
		font = sfFont_Copy(f.font);
	}
	
	private this(immutable sfFont* f) immutable {
		font = f;
	}
	
	public ~this() {
		sfFont_Destroy(font);
	}
	
	// TODO: constify this
	public const(Glyph) getGlyph(uint codePoint, uint characterSize, bool bold) {
		return cast(Glyph) sfFont_GetGlyph(font, codePoint, characterSize, bold);
	}
	
	public int getKerning(uint first, uint second, uint characterSize) {
		return sfFont_GetKerning(font, first, second, characterSize);
	}
	
	public int getLineSpacing(uint characterSize) {
		return sfFont_GetLineSpacing(font, characterSize);
	}
	
	/*
	const(sfTexture*) sfFont_GetTexture(font, uint characterSize);
	const(sfFont*) sfFont_GetDefaultFont();
	*/
}


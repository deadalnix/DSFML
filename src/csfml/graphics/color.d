module csfml.graphics.color;

struct sfColor {
	ubyte r;
	ubyte g;
	ubyte b;
	ubyte a;
}

sfColor sfBlack;
sfColor sfWhite;
sfColor sfRed;
sfColor sfGreen;
sfColor sfBlue;
sfColor sfYellow;
sfColor sfMagenta;
sfColor sfCyan;

extern(C) {
	sfColor sfColor_FromRGB(ubyte red, ubyte green, ubyte blue);
	sfColor sfColor_FromRGBA(ubyte red, ubyte green, ubyte blue, ubyte alpha);
	sfColor sfColor_Add(sfColor color1, sfColor color2);
	sfColor sfColor_Modulate(sfColor color1, sfColor color2);
}


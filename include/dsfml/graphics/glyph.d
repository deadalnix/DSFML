module dsfml.graphics.glyph;

import dsfml.graphics.rect;

struct Glyph {
	int advance = 0;
    Rect!(int) bounds;
    Rect!(int) subRect;
}


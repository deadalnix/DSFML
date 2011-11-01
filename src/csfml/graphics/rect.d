module csfml.graphics.rect;

struct sfFloatRect {
	float left;
	float top;
	float width;
	float height;
}

struct sfIntRect {
	int left;
	int top;
	int width;
	int height;
}

extern(C) {
	bool sfFloatRect_Contains(const sfFloatRect* rect, float x, float y);
	bool sfIntRect_Contains(const sfIntRect* rect, int x, int y);
	bool sfFloatRect_Intersects(const sfFloatRect* rect1, const sfFloatRect* rect2, sfFloatRect* intersection);
	bool sfIntRect_Intersects(const sfIntRect* rect1, const sfIntRect* rect2, sfIntRect* intersection);
}


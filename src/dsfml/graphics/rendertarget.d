module dsfml.graphics.rendertarget;

import dsfml.graphics.color;
import dsfml.graphics.drawable;

abstract class RenderTarget {
	public abstract void clear(const Color color = black);
	public abstract void draw(const Drawable object);
	// TODO: version with shader.
	public abstract uint getWidth() const;
	public abstract uint getHeight() const;
	// TODO: View
}


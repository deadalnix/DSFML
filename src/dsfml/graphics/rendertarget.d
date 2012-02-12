module dsfml.graphics.rendertarget;

import dsfml.graphics.color;
import dsfml.graphics.drawable;
import dsfml.sizes;

abstract class RenderTarget {
	private void[renderTargetSize] data = void;
	
	@property
	package final inout(sfRenderTarget)* renderTarget() inout {
		return cast(inout(sfRenderTarget)*) data.ptr;
	}
	
	void clear(ref const Color color = black) {
		sfRenderTarget_Clear(renderTarget, *(cast(sfColor*) &color));
	}
	
	
	
	
	
	
	public abstract void draw(const Drawable object);
	// TODO: version with shader.
	public abstract uint getWidth() const;
	public abstract uint getHeight() const;
	// TODO: View
}

package extern(C++) {
	struct sfRenderTarget {
		void[renderTargetSize] data = void;
	}
	
	void sfRenderTarget_Clear(sfRenderTarget* renderTarget, ref const sfColor color);
}


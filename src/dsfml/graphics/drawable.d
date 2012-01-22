module dsfml.graphics.drawable;

import dsfml.graphics.rendertarget;
import dsfml.graphics.renderstates;
import dsfml.sizes;

package T getDrawable(T)(void* drawable) if(is(T : Drawable)) {
	return cast(T)(drawable - Drawable.dataOffset);
}

class Drawable {
	private void[drawableSize] data = void;
	
	// Usefull to get back the SoundSource object from C pointer to data.
	static private immutable size_t dataOffset = data.offsetof;
	
	@property
	package final inout(sfDrawable)* drawable() inout {
		return cast(inout(sfDrawable)*) data.ptr;
	}
	
	this() {
		sfDrawable_Create(drawable);
	}
	
	~this() {
		sfDrawable_Destroy(drawable);
	}
	
	/*private*/ abstract void draw(RenderTarget target, RenderStates states);
}

package extern(C++) {
	struct sfDrawable {
		void[drawableSize] data = void;
		
		@property
		package final inout(Drawable)* drawable() inout {
			return cast(inout(Drawable)*) data.ptr;
		}
	}
	
	// TODO
	void __dsfml_sfDrawable_draw(const sfDrawable* drawable, ref sfRenderTarget target, sfRenderStates states) {
		// getDrawable!(Drawable)(drawable).draw(target.renderTarget, states.renderStates);
	}
	
	void sfDrawable_Create(sfDrawable* drawable);
	void sfDrawable_Destroy(sfDrawable* drawable);
}


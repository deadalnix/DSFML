module dsfml.graphics.drawable;

import dsfml.graphics.rendertarget;
import dsfml.graphics.renderstates;
import dsfml.sizes;

alias sfDrawable Drawable;

package extern(C++) {
	interface sfDrawable {
		void Draw(ref RenderTarget target, RenderStates states);
	}
}


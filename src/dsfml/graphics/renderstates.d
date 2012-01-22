module dsfml.graphics.renderstates;

import dsfml.sizes;

struct RenderStates {
	private void[renderStatesSize] data = void;
}

package extern(C++) {
	struct sfRenderStates {
		void[RenderStates.sizeof] data = void;
	}
}


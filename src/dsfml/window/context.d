module dsfml.window.context;

import dsfml.window.contextsettings;
import dsfml.sizes;

final class Context {
	private void[contextSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfContext* context() {
		return cast(sfContext*) data.ptr;
	}
	
	@property
	package final const(sfContext)* context() const {
		return cast(const(sfContext)*) data.ptr;
	}
	
	this() {
		sfContext_Create(context);
	}
	
	this(ref const ContextSettings settings, uint width, uint height) {
		sfContext_Create(context, settings.settings, width, height);
	}
	
	~this() {
		sfContext_Destroy(context);
	}
	
	@property
	void active(bool active) {
		sfContext_SetActive(context, active);
	}
}

package extern(C++) {
	struct sfContext {
		void[contextSize] data = void;
	}
	
	void sfContext_Create(sfContext* context);
	void sfContext_Create(sfContext* context, ref const sfContextSettings settings, uint width, uint height);
	void sfContext_Destroy(sfContext* context);
	
	void sfContext_SetActive(sfContext* context, bool active);
}


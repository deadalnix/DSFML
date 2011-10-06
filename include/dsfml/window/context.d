module dsfml.window.context;

import csfml.window.context;

class Context {
	private sfContext* context;
	
	public this() {
		context = sfContext_Create();
	}
	
	public void setActive(bool active) {
		sfContext_SetActive(context, active);
	}
	
	~this() {
		sfContext_Destroy(context);
	}
}


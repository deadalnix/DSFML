module csfml.window.context;

public import csfml.window.types;

extern(C) {
	sfContext* sfContext_Create();
	void sfContext_Destroy(sfContext* context);

	void sfContext_SetActive(sfContext* context, bool active);
}


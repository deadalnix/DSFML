module dsfml.graphics.transformable;

import dsfml.sizes;

class Transformable {
	private void[transformableSize] data = void;
	
	@property
	package final inout(sfTransformable)* transformable() inout {
		return cast(inout(sfTransformable)*) data.ptr;
	}
	
	this() {
		sfTransformable_Create(transformable);
	}
	
	~this() {
		sfTransformable_Destroy(transformable);
	}
	
	// TODO: @property ???
	final void setPosition(float x, float y) {
		sfTransformable_SetPosition(transformable, x, y);
	}
	
	@property
	final void position(ref const float[2] position) {
		sfTransformable_SetPosition(transformable, position.ptr);
	}
	
	@property
	final void rotation(float angle) {
		sfTransformable_SetRotation(transformable, angle);
	}
	
	// TODO: @property ???
	final void setScale(float factorX, float factorY) {
		sfTransformable_SetScale(transformable, factorX, factorY);
	}
	
	@property
	final void scale(ref const float[2] factors) {
		sfTransformable_SetScale(transformable, factors.ptr);
	}
	
	// TODO: @property ???
	final void setOrigin(float x, float y) {
		sfTransformable_SetOrigin(transformable, x, y);
	}
	
	@property
	final void origin(ref const float[2] position) {
		sfTransformable_SetOrigin(transformable, position.ptr);
	}
}

package extern(C++) {
	struct sfTransformable {
		void[transformableSize] data = void;
	}
	
	void sfTransformable_Create(sfTransformable* transformable);
	void sfTransformable_Destroy(sfTransformable* transformable);
	
	void sfTransformable_SetPosition(sfTransformable* transformable, float x, float y);
	void sfTransformable_SetPosition(sfTransformable* transformable, const float* position);
	void sfTransformable_SetRotation(sfTransformable* transformable, float angle);
	void sfTransformable_SetScale(sfTransformable* transformable, float factorX, float factorY);
	void sfTransformable_SetScale(sfTransformable* transformable, const float* factors);
	void sfTransformable_SetOrigin(sfTransformable* transformable, float x, float y);
	void sfTransformable_SetOrigin(sfTransformable* transformable, const float* position);
}


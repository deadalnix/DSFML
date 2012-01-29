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
	
	final void setPosition(float x, float y) {
		sfTransformable_SetPosition(transformable, x, y);
	}
	
	final void setPosition(ref const float[2] position) {
		sfTransformable_SetPosition(transformable, position.ptr);
	}
	
	final void setRotation(float angle) {
		sfTransformable_SetRotation(transformable, angle);
	}
	
	final float getRotation() {
		return sfTransformable_GetRotation(transformable);
	}
	
	final void setScale(float factorX, float factorY) {
		sfTransformable_SetScale(transformable, factorX, factorY);
	}
	
	final void setScale(ref const float[2] factors) {
		sfTransformable_SetScale(transformable, factors.ptr);
	}
	
	final void setOrigin(float x, float y) {
		sfTransformable_SetOrigin(transformable, x, y);
	}
	
	final void setOrigin(ref const float[2] position) {
		sfTransformable_SetOrigin(transformable, position.ptr);
	}
	
	final void move(float offsetX, float offsetY) {
		sfTransformable_Move(transformable, offsetX, offsetY);
	}
	
	final void move(ref const float[2] offset) {
		sfTransformable_Move(transformable, offset.ptr);
	}
	
	final void rotate(float angle) {
		sfTransformable_Rotate(transformable, angle);
	}
	
	final void scale(float factorX, float factorY) {
		sfTransformable_Scale(transformable, factorX, factorY);
	}
	
	final void scale(ref const float[2] factor) {
		sfTransformable_Scale(transformable, factor.ptr);
	}
	
	// TODO: transform.
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
	
	// const(float)* sfTransformable_GetPosition(const sfTransformable* transformable);
	float sfTransformable_GetRotation(const sfTransformable* transformable);
	// const(float)* sfTransformable_GetScale(const sfTransformable* transformable);
	// const(float)* sfTransformable_GetOrigin(const sfTransformable* transformable);
	
	void sfTransformable_Move(sfTransformable* transformable, float offsetX, float offsetY);
	void sfTransformable_Move(sfTransformable* transformable, const float* offset);
	void sfTransformable_Rotate(sfTransformable* transformable, float angle);
	void sfTransformable_Scale(sfTransformable* transformable, float factorX, float factorY);
	void sfTransformable_Scale(sfTransformable* transformable, const float* factor);
	
	// TODO: transform.
}


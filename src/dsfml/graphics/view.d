module dsfml.graphics.view;

import dsfml.graphics.rect;
import dsfml.graphics.transform;

import dsfml.sizes;

struct View {
	private void[viewSize] data = void;
	
	@property
	package final ref inout(sfView) view() inout {
		return *(cast(inout(sfView)*) &this);
	}
	
	// XXX: default constructor ??
	
	this(ref const FloatRect rectangle) {
		sfView_Create(view, rectangle.rect);
	}
	
	this(ref const float[2] center, ref const float[2] size) {
		sfView_Create(view, center.ptr, size.ptr);
	}
	
	@property
	void center(ref const float[2] center) {
		sfView_SetCenter(view, center.ptr);
	}
	
	@property
	ref const(float)[2] center() const {
		return *(cast(const(float)[2]*) sfView_GetCenter(view));
	}
	
	@property
	void size(ref const float[2] size) {
		sfView_SetSize(view, size.ptr);
	}
	
	@property
	ref const(float)[2] size() const {
		return *(cast(const(float)[2]*) sfView_GetSize(view));
	}
	
	@property
	void rotation(float angle) {
		sfView_SetRotation(view, angle);
	}
	
	@property
	float rotation() const {
		return sfView_GetRotation(view);
	}
	
	@property
	void viewport(ref const FloatRect viewport) {
		sfView_SetViewport(view, viewport.rect);
	}
	
	@property
	ref const(FloatRect) viewport() const {
		return sfView_GetViewport(view).rect;
	}
	
	void reset(ref const FloatRect rectangle) {
		sfView_Reset(view, rectangle.rect);
	}
	
	void move(float offsetX, float offsetY) {
		sfView_Move(view, offsetX, offsetY);
	}
	
	void move(ref const float[2] offset) {
		sfView_Move(view, offset.ptr);
	}
	
	void rotate(float angle) {
		sfView_Rotate(view, angle);
	}
	
	void zoom(float factor) {
		sfView_Zoom(view, factor);
	}
	
	@property
	ref const(Transform) transform() const {
		return sfView_GetTransform(view).transform;
	}
	
	@property
	ref const(Transform) inverseTransform() const {
		return sfView_GetInverseTransform(view).transform;
	}
}

package extern(C++) {
	struct sfView {
		private void[viewSize] data = void;
	}
	
	void sfView_Create(ref sfView view, ref const sfFloatRect rect);
	void sfView_Create(ref sfView view, const float* center, const float* size);
	
	void sfView_SetCenter(ref sfView view, const float* center);
	void sfView_SetSize(ref sfView view, const float* size);
	void sfView_SetRotation(ref sfView view, float angle);
	void sfView_SetViewport(ref sfView view, ref const sfFloatRect viewport);
	
	const(float)* sfView_GetCenter(ref const sfView view);
	const(float)* sfView_GetSize(ref const sfView view);
	float sfView_GetRotation(ref const sfView view);
	ref const(sfFloatRect) sfView_GetViewport(ref const sfView view);
	
	void sfView_Reset(ref sfView view, ref const sfFloatRect rectangle);
	void sfView_Move(ref sfView view, float offsetX, float offsetY);
	void sfView_Move(ref sfView view, const float* offset);
	void sfView_Rotate(ref sfView view, float angle);
	void sfView_Zoom(ref sfView view, float factor);
	
	ref const(sfTransform) sfView_GetTransform(ref const sfView view);
	ref const(sfTransform) sfView_GetInverseTransform(ref const sfView view);
}


module dsfml.graphics.transform;

import dsfml.graphics.rect;

import std.math;

struct Transform {
	private float[16] _matrix = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
	
	this(float a00, float a01, float a02, float a10, float a11, float a12, float a20, float a21, float a22) {
		_matrix = [a00, a10, 0, a20, a01, a11, 0, a21, 0, 0, 1, 0, a02, a12, 0, a22];
	}
	
	// TODO: immutable ?
	@property
	ref const(float)[16] matrix() const {
		return _matrix;
	}
	
	@property
	Transform inverse() const {
		// Compute the determinant
		float det = _matrix[0] * (_matrix[15] * _matrix[5] - _matrix[7] * _matrix[13]) -
					 _matrix[1] * (_matrix[15] * _matrix[4] - _matrix[7] * _matrix[12]) +
					 _matrix[3] * (_matrix[13] * _matrix[4] - _matrix[5] * _matrix[12]);
		
		// Compute the inverse if the determinant is not zero
		// (don't use an epsilon because the determinant may *really* be tiny)
		if(det != 0.f) {
			return Transform( (_matrix[15] * _matrix[5] - _matrix[7] * _matrix[13]) / det,
							-(_matrix[15] * _matrix[4] - _matrix[7] * _matrix[12]) / det,
							 (_matrix[13] * _matrix[4] - _matrix[5] * _matrix[12]) / det,
							-(_matrix[15] * _matrix[1] - _matrix[3] * _matrix[13]) / det,
							 (_matrix[15] * _matrix[0] - _matrix[3] * _matrix[12]) / det,
							-(_matrix[13] * _matrix[0] - _matrix[1] * _matrix[12]) / det,
							 (_matrix[7] * _matrix[1] - _matrix[3] * _matrix[5]) / det,
							-(_matrix[7] * _matrix[0] - _matrix[3] * _matrix[4]) / det,
							 (_matrix[5] * _matrix[0] - _matrix[1] * _matrix[4]) / det);
		} else {
			return identity;
		}
	}
	
	float[2] transformPoint(float x, float y) const {
		return [_matrix[0] * x + _matrix[4] * y + _matrix[12], _matrix[1] * x + _matrix[5] * y + _matrix[13]];
	}
	
	float[2] transformPoint(float[2] point) const {
		return transformPoint(point[0], point[1]);
	}
	
	FloatRect transformRect(ref const FloatRect rectangle) const {
		// Transform the 4 corners of the rectangle
		const float[2][] points = [
			transformPoint(rectangle.left, rectangle.top),
			transformPoint(rectangle.left, rectangle.top + rectangle.height),
			transformPoint(rectangle.left + rectangle.width, rectangle.top),
			transformPoint(rectangle.left + rectangle.width, rectangle.top + rectangle.height)
		];
		
		// Compute the bounding rectangle of the transformed points
		float left = points[0][0];
		float top = points[0][1];
		float right = points[0][0];
		float bottom = points[0][1];
		
		foreach(point; points) {
			if(point[0] < left) {
				left = point[0];
			} else if(point[0] > right) {
				right = point[0];
			}
			
			if(point[1] < top) {
				top = point[1];
			} else if(point[1] > bottom) {
				bottom = point[1];
			}
		}
		
		return FloatRect(left, top, right - left, bottom - top);
	}
	
	Transform combine(ref const Transform transform) const {
		const float[] a = _matrix;
		const float[] b = transform._matrix;
		
		return Transform(a[0] * b[0] + a[4] * b[1] + a[12] * b[3],
						  a[0] * b[4] + a[4] * b[5] + a[12] * b[7],
						  a[0] * b[12] + a[4] * b[13] + a[12] * b[15],
						  a[1] * b[0] + a[5] * b[1] + a[13] * b[3],
						  a[1] * b[4] + a[5] * b[5] + a[13] * b[7],
						  a[1] * b[12] + a[5] * b[13] + a[13] * b[15],
						  a[3] * b[0] + a[7] * b[1] + a[15] * b[3],
						  a[3] * b[4] + a[7] * b[5] + a[15] * b[7],
						  a[3] * b[12] + a[7] * b[13] + a[15] * b[15]);
	}
	
	ref Transform translate(float x, float y) {
		auto translation = Transform(1, 0, x, 0, 1, y, 0, 0, 1);
		
		this = combine(translation);
		
		return this;
	}
	
	ref Transform translate(ref const float[2] offset) {
		return translate(offset[0], offset[1]);
	}
	
	ref Transform rotate(float angle) {
		float rad = angle * PI / 180.f;
		float cos = cos(rad);
		float sin = sin(rad);
		
		auto rotation = Transform(cos, -sin, 0, sin, cos, 0, 0, 0, 1);
		
		this = combine(rotation);
		
		return this;
	}
	
	ref Transform rotate(float angle, float centerX, float centerY) {
		float rad = angle * PI / 180.f;
		float cos = cos(rad);
		float sin = sin(rad);
		
		auto rotation = Transform(cos, -sin, centerX * (1 - cos) + centerY * sin, sin, cos, centerY * (1 - cos) - centerX * sin, 0, 0, 1);
		
		this = combine(rotation);
		
		return this;
	}
	
	ref Transform rotate(float angle, ref const float[2] center) {
		return rotate(angle, center[0], center[1]);
	}
	
	ref Transform scale(float scaleX, float scaleY) {
		auto scaling = Transform(scaleX, 0, 0, 0, scaleY, 0, 0, 0, 1);
		
		this = combine(scaling);
		
		return this;
	}
	
	ref Transform scale(float scaleX, float scaleY, float centerX, float centerY) {
		auto scaling = Transform(scaleX, 0, centerX * (1 - scaleX), 0, scaleY, centerY * (1 - scaleY), 0, 0, 1);
		
		this = combine(scaling);
		
		return this;
	}
	
	ref Transform scale(ref const float[2] factors) {
		return scale(factors[0], factors[1]);
	}
	
	ref Transform scale(ref const float[2] factors, ref const float[2] center) {
		return scale(factors[0], factors[1], center[0], center[1]);
	}
	
	Transform opBinary(string op : "*")(ref const Transform other) const {
		return combine(other);
	}
	
	ref Transform opOpAssign(string op : "*")(ref const Transform other) {
		this = combine(other);
		
		return this;
	}
	
	float[2] opBinary(string op : "*")(ref const float[2] other) const {
		return transformPoint(other);
	}
}

immutable Transform identity;

// TODO: unittest


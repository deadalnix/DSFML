#include<SFML/Graphics/View.hpp>
#include<SFML/Graphics/Rect.hpp>
#include<new>

typedef sf::View sfView;
typedef sf::FloatRect sfFloatRect;

void sfView_Create(sfView& view, const sfFloatRect& rect) {
	new(&view) sfView(rect);
}

void sfView_Create(sfView& view, const float* center, const float* size) {
	new(&view) sfView(*reinterpret_cast<const sf::Vector2f*>(center), *reinterpret_cast<const sf::Vector2f*>(size));
}

void sfView_SetCenter(sfView& view, const float* center) {
	view.SetCenter(*reinterpret_cast<const sf::Vector2f*>(center));
}

void sfView_SetSize(sfView& view, const float* size) {
	view.SetSize(*reinterpret_cast<const sf::Vector2f*>(size));
}

void sfView_SetRotation(sfView& view, float angle) {
	view.SetRotation(angle);
}

void sfView_SetViewport(sfView& view, const sfFloatRect& viewport) {
	view.SetViewport(viewport);
}

const float* sfView_GetCenter(const sfView& view) {
	return reinterpret_cast<const float*>(&view.GetCenter());
}

const float* sfView_GetSize(const sfView& view) {
	return reinterpret_cast<const float*>(&view.GetSize());
}

float sfView_GetRotation(const sfView& view) {
	return view.GetRotation();
}

const sfFloatRect& sfView_GetViewport(const sfView& view) {
	return view.GetViewport();
}

void sfView_Reset(sfView& view, const sfFloatRect& rectangle) {
	return view.Reset(rectangle);
}

void sfView_Move(sfView& view, float offsetX, float offsetY) {
	return view.Move(offsetX, offsetY);
}

void sfView_Move(sfView& view, const float* offset) {
	return view.Move(*reinterpret_cast<const sf::Vector2f*>(offset));
}

void sfView_Rotate(sfView& view, float angle) {
	view.Rotate(angle);
}

void sfView_Zoom(sfView& view, float factor) {
	view.Zoom(factor);
}


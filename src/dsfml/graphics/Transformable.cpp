#include<SFML/Graphics/Transformable.hpp>
#include<new>

typedef sf::Transformable sfTransformable;

void sfTransformable_Create(sfTransformable* transformable) {
	new(transformable) sfTransformable();
}

void sfTransformable_Destroy(sfTransformable* transformable) {
	transformable->~sfTransformable();
}

void sfTransformable_SetPosition(sfTransformable* transformable, float x, float y) {
	transformable->SetPosition(x, y);
}

void sfTransformable_SetPosition(sfTransformable* transformable, const float* position) {
	transformable->SetPosition(*reinterpret_cast<const sf::Vector2f*>(position));
}

void sfTransformable_SetRotation(sfTransformable* transformable, float angle) {
	transformable->SetRotation(angle);
}

void sfTransformable_SetScale(sfTransformable* transformable, float factorX, float factorY) {
	transformable->SetScale(factorX, factorY);
}

void sfTransformable_SetScale(sfTransformable* transformable, const float* factors) {
	transformable->SetScale(*reinterpret_cast<const sf::Vector2f*>(factors));
}

void sfTransformable_SetOrigin(sfTransformable* transformable, float x, float y) {
	transformable->SetOrigin(x, y);
}

void sfTransformable_SetOrigin(sfTransformable* transformable, const float* position) {
	transformable->SetOrigin(*reinterpret_cast<const sf::Vector2f*>(position));
}


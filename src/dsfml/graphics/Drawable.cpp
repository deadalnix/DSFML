#include<SFML/Graphics/Drawable.hpp>
#include<new>

typedef sf::RenderTarget sfRenderTarget;
typedef sf::RenderStates sfRenderStates;
class sfDrawable;

// Function to get back in D.
void __dsfml_sfDrawable_draw(const sfDrawable* drawable, sfRenderTarget& target, sfRenderStates states);

// TODO: get back in D for destructor.
class sfDrawable : public sf::Drawable {
public :
	sfDrawable() {}
	~sfDrawable() {}
	
private :
	void Draw(sf::RenderTarget& target, sf::RenderStates states) const {
		__dsfml_sfDrawable_draw(this, target, states);
	}
};

void sfDrawable_Create(sfDrawable* drawable) {
	new(drawable) sfDrawable();
}

void sfDrawable_Destroy(sfDrawable* drawable) {
	drawable->~sfDrawable();
}


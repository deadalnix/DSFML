#include<SFML/Window/Context.hpp>
#include<new>

typedef sf::Context sfContext;

void sfContext_Create(sfContext* context) {
	new(context) sfContext();
}

typedef sf::ContextSettings sfContextSettings;

void sfContext_Create(sfContext* context, const sfContextSettings& settings, unsigned int width, unsigned int height) {
	new(context) sfContext(settings, width, height);
}

void sfContext_Destroy(sfContext* context) {
	context->~sfContext();
}
	
void sfContext_SetActive(sfContext* context, bool active) {
	context->SetActive(active);
}


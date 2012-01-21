#include<SFML/System/Time.hpp>
#include<new>

typedef sf::Time sfTime;

void sfTime_Create(sfTime* time) {
	new(time) sfTime();
}

void sfTime_Destroy(sfTime* time) {
	time->~sfTime();
}


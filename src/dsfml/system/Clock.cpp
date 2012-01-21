#include<SFML/System/Clock.hpp>
#include<new>

typedef sf::Clock sfClock;

void sfClock_Create(sfClock* clock) {
	new(clock) sfClock();
}

void sfClock_Destroy(sfClock* clock) {
	clock->~sfClock();
}

typedef sf::Time sfTime;

sfTime sfClock_GetElapsedTime(const sfClock* clock) {
	return clock->GetElapsedTime();
}

sfTime sfClock_Restart(sfClock* clock) {
	return clock->Restart();
}


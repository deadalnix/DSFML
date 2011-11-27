#include<SFML/System/Mutex.hpp>
#include<new>

typedef sf::Mutex sfMutex;

void sfMutex_Create(sfMutex* mutex) {
	new(mutex) sfMutex();
}

void sfMutex_Destroy(sfMutex* mutex) {
	mutex->~sfMutex();
}

void sfMutex_Lock(sfMutex* mutex) {
	mutex->Lock();
}

void sfMutex_Unlock(sfMutex* mutex) {
	mutex->Unlock();
}


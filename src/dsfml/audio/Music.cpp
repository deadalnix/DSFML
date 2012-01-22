#include<SFML/Audio/Music.hpp>
#include<new>

typedef sf::Music sfMusic;

void sfMusic_Create(sfMusic* music) {
	new(music) sfMusic();
}

void sfMusic_Destroy(sfMusic* music) {
	music->~sfMusic();
}

bool sfMusic_OpenFromFile(sfMusic* music, const char* filename) {
	return music->OpenFromFile(filename);
}

bool sfMusic_OpenFromMemory(sfMusic* music, const void* data, size_t sizeInBytes) {
	return music->OpenFromMemory(data, sizeInBytes);
}

typedef sf::InputStream sfInputStream;

bool sfMusic_OpenFromStream(sfMusic* music, sfInputStream* stream) {
	return music->OpenFromStream(*stream);
}

typedef sf::Time sfTime;

sfTime sfMusic_GetDuration(const sfMusic* music) {
	return music->GetDuration();
}


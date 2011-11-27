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
	music->OpenFromFile(filename);
}

bool sfMusic_OpenFromMemory(sfMusic* music, const void* data, size_t sizeInBytes) {
	return music->OpenFromMemory(data, sizeInBytes);
}

typedef sf::InputStream InputStream;

bool sfMusic_OpenFromStream(sfMusic* music, InputStream* stream) {
	music->OpenFromStream(*stream);
}

sf::Uint32 sfMusic_GetDuration(const sfMusic* music) {
	music->GetDuration();
}


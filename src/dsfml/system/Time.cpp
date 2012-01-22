#include<SFML/System/Time.hpp>
#include<new>

typedef sf::Time sfTime;

void sfTime_Create(sfTime* time) {
	new(time) sfTime();
}

float sfTime_AsSeconds(const sfTime& time) {
	return time.AsSeconds();
}

sf::Int32 sfTime_AsMilliseconds(const sfTime& time) {
	return time.AsMilliseconds();
}

sf::Int64 sfTime_AsMicroseconds(const sfTime& time) {
	return time.AsMicroseconds();
}


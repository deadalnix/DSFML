#include<SFML/Network/Socket.hpp>
#include<SFML/System/Enumeration.hpp>
#include<new>

class sfSocket : public sf::Socket {
public:
	sfSocket(unsigned int type) : sf::Socket(sf::Enumeration<sf::Socket::Type, unsigned int>(type)) {}
};

void sfSocket_Create(sfSocket* socket, unsigned int type) {
	new(socket) sfSocket(type);
}

void sfSocket_Destroy(sfSocket* socket) {
	socket->~sfSocket();
}

void sfSocket_SetBlocking(sfSocket* socket, bool blocking) {
	socket->SetBlocking(blocking);
}

bool sfSocket_IsBlocking(const sfSocket* socket) {
	return socket->IsBlocking();
}


#include<SFML/Network/TcpListener.hpp>
#include<new>

typedef sf::TcpListener sfTcpListener;

void sfTcpListener_Create(sfTcpListener* listener) {
	new(listener) sfTcpListener();
}

void sfTcpListener_Destroy(sfTcpListener* listener) {
	listener->~sfTcpListener();
}

unsigned short sfTcpListener_GetLocalPort(const sfTcpListener* listener) {
	return listener->GetLocalPort();
}

unsigned int sfTcpListener_Listen(sfTcpListener* listener, unsigned short port) {
	return listener->Listen(port);
}


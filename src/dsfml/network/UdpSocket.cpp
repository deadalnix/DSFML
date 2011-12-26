#include<SFML/Network/UdpSocket.hpp>
#include<new>

typedef sf::UdpSocket sfUdpSocket;

void sfUdpSocket_Create(sfUdpSocket* udpSocket) {
	new(udpSocket) sfUdpSocket();
}

void sfUdpSocket_Destroy(sfUdpSocket* udpSocket) {
	udpSocket->~sfUdpSocket();
}

unsigned short sfUdpSocket_GetLocalPort(const sfUdpSocket* udpSocket) {
	return udpSocket->GetLocalPort();
}

unsigned int sfUdpSocket_Bind(sfUdpSocket* udpSocket, unsigned short port) {
	return udpSocket->Bind(port);
}

void sfUdpSocket_Unbind(sfUdpSocket* udpSocket) {
	return udpSocket->Unbind();
}


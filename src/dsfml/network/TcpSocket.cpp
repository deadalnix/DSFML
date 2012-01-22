#include<SFML/Network/TcpSocket.hpp>
#include<SFML/Network/IpAddress.hpp>
#include<new>

typedef sf::TcpSocket sfTcpSocket;

void sfTcpSocket_Create(sfTcpSocket* tcpSocket) {
	new(tcpSocket) sfTcpSocket();
}

void sfTcpSocket_Destroy(sfTcpSocket* tcpSocket) {
	tcpSocket->~sfTcpSocket();
}

unsigned short sfTcpSocket_GetLocalPort(const sfTcpSocket* tcpSocket) {
	return tcpSocket->GetLocalPort();
}

typedef sf::IpAddress sfIpAddress;

sfIpAddress sfTcpSocket_GetRemoteAddress(const sfTcpSocket* tcpSocket) {
	return tcpSocket->GetRemoteAddress();
}

unsigned short sfTcpSocket_GetRemotePort(const sfTcpSocket* tcpSocket) {
	return tcpSocket->GetRemotePort();
}

typedef sf::Time sfTime;

unsigned int sfTcpSocket_Connect(sfTcpSocket* tcpSocket, const sfIpAddress& remoteAddress, unsigned short remotePort, sfTime timeout) {
	return tcpSocket->Connect(remoteAddress, remotePort, timeout);
}

void sfTcpSocket_Disconnect(sfTcpSocket* tcpSocket) {
	tcpSocket->Disconnect();
}

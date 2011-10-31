module csfml.network.tcpsocket;

public import csfml.network.types;
public import csfml.network.socketstatus;

import csfml.network.ipaddress;

extern(C) {
	sfTcpSocket* sfTcpSocket_Create();
	void sfTcpSocket_Destroy(sfTcpSocket* socket);
	void sfTcpSocket_SetBlocking(sfTcpSocket* socket, bool blocking);
	bool sfTcpSocket_IsBlocking(const sfTcpSocket* socket);
	ushort sfTcpSocket_GetLocalPort(const sfTcpSocket* socket);
	sfIpAddress sfTcpSocket_GetRemoteAddress(const sfTcpSocket* socket);
	ushort sfTcpSocket_GetRemotePort(const sfTcpSocket* socket);
	sfSocketStatus sfTcpSocket_Connect(sfTcpSocket* socket, sfIpAddress host, ushort port, uint timeout);
	void sfTcpSocket_Disconnect(sfTcpSocket* socket);
	sfSocketStatus sfTcpSocket_Send(sfTcpSocket* socket, const byte* data, size_t size);
	sfSocketStatus sfTcpSocket_Receive(sfTcpSocket* socket, byte* data, size_t maxSize, size_t* sizeReceived);
	sfSocketStatus sfTcpSocket_SendPacket(sfTcpSocket* socket, sfPacket* packet);
	sfSocketStatus sfTcpSocket_ReceivePacket(sfTcpSocket* socket, sfPacket* packet);
}


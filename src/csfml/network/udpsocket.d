module csfml.network.udpsocket;

public import csfml.network.types;
public import csfml.network.socketstatus;

import csfml.network.ipaddress;

extern(C) {
	sfUdpSocket* sfUdpSocket_Create();
	void sfUdpSocket_Destroy(sfUdpSocket* socket);
	void sfUdpSocket_SetBlocking(sfUdpSocket* socket, bool blocking);
	bool sfUdpSocket_IsBlocking(const sfUdpSocket* socket);
	ushort sfUdpSocket_GetLocalPort(const sfUdpSocket* socket);
	sfSocketStatus sfUdpSocket_Bind(sfUdpSocket* socket, ushort port);
	void sfUdpSocket_Unbind(sfUdpSocket* socket);
	sfSocketStatus sfUdpSocket_Send(sfUdpSocket* socket, const byte* data, size_t size, sfIpAddress address, ushort port);
	sfSocketStatus sfUdpSocket_Receive(sfUdpSocket* socket, byte* data, size_t maxSize, size_t* sizeReceived, sfIpAddress* address, ushort* port);
	sfSocketStatus sfUdpSocket_SendPacket(sfUdpSocket* socket, sfPacket* packet, sfIpAddress address, ushort port);
	sfSocketStatus sfUdpSocket_ReceivePacket(sfUdpSocket* socket, sfPacket* packet, sfIpAddress* address, ushort* port);
	uint sfUdpSocket_MaxDatagramSize();
}


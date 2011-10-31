module csfml.network.tcplistener;

public import csfml.network.types;
public import csfml.network.socketstatus;

extern(C) {
	sfTcpListener* sfTcpListener_Create();
	void sfTcpListener_Destroy(sfTcpListener* listener);
	void sfTcpListener_SetBlocking(sfTcpListener* listener, bool blocking);
	bool sfTcpListener_IsBlocking(const sfTcpListener* listener);
	ushort sfTcpListener_GetLocalPort(const sfTcpListener* listener);
	sfSocketStatus sfTcpListener_Listen(sfTcpListener* listener, ushort port);
	sfSocketStatus sfTcpListener_Accept(sfTcpListener* listener, sfTcpSocket** connected);
}


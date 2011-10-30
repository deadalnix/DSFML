module csfml.network.socketselector;

public import csfml.network.types;

extern(C) {
	sfSocketSelector* sfSocketSelector_Create();
	sfSocketSelector* sfSocketSelector_Copy(sfSocketSelector* selector);
	void sfSocketSelector_Destroy(sfSocketSelector* selector);
	void sfSocketSelector_AddTcpListener(sfSocketSelector* selector, sfTcpListener* socket);
	void sfSocketSelector_AddTcpSocket(sfSocketSelector* selector, sfTcpSocket* socket);
	void sfSocketSelector_AddUdpSocket(sfSocketSelector* selector, sfUdpSocket* socket);
	void sfSocketSelector_RemoveTcpListener(sfSocketSelector* selector, sfTcpListener* socket);
	void sfSocketSelector_RemoveTcpSocket(sfSocketSelector* selector, sfTcpSocket* socket);
	void sfSocketSelector_RemoveUdpSocket(sfSocketSelector* selector, sfUdpSocket* socket);
	void sfSocketSelector_Clear(sfSocketSelector* selector);
	bool sfSocketSelector_Wait(sfSocketSelector* selector, uint timeout);
	bool sfSocketSelector_IsTcpListenerReady(const sfSocketSelector* selector, sfTcpListener* socket);
	bool sfSocketSelector_IsTcpSocketReady(const sfSocketSelector* selector, sfTcpSocket* socket);
	bool sfSocketSelector_IsUdpSocketReady(const sfSocketSelector* selector, sfUdpSocket* socket);
}


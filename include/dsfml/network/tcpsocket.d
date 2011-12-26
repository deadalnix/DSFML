module dsfml.network.tcpsocket;

import csfml.network.socketselector;
import csfml.network.tcpsocket;

import dsfml.network.ipaddress;
import dsfml.network.packet;
import dsfml.network.socket;

class TcpSocket : Socket {
	private sfTcpSocket* socket;
	
	public this() {
		socket = sfTcpSocket_Create();
	}
	
	public ~this() {
		sfTcpSocket_Destroy(socket);
	}
	
	public const(sfTcpSocket*) getCTcpSocket() const {
		return socket;
	}
	
	public immutable(sfTcpSocket*) getCTcpSocket() immutable {
		return socket;
	}
	
	public sfTcpSocket* getCTcpSocket() {
		return socket;
	}
	
	public void setBlocking(bool blocking) {
		sfTcpSocket_SetBlocking(socket, blocking);
	}
	
	public bool isBlocking() const {
		return sfTcpSocket_IsBlocking(socket);
	}
	
	public ushort getLocalPort() const {
		return sfTcpSocket_GetLocalPort(socket);
	}
	/*
	public IpAddress getRemoteAddress() const {
		return IpAddress(sfTcpSocket_GetRemoteAddress(socket));
	}
	*/
	public ushort getRemotePort() const {
		return sfTcpSocket_GetRemotePort(socket);
	}
	/*
	public sfSocketStatus connect(IpAddress remoteAddress, ushort remotePort, uint timeout = 0) {
		return sfTcpSocket_Connect(socket, remoteAddress.getCIpAddress(), remotePort, timeout);
	}
	*/
	public void disconnect() {
		sfTcpSocket_Disconnect(socket);
	}
	
	public sfSocketStatus send(const byte[] data) {
		return sfTcpSocket_Send(socket, data.ptr, data.length);
	}
	
	public sfSocketStatus recieve(ref byte[] data) {
		size_t sizeReceived;
		sfSocketStatus ret = sfTcpSocket_Receive(socket, data.ptr, data.length, &sizeReceived);
		
		data = data[0 .. sizeReceived];
		return ret;
	}
	/*
	public sfSocketStatus send(Packet packet) {
		return sfTcpSocket_SendPacket(socket, packet.getCPacket());
	}
	
	public sfSocketStatus recieve(Packet packet) {
		return sfTcpSocket_ReceivePacket(socket, packet.getCPacket());
	}
	*//*
	public void addSocketSelector(SocketSelector selector) {
		sfSocketSelector_AddTcpSocket(selector.getCSocketSelector(), socket);
	}
	
	public void removeSocketSelector(SocketSelector selector) {
		sfSocketSelector_RemoveTcpSocket(selector.getCSocketSelector(), socket);
	}
	
	public bool isReadySocketSelector(const SocketSelector selector) {
		return sfSocketSelector_IsTcpSocketReady(selector.getCSocketSelector(), socket);
	}*/
}


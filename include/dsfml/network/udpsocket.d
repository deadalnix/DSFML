module dsfml.network.udpsocket;

import csfml.network.socketselector;
import csfml.network.udpsocket;

import dsfml.network.ipaddress;
import dsfml.network.packet;
import dsfml.network.socket;
import dsfml.network.socketselector;

public immutable uint MAX_DATAGRAM_SIZE;

static this() {
	MAX_DATAGRAM_SIZE = sfUdpSocket_MaxDatagramSize();
}

class UdpSocket : Socket {
	private sfUdpSocket* socket;
	
	public this() {
		socket = sfUdpSocket_Create();
	}
	
	public ~this() {
		sfUdpSocket_Destroy(socket);
	}
	
	public void setBlocking(bool blocking) {
		sfUdpSocket_SetBlocking(socket, blocking);
	}
	
	public bool isBlocking() const {
		return sfUdpSocket_IsBlocking(socket);
	}
	
	public ushort getLocalPort() const {
		return sfUdpSocket_GetLocalPort(socket);
	}
	
	public sfSocketStatus bind(ushort port) {
		return sfUdpSocket_Bind(socket, port);
	}
	
	public void unbind() {
		sfUdpSocket_Unbind(socket);
	}
	/*
	public sfSocketStatus send(const byte[] data, IpAddress remoteAddress, ushort remotePort) {
		return sfUdpSocket_Send(socket, data.ptr, data.length, remoteAddress.getCIpAddress(), remotePort);
	}
	
	public sfSocketStatus recieve(ref byte[] data, IpAddress remoteAddress, ref ushort remotePort) {
		size_t sizeReceived;
		sfSocketStatus ret = sfUdpSocket_Receive(socket, data.ptr, data.length, &sizeReceived, remoteAddress.getCIpAddressPtr(), &remotePort);
		
		data = data[0 .. sizeReceived];
		return ret;
	}
	
	public sfSocketStatus send(Packet packet, IpAddress remoteAddress, ushort remotePort) {
		return sfUdpSocket_SendPacket(socket, packet.getCPacket(), remoteAddress.getCIpAddress(), remotePort);
	}
	
	public sfSocketStatus recieve(Packet packet, IpAddress remoteAddress, ref ushort remotePort) {
		return sfUdpSocket_ReceivePacket(socket, packet.getCPacket(), remoteAddress.getCIpAddressPtr(), &remotePort);
	}
	*/
	public void addSocketSelector(SocketSelector selector) {
		sfSocketSelector_AddUdpSocket(selector.getCSocketSelector(), socket);
	}
	
	public void removeSocketSelector(SocketSelector selector) {
		sfSocketSelector_RemoveUdpSocket(selector.getCSocketSelector(), socket);
	}
	
	public bool isReadySocketSelector(const SocketSelector selector) {
		return sfSocketSelector_IsUdpSocketReady(selector.getCSocketSelector(), socket);
	}
}


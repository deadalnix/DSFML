module dsfml.network.tcpsocket;

import dsfml.network.ipaddress;
import dsfml.network.packet;
import dsfml.network.socket;
import dsfml.system.time;
import dsfml.sizes;

final class TcpSocket : Socket {
	private void[tcpSocketSize - socketSize] data = void;
	
	@property
	package final inout(sfTcpSocket)* tcpSocket() inout {
		return cast(inout(sfTcpSocket)*) socket;
	}
	
	this() {
		sfTcpSocket_Create(tcpSocket);
	}
	
	~this() {
		sfTcpSocket_Destroy(tcpSocket);
	}
	
	@property
	ushort localPort() const {
		return sfTcpSocket_GetLocalPort(tcpSocket);
	}
	
	@property
	IpAddress remoteAddress() const {
		sfIpAddress tmp = sfTcpSocket_GetRemoteAddress(tcpSocket);
		return tmp.ipAddress;
	}
	
	@property
	ushort remotePort() const {
		return sfTcpSocket_GetRemotePort(tcpSocket);
	}
	
	Status connect(ref const IpAddress remoteAddress, ushort remotePort, Time timeout = Time()) {
		return cast(Status) sfTcpSocket_Connect(tcpSocket, remoteAddress.ipAddress, remotePort, *(cast(sfTime*) &timeout));
	}
	
	void disconnect() {
		sfTcpSocket_Disconnect(tcpSocket);
	}
	
	// TODO: send and receive.
}

package extern(C++) {
	struct sfTcpSocket {
		void[tcpSocketSize] data = void;
	}
	
	void sfTcpSocket_Create(sfTcpSocket* tcpSocket);
	void sfTcpSocket_Destroy(sfTcpSocket* tcpSocket);
	
	ushort sfTcpSocket_GetLocalPort(const sfTcpSocket* tcpSocket);
	sfIpAddress sfTcpSocket_GetRemoteAddress(const sfTcpSocket* tcpSocket);
	ushort sfTcpSocket_GetRemotePort(const sfTcpSocket* tcpSocket);
	
	uint sfTcpSocket_Connect(sfTcpSocket* tcpSocket, ref const sfIpAddress remoteAddress, ushort remotePort, sfTime timeout);
	void sfTcpSocket_Disconnect(sfTcpSocket* tcpSocket);
}


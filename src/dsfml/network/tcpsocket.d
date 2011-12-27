module dsfml.network.tcpsocket;

import dsfml.network.ipaddress;
import dsfml.network.packet;
import dsfml.network.socket;
import dsfml.sizes;

final class TcpSocket : Socket {
	private void[tcpSocketSize - socketSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfTcpSocket* tcpSocket() {
		return cast(sfTcpSocket*) socket;
	}
	
	@property
	package final const(sfTcpSocket)* tcpSocket() const {
		return cast(const(sfTcpSocket)*) socket;
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
	
	Status connect(ref const IpAddress remoteAddress, ushort remotePort, uint timeout = 0) {
		return cast(Status) sfTcpSocket_Connect(tcpSocket, remoteAddress.ipAddress, remotePort, timeout);
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
	
	uint sfTcpSocket_Connect(sfTcpSocket* tcpSocket, ref const sfIpAddress remoteAddress, ushort remotePort, uint timeout);
	void sfTcpSocket_Disconnect(sfTcpSocket* tcpSocket);
}


module dsfml.network.udpsocket;

import dsfml.network.ipaddress;
import dsfml.network.packet;
import dsfml.network.socket;
import dsfml.sizes;

final class UdpSocket : Socket {
	private void[udpSocketSize - socketSize] data = void;
	
	@property
	package final inout(sfUdpSocket)* udpSocket() inout {
		return cast(inout(sfUdpSocket)*) socket;
	}
	
	this() {
		sfUdpSocket_Create(udpSocket);
	}
	
	~this() {
		sfUdpSocket_Destroy(udpSocket);
	}
	
	@property
	ushort localPort() const {
		return sfUdpSocket_GetLocalPort(udpSocket);
	}
	
	Status bind(ushort port) {
		return cast(Status) sfUdpSocket_Bind(udpSocket, port);
	}
	
	void unbind() {
		sfUdpSocket_Unbind(udpSocket);
	}
	
	// TODO: send and receive.
}

package extern(C++) {
	struct sfUdpSocket {
		void[udpSocketSize] data = void;
	}
	
	void sfUdpSocket_Create(sfUdpSocket* udpSocket);
	void sfUdpSocket_Destroy(sfUdpSocket* udpSocket);
	
	ushort sfUdpSocket_GetLocalPort(const sfUdpSocket* udpSocket);
	uint sfUdpSocket_Bind(sfUdpSocket* udpSocket, ushort port);
	void sfUdpSocket_Unbind(sfUdpSocket* udpSocket);
}


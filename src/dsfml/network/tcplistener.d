module dsfml.network.tcplistener;

import dsfml.network.socket;
import dsfml.network.tcpsocket;
import dsfml.sizes;

final class TcpListener : Socket {
	private void[tcpListenerSize - socketSize] data = void;
	
	@property
	package final inout(sfTcpListener)* listener() inout {
		return cast(inout(sfTcpListener)*) socket;
	}
	
	this() {
		sfTcpListener_Create(listener);
	}
	
	~this() {
		sfTcpListener_Destroy(listener);
	}
	
	@property
	ushort localPort() const {
		return sfTcpListener_GetLocalPort(listener);
	}
	
	Status listen(ushort port) {
		return cast(Status) sfTcpListener_Listen(listener, port);
	}
	
	void close() {
		sfTcpListener_Close(listener);
	}
	
	Status accept(TcpSocket socket) {
		return cast(Status) sfTcpListener_Accept(listener, *socket.tcpSocket);
	}
}

package extern(C++) {
	struct sfTcpListener {
		void[tcpListenerSize] data = void;
	}
	
	void sfTcpListener_Create(sfTcpListener* listener);
	void sfTcpListener_Destroy(sfTcpListener* listener);
	
	ushort sfTcpListener_GetLocalPort(const sfTcpListener* listener);
	uint sfTcpListener_Listen(sfTcpListener* listener, ushort port);
	
	void sfTcpListener_Close(sfTcpListener* listener);
	uint sfTcpListener_Accept(sfTcpListener* listener, ref sfTcpSocket socket);
}


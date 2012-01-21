module dsfml.network.socket;

import dsfml.sizes;

enum Status {
	Done,
	NotReady,
	Disconnected,
	Error,
}

enum {
	AnyPort = 0,
}

abstract class Socket {
	private void[socketSize] data = void;
	
	@property
	package final inout(sfSocket)* socket() inout {
		return cast(inout(sfSocket)*) data.ptr;
	}
	
	protected enum Type {
		Tcp,
		Udp,
	}
	
	~this() {
		sfSocket_Destroy(socket);
	}
	
	@property
	final void blocking(bool blocking) {
		sfSocket_SetBlocking(socket, blocking);
	}
	
	@property
	final bool blocking() const {
		return sfSocket_IsBlocking(socket);
	}
	
	// TODO: implement protected methods ?
}

package extern(C++) {
	struct sfSocket {
		void[socketSize] data = void;
	}
	
	void sfSocket_Create(sfSocket* socket, uint type);
	void sfSocket_Destroy(sfSocket* socket);
	
	void sfSocket_SetBlocking(sfSocket* socket, bool blocking);
	bool sfSocket_IsBlocking(const sfSocket* socket);
}


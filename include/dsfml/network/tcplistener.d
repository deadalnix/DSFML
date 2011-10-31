module dsfml.network.tcplistener;

import csfml.network.socketselector;
import csfml.network.tcplistener;
import csfml.network.tcpsocket;

import dsfml.network.socket;
import dsfml.network.socketselector;
import dsfml.network.tcpsocket;

class TcpListener : Socket {
	private sfTcpListener* listener;
	
	public this() {
		listener = sfTcpListener_Create();
	}
	
	public ~this() {
		sfTcpListener_Destroy(listener);
	}
	
	public void setBlocking(bool blocking) {
		sfTcpListener_SetBlocking(listener, blocking);
	}
	
	public bool isBlocking() const {
		return sfTcpListener_IsBlocking(listener);
	}
	
	public ushort getLocalPort() const {
		return sfTcpListener_GetLocalPort(listener);
	}
	
	public sfSocketStatus listen(ushort port) {
		return sfTcpListener_Listen(listener, port);
	}
	
	public sfSocketStatus accept(TcpSocket socket) {
		sfTcpSocket* connected = socket.getCTcpSocket();
		
		assert(connected != null, "Connected shouldn't be null.");
		// Avoid memory leak
		sfTcpSocket_Destroy(connected);
		
		return sfTcpListener_Accept(listener, &connected);
	}
	
	public void addSocketSelector(SocketSelector selector) {
		sfSocketSelector_AddTcpListener(selector.getCSocketSelector(), listener);
	}
	
	public void removeSocketSelector(SocketSelector selector) {
		sfSocketSelector_RemoveTcpListener(selector.getCSocketSelector(), listener);
	}
	
	public bool isReadySocketSelector(const SocketSelector selector) {
		return sfSocketSelector_IsTcpListenerReady(selector.getCSocketSelector(), listener);
	}
}


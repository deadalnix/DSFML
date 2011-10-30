module dsfml.network.socketselector;

import csfml.network.socketselector;

import dsfml.network.socket;

class SocketSelector {
	private sfSocketSelector* selector;
	
	public this() {
		selector = sfSocketSelector_Create();
	}
	
	public SocketSelector clone() {
		return new SocketSelector(this);
	}
	
	private this(SocketSelector selector) {
		this.selector = sfSocketSelector_Copy(selector.selector);
	}
	
	public ~this() {
		sfSocketSelector_Destroy(selector);
	}
	
	public void add(Socket socket) {
		// TODO:
		/*
		void sfSocketSelector_AddTcpListener(selector, sfTcpListener* socket);
		void sfSocketSelector_AddTcpSocket(selector, sfTcpSocket* socket);
		void sfSocketSelector_AddUdpSocket(selector, sfUdpSocket* socket);
		*/
	}
	
	public void remove(Socket socket) {
		// TODO:
		/*
		void sfSocketSelector_RemoveTcpListener(selector, sfTcpListener* socket);
		void sfSocketSelector_RemoveTcpSocket(selector, sfTcpSocket* socket);
		void sfSocketSelector_RemoveUdpSocket(selector, sfUdpSocket* socket);
		*/
	}
	
	public void clear() {
		sfSocketSelector_Clear(selector);
	}
	
	public bool wait(uint timeout = 0) {
		return sfSocketSelector_Wait(selector, timeout);
	}
	
	public bool isReady(Socket socket) const {
		// TODO:
		/*
		bool sfSocketSelector_IsTcpListenerReady(const selector, sfTcpListener* socket);
		bool sfSocketSelector_IsTcpSocketReady(const selector, sfTcpSocket* socket);
		bool sfSocketSelector_IsUdpSocketReady(const selector, sfUdpSocket* socket);
		*/
		return false;
	}
}


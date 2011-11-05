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
	
	public const(sfSocketSelector*) getCSocketSelector() const {
		return selector;
	}
	
	public immutable(sfSocketSelector*) getCSocketSelector() immutable {
		return selector;
	}
	
	public sfSocketSelector* getCSocketSelector() {
		return selector;
	}
	
	public void add(Socket socket) {
		socket.addSocketSelector(this);
	}
	
	public void remove(Socket socket) {
		socket.removeSocketSelector(this);
	}
	
	public void clear() {
		sfSocketSelector_Clear(selector);
	}
	
	public bool wait(uint timeout = 0) {
		return sfSocketSelector_Wait(selector, timeout);
	}
	
	public bool isReady(Socket socket) const {
		return socket.isReadySocketSelector(this);
	}
}


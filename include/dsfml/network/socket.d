module dsfml.network.socket;

import dsfml.network.socketselector;

abstract class Socket {
	abstract void setBlocking(bool blocking);
	abstract bool isBlocking() const;
	
	abstract void addSocketSelector(SocketSelector selector);
	abstract void removeSocketSelector(SocketSelector selector);
	abstract bool isReadySocketSelector(const SocketSelector selector);
}


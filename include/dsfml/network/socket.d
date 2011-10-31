module dsfml.network.socket;

abstract class Socket {
	abstract void setBlocking(bool blocking);
	abstract bool isBlocking() const;
}


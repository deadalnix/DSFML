module dsfml.system.mutex;

import dsfml.sizes;

// If one day D support default constructor for structs, this should be changed to struct.
final class Mutex {
	private void[mutexSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfMutex* mutex() {
		return cast(sfMutex*) data.ptr;
	}
	
	@property
	package final const(sfMutex)* mutex() const {
		return cast(const(sfMutex)*) data.ptr;
	}
	
	public this() {
		sfMutex_Create(mutex);
	}
	
	public void lock() {
		return sfMutex_Lock(mutex);
	}
	
	public void unlock() {
		return sfMutex_Unlock(mutex);
	}
	
	~this() {
		sfMutex_Destroy(mutex);
	}
}

private extern(C++) {
	// Opaque struct ?
	struct sfMutex {}
	
	void sfMutex_Create(sfMutex* mutex);
	void sfMutex_Destroy(sfMutex* mutex);
	
	void sfMutex_Lock(sfMutex* mutex);
	void sfMutex_Unlock(sfMutex* mutex);
}


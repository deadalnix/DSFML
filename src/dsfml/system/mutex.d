module dsfml.system.mutex;

import dsfml.sizes;

// If one day D support default constructor for structs, this should be changed to struct.
final class Mutex {
	private void[mutexSize] data = void;
	
	@property
	package final inout(sfMutex)* mutex() inout {
		return cast(inout(sfMutex)*) data.ptr;
	}
	
	this() {
		sfMutex_Create(mutex);
	}
	
	~this() {
		sfMutex_Destroy(mutex);
	}
	
	void lock() {
		return sfMutex_Lock(mutex);
	}
	
	void unlock() {
		return sfMutex_Unlock(mutex);
	}
}

private extern(C++) {
	// Opaque struct ?
	struct sfMutex {
		void[mutexSize] data = void;
	}
	
	void sfMutex_Create(sfMutex* mutex);
	void sfMutex_Destroy(sfMutex* mutex);
	
	void sfMutex_Lock(sfMutex* mutex);
	void sfMutex_Unlock(sfMutex* mutex);
}


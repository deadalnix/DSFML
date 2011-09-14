module sfml.system.mutex;

import csfml.system.mutex;

class Mutex {
	private sfMutex* mutex;
	
	public this() {
		mutex = sfMutex_Create();
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


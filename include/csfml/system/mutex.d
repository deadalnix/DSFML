module csfml.system.mutex;

public import csfml.system.types;

extern(C) {
	sfMutex* sfMutex_Create();
	void sfMutex_Destroy(sfMutex* mutex);
	
	void sfMutex_Lock(sfMutex* mutex);
	void sfMutex_Unlock(sfMutex* mutex);
}


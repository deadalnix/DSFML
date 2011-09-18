module csfml.system.thread;

public import csfml.system.types;

extern(C) {
	sfThread* sfThread_Create(void function(void*), void* userData);
	void sfThread_Destroy(sfThread* thread);
	
	void sfThread_Launch(sfThread* thread);
	void sfThread_Wait(sfThread* thread);
	void sfThread_Terminate(sfThread* thread);
}


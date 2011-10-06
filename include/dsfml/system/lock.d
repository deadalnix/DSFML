module dsfml.system.lock;

import dsfml.system.mutex;

scope class Lock {
	private Mutex mutex;
	
	public this(Mutex mutex) {
		this.mutex = mutex;
		
		mutex.lock();
	}
	
	~this() {
		mutex.unlock();
	}
}


module sfml.system.lock;

import sfml.system.mutex;

scope class Lock {
	private Mutex mutex;
	
	public this(Mutex mutex) {
		this.mutex = mutex;
		
		mutex.lock();
	}
	
	public ~this() {
		mutex.unlock();
	}
}


module dsfml.system.lock;

import dsfml.system.mutex;

scope class Lock {
	private Mutex mutex;
	
	public this(Mutex mutex) {
		if(mutex is null) throw new Exception("NullParameterException : Mutex is null.");
		
		this.mutex = mutex;
		
		mutex.lock();
	}
	
	~this() {
		mutex.unlock();
	}
}


module dsfml.system.lock;

import dsfml.system.mutex;

struct Lock {
	private Mutex mutex;
	
	public this(Mutex mutex) {
		if(mutex is null) throw new Exception("NullParameterException : Mutex is null.");
		
		this.mutex = mutex;
		
		mutex.lock();
	}
	
	~this() {
		mutex.unlock();
	}
	
	// This cannot be constructed without a mutex and is not copyable (but movable).
	@disable this();
	@disable this(this);
}


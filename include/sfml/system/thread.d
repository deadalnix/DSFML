module sfml.system.thread;

import csfml.system.thread;

class Thread {
	private sfThread* thread;
	
	// TODO: implement public this().
	
	public void launch() {
		sfThread_Launch(thread);
	}
	
	public void wait() {
		sfThread_Wait(thread);
	}
	
	public void terminate() {
		sfThread_Terminate(thread);
	}
	
	~this() {
		sfThread_Destroy(thread);
	}
}


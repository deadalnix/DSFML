module dsfml.system.thread;

import std.concurrency;

extern(C++) {
	alias void* function(shared void*) EntryPoint;
	
	void* __dsfml_start_thread(EntryPoint entryPoint, shared void* userData) {
		Tid tid = spawn(function void(EntryPoint entryPoint, shared void* userData) {
			entryPoint(userData);
		}, entryPoint, userData);
		
		return cast(void*) [tid].ptr;
	}
	
	void __dsfml_wait_thread(void* tid) {
		// TODO: do this :D
	}
	
	void __dsfml_terminate_thread(void* tid) {
		// Does nothing because it is unsafe (and not provided by D api as far as my knowledge goes).
	}
}


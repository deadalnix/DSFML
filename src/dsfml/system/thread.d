module dsfml.system.thread;

import std.concurrency;

alias extern(C++) void* function(void*) EntryPoint;

extern(C++) {
	void* __dsfml_start_thread(EntryPoint entryPoint, void* userData) {
		Tid tid = spawn(function void(EntryPoint entryPoint, shared void* userData) {
			entryPoint(cast(void*) userData);
		}, entryPoint, cast(shared void*) userData);
		
		return cast(void*) [tid].ptr;
	}
	
	void __dsfml_wait_thread(void* tid) {
		// TODO: do this :D
	}
	
	void __dsfml_terminate_thread(void* tid) {
		// Does nothing because it is unsafe (and not provided by D api as far as my knowledge goes).
	}
}


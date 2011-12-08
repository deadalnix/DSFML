module dsfml.system.clock;

import dsfml.sizes;

final class Clock {
	private void[clockSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfClock* clock() {
		return cast(sfClock*) data.ptr;
	}
	
	@property
	package final const(sfClock)* clock() const {
		return cast(const(sfClock)*) data.ptr;
	}
	
	this() {
		sfClock_Create(clock);
	}
	
	~this() {
		sfClock_Destroy(clock);
	}
	
	@property
	uint elapsedTime() const {
		return sfClock_GetElapsedTime(clock);
	}
	
	void reset() {
		sfClock_Reset(clock);
	}
}

package extern(C++) {
	struct sfClock {
		void[clockSize] data = void;
	}
	
	void sfClock_Create(sfClock* clock);
	void sfClock_Destroy(sfClock* clock);
	
	uint sfClock_GetElapsedTime(const sfClock* clock);
	void sfClock_Reset(sfClock* clock);
}

unittest {
	import core.thread;
	
	// TODO: implement proper unitest for this class, if it is possible.
	Clock c = new Clock();
	
	Thread.sleep( dur!("seconds")( 1 ) );
	
	assert(c.getElapsedTime() == 1000);
	
	c.reset();
	Thread.sleep( dur!("seconds")( 1 ) );
	
	assert(c.getElapsedTime() == 1000);
	
	c = c.clone();
	Thread.sleep( dur!("seconds")( 1 ) );
	
	assert(c.getElapsedTime() == 2000);
}


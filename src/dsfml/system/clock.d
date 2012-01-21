module dsfml.system.clock;

import dsfml.system.time;
import dsfml.sizes;

final class Clock {
	private void[clockSize] data = void;
	
	@property
	package final inout(sfClock)* clock() inout {
		return cast(inout(sfClock)*) data.ptr;
	}
	
	this() {
		sfClock_Create(clock);
	}
	
	~this() {
		sfClock_Destroy(clock);
	}
	
	@property
	Time elapsedTime() const {
		sfTime tmp = sfClock_GetElapsedTime(clock);
		return tmp.time;
	}
	
	Time restart() {
		sfTime tmp = sfClock_Restart(clock);
		return tmp.time;
	}
}

package extern(C++) {
	struct sfClock {
		void[clockSize] data = void;
	}
	
	void sfClock_Create(sfClock* clock);
	void sfClock_Destroy(sfClock* clock);
	
	sfTime sfClock_GetElapsedTime(const sfClock* clock);
	sfTime sfClock_Restart(sfClock* clock);
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


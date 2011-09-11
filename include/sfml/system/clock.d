module sfml.system.clock;

import csfml.system.clock;

class Clock {
	private sfClock* clock;
	
	public this() {
		clock = sfClock_Create();
	}
	
	public uint getElapsedTime() {
		return sfClock_GetTime(clock);
	}
	
	public void reset() {
		sfClock_Reset(clock);
	}
	
	public Clock clone() {
		return new Clock(this);
	}
	
	private this(Clock c) {
		clock = sfClock_Copy(c.clock);
	}
	
	~this() {
		sfClock_Destroy(clock);
	}
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


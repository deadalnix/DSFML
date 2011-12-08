module dsfml.system.sleep;

void sleep(uint duration) {
	sfSleep(duration);
}

package extern(C++) {
	void sfSleep(uint duration);
}

unittest {
	import sfml.system.clock;
	
	Clock c = new Clock();
	
	sleep( dur!("seconds")( 1 ) );
	
	assert(c.getElapsedTime() >= 1000);
}


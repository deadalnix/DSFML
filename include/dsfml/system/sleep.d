module dsfml.system.sleep;

import csfml.system.sleep;

void sleep(uint duration) {
	sfSleep(duration);
}

unittest {
	import sfml.system.clock;
	
	Clock c = new Clock();
	
	sleep( dur!("seconds")( 1 ) );
	
	assert(c.getElapsedTime() >= 1000);
}


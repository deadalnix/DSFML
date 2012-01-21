module dsfml.system.sleep;

import dsfml.system.time;

void sleep(Time duration) {
	sfSleep(duration.time);
}

package extern(C++) {
	void sfSleep(sfTime duration);
}

unittest {
	import sfml.system.clock;
	
	Clock c = new Clock();
	
	sleep( dur!("seconds")( 1 ) );
	
	assert(c.getElapsedTime() >= 1000);
}


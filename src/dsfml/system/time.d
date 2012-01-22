module dsfml.system.time;

import dsfml.sizes;

// TODO: everything
struct Time {
	private void[timeSize] data = void;
	
	@property
	package final ref inout(sfTime) time() inout {
		return *(cast(inout(sfTime)*) &this);
	}
	
	@property
	float asSeconds() const {
		return sfTime_AsSeconds(time);
	}
	
	@property
	int asMilliseconds() const {
		return sfTime_AsMilliseconds(time);
	}
	
	@property
	long asMicroseconds() const {
		return sfTime_AsMicroseconds(time);
	}
}

package extern(C++) {
	struct sfTime {
		void[Time.sizeof] data = void;
		
		@property
		package final ref inout(Time) time() inout {
			return *(cast(inout(Time)*) &this);
		}
	}
	
	float sfTime_AsSeconds(ref const sfTime time);
	int sfTime_AsMilliseconds(ref const sfTime time);
	long sfTime_AsMicroseconds(ref const sfTime time);
}


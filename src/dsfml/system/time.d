module dsfml.system.time;

import dsfml.sizes;

// TODO: everything
struct Time {
	private void[timeSize] data = void;
	
	@property
	package final ref inout(sfTime) time() inout {
		return *(cast(inout(sfTime)*) &this);
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
}


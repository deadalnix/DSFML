module dsfml.network.ipaddress;

import std.c.stdlib;
import std.c.string;
import std.string;

struct IpAddress {
	private uint address;
	
	@property
	package final ref inout(sfIpAddress) ipAddress() inout {
		return *(cast(inout(sfIpAddress)*) &this);
	}
	
	this(string address) {
		sfIpAddress_Create(ipAddress, toStringz(address));
	}
	
	this(ubyte byte0, ubyte byte1, ubyte byte2, ubyte byte3) {
		sfIpAddress_Create(ipAddress, byte0, byte1, byte2, byte3);
	}
	
	this(uint address) {
		sfIpAddress_Create(ipAddress, address);
	}
	
	@property
	string stringof() const {
		const char* address = sfIpAddress_ToString(ipAddress);
		scope(exit) free(cast(void*) address);
		
		return address[0 .. strlen(address)].idup;
	}
	
	@property
	uint integerof() const {
		return sfIpAddress_ToInteger(ipAddress);
	}
}

@property
IpAddress localAddress() {
	sfIpAddress tmp = sfIpAddress_GetLocalAddress();
	return tmp.ipAddress;
}

@property
IpAddress publicAddress(uint timeout = 0) {
	sfIpAddress tmp = sfIpAddress_GetPublicAddress(timeout);
	return tmp.ipAddress;
}

immutable IpAddress localHost;

static this() {
	sfIpAddress tmp	= sfIpAddress_LocalHost();
	localHost		= tmp.ipAddress;
}

package extern(C++) {
	struct sfIpAddress {
		void[IpAddress.sizeof] data = void;
		
		@property
		package final ref inout(IpAddress) ipAddress() inout {
			return *(cast(inout(IpAddress)*) &this);
		}
	}
	
	void sfIpAddress_Create(ref sfIpAddress ipAddress, const char* address);
	void sfIpAddress_Create(ref sfIpAddress ipAddress, ubyte byte0, ubyte byte1, ubyte byte2, ubyte byte3);
	void sfIpAddress_Create(ref sfIpAddress ipAddress, uint address);
	
	const(char)* sfIpAddress_ToString(ref const sfIpAddress ipAddress);
	uint sfIpAddress_ToInteger(ref const sfIpAddress ipAddress);
	
	sfIpAddress sfIpAddress_GetLocalAddress();
	sfIpAddress sfIpAddress_GetPublicAddress(uint timeout);
	sfIpAddress sfIpAddress_LocalHost();
}


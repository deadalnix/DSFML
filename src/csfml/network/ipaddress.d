module csfml.network.ipaddress;

struct sfIpAddress {
	immutable(char)[16] address;
}

extern(C) {
	sfIpAddress sfIpAddress_FromString(const char* address);
	sfIpAddress sfIpAddress_FromBytes(ubyte byte0, ubyte byte1, ubyte byte2, ubyte byte3);
	sfIpAddress sfIpAddress_FromInteger(uint address);
	void sfIpAddress_ToString(sfIpAddress address, char* string);
	uint sfIpAddress_ToInteger(sfIpAddress address);
	sfIpAddress sfIpAddress_GetLocalAddress();
	sfIpAddress sfIpAddress_GetPublicAddress(uint timeout);
	sfIpAddress sfIpAddress_LocalHost();
	sfIpAddress sfIpAddress_None();
}


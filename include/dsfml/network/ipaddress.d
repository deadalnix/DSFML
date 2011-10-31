module dsfml.network.ipaddress;

import csfml.network.ipaddress;

import std.c.string;
import std.string;

struct IpAddress {
	private sfIpAddress ipAddress;
	
	public this(string address) {
		ipAddress = sfIpAddress_FromString(toStringz(address));
	}
	
	public this(ubyte byte0, ubyte byte1, ubyte byte2, ubyte byte3) {
		ipAddress = sfIpAddress_FromBytes(byte0, byte1, byte2, byte3);
	}
	
	public this(uint address) {
		sfIpAddress_FromInteger(address);
	}
	
	public this(sfIpAddress ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	public string toString() {
		return ipAddress.address[0 .. strlen(ipAddress.address.ptr)];
	}
	
	public uint toInteger() {
		return sfIpAddress_ToInteger(ipAddress);
	}
	
	public sfIpAddress getCIpAddress() {
		return ipAddress;
	}
	
	public sfIpAddress* getCIpAddressPtr() {
		return &ipAddress;
	}
	
	static IpAddress getLocalAddress() {
		return IpAddress(sfIpAddress_GetLocalAddress());
	}
	
	static IpAddress getPublicAddress(uint timeout = 0) {
		return IpAddress(sfIpAddress_GetPublicAddress(timeout));
	}
	
	static IpAddress getLocalHost() {
		return IpAddress(sfIpAddress_LocalHost());
	}
	
	static IpAddress getNone() {
		return IpAddress(sfIpAddress_None());
	}
}


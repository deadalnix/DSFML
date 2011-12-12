module dsfml.network.packet;

import dsfml.network.ipaddress;
import dsfml.sizes;

import std.string;
import std.c.wcharh;

class Packet {
	private void[packetSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfPacket* packet() {
		return cast(sfPacket*) data.ptr;
	}
	
	@property
	package final const(sfPacket)* packet() const {
		return cast(const(sfPacket)*) data.ptr;
	}
	
	this() {
		sfPacket_Create(packet);
	}
	
	~this() {
		sfPacket_Destroy(packet);
	}
	
	final void append(const void[] data) {
		sfPacket_Append(packet, data.ptr, data.length);
	}
	
	final void clear() {
		sfPacket_Clear(packet);
	}
	
	@property
	final const(byte)[] getData() const {
		return sfPacket_GetData(packet)[0 .. sfPacket_GetDataSize(packet)];
	}
	
	@property
	final bool endOfPacket() const {
		return sfPacket_EndOfPacket(packet);
	}
	
	final void read(S...)(ref S results) {
		foreach(i, result; results) {
			static assert(__traits(compiles, sfPacket_Read(packet, results[i])), "Type not supported : " ~ typeof(result).stringof);
			
			sfPacket_Read(packet, results[i]);
		}
	}
	
	final void write(S...)(S values) {
		foreach(value; values) {
			static assert(__traits(compiles, sfPacket_Write(packet, values[i])), "Type not supported : " ~ typeof(values).stringof);
			
			sfPacket_Write(packet, values[i]);
		}
	}
	
	/* 
	 * Not implemented for safety reasons or lack of support :
	 *
	void sfPacket_ReadString(packet, char* string);
	void sfPacket_ReadWideString(packet, wchar_t* string);
	void sfPacket_WriteWideString(packet, const wchar_t* string);
	*/
	
	// TODO: implement ping/pong to ensure that calback method are overridable in D the same way as in C++.
}

package extern(C++) {
	struct sfPacket {
		void[packetSize] data = void;
	}
	
	void sfPacket_Create(sfPacket* packet);
	void sfPacket_Destroy(sfPacket* packet);
	
	void sfPacket_Append(sfPacket* packet, const void* data, size_t sizeInBytes);
	void sfPacket_Clear(sfPacket* packet);
	const(byte)* sfPacket_GetData(const sfPacket* packet);
	size_t sfPacket_GetDataSize(const sfPacket* packet);
	bool sfPacket_EndOfPacket(const sfPacket* packet);
	
	void sfPacket_Read(sfPacket* packet, ref bool data);
	void sfPacket_Read(sfPacket* packet, ref byte data);
	void sfPacket_Read(sfPacket* packet, ref ubyte data);
	void sfPacket_Read(sfPacket* packet, ref short data);
	void sfPacket_Read(sfPacket* packet, ref ushort data);
	void sfPacket_Read(sfPacket* packet, ref int data);
	void sfPacket_Read(sfPacket* packet, ref uint data);
	void sfPacket_Read(sfPacket* packet, ref float data);
	void sfPacket_Read(sfPacket* packet, ref double data);
	
	void sfPacket_Write(sfPacket* packet, bool data);
	void sfPacket_Write(sfPacket* packet, byte data);
	void sfPacket_Write(sfPacket* packet, ubyte data);
	void sfPacket_Write(sfPacket* packet, short data);
	void sfPacket_Write(sfPacket* packet, ushort data);
	void sfPacket_Write(sfPacket* packet, int data);
	void sfPacket_Write(sfPacket* packet, uint data);
	void sfPacket_Write(sfPacket* packet, float data);
	void sfPacket_Write(sfPacket* packet, double data);
	// void sfPacket_Write(sfPacket* packet, const char* data);
}


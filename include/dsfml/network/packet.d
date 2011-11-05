module dsfml.network.packet;

import csfml.network.packet;

import dsfml.network.ipaddress;

import std.string;
import std.c.wcharh;

class Packet {
	private sfPacket* packet;
	
	public this() {
		packet = sfPacket_Create();
	}
	
	public Packet clone() {
		return new Packet(this);
	}
	
	private this(Packet packet) {
		this.packet = sfPacket_Copy(packet.packet);
	}
	
	public ~this() {
		sfPacket_Destroy(packet);
	}
	
	public const(sfPacket*) getCPacket() const {
		return packet;
	}
	
	public immutable(sfPacket*) getCPacket() immutable {
		return packet;
	}
	
	public sfPacket* getCPacket() {
		return packet;
	}
	
	public void append(const(byte)[] data) {
		sfPacket_Append(packet, data.ptr, data.length);
	}
	
	public void clear() {
		sfPacket_Clear(packet);
	}
	
	public const(byte)[] getData() const {
		return sfPacket_GetData(packet)[0 .. getDataSize()];
	}
	
	public size_t getDataSize() const {
		return sfPacket_GetDataSize(packet);
	}
	
	public bool getEndOfPacket() const {
		return sfPacket_EndOfPacket(packet);
	}
	
	public bool canRead() const {
		return sfPacket_CanRead(packet);
	}
	
	public void read(S...)(ref S results) {
		foreach(i, result; results) {
			static if(is(typeof(result) == bool)) {
				results[i] = sfPacket_ReadBool(packet);
			} else static if(is(typeof(result) == byte)) {
				results[i] = sfPacket_ReadInt8(packet);
			} else static if(is(typeof(result) == ubyte)) {
				results[i] = sfPacket_ReadUInt8(packet);
			} else static if(is(typeof(result) == short)) {
				results[i] = sfPacket_ReadInt16(packet);
			} else static if(is(typeof(result) == ushort)) {
				results[i] = sfPacket_ReadUInt16(packet);
			} else static if(is(typeof(result) == int)) {
				results[i] = sfPacket_ReadInt32(packet);
			} else static if(is(typeof(result) == uint)) {
				results[i] = sfPacket_ReadUInt32(packet);
			} else static if(is(typeof(result) == float)) {
				results[i] = sfPacket_ReadFloat(packet);
			} else static if(is(typeof(result) == double)) {
				results[i] = sfPacket_ReadDouble(packet);
			} else {
				static assert(false, "Type not supported : " ~ typeof(result).stringof);
			}
		}
	}
	
	public void write(S...)(S values) {
		foreach(value; values) {
			static if(is(typeof(value) == bool)) {
				sfPacket_WriteBool(packet, value);
			} else static if(is(typeof(value) == byte)) {
				sfPacket_WriteInt8(packet, value);
			} else static if(is(typeof(value) == ubyte)) {
				sfPacket_WriteUInt8(packet, value);
			} else static if(is(typeof(value) == short)) {
				sfPacket_WriteInt16(packet, value);
			} else static if(is(typeof(value) == ushort)) {
				sfPacket_WriteUInt16(packet, value);
			} else static if(is(typeof(value) == int)) {
				sfPacket_WriteInt32(packet, value);
			} else static if(is(typeof(value) == uint)) {
				sfPacket_WriteUInt32(packet, value);
			} else static if(is(typeof(value) == float)) {
				sfPacket_WriteFloat(packet, value);
			} else static if(is(typeof(value) == double)) {
				sfPacket_WriteDouble(packet, value);
			} else static if(is(typeof(toStringz(value)) == immutable(char)*)) {
				sfPacket_WriteString(packet, toStringz(value));
			} else static if(is(typeof(value) : const(wchar_t)[])) {
				static assert(false, "Type not supported (lack of toStringz for thoses types) : " ~ typeof(value).stringof);
			} else {
				static assert(false, "Type not supported : " ~ typeof(value).stringof);
			}
		}
	}
	
	/* 
	 * Not implemented for safety reasons or lack of support :
	 *
	void sfPacket_ReadString(packet, char* string);
	void sfPacket_ReadWideString(packet, wchar_t* string);
	void sfPacket_WriteWideString(packet, const wchar_t* string);
	*/
}


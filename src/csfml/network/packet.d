module csfml.network.packet;

public import csfml.network.types;

import std.c.wcharh;

extern(C) {
	sfPacket* sfPacket_Create();
	sfPacket* sfPacket_Copy(sfPacket* packet);
	void sfPacket_Destroy(sfPacket* packet);
	void sfPacket_Append(sfPacket* packet, const void* data, size_t sizeInBytes);
	void sfPacket_Clear(sfPacket* packet);
	const(byte*) sfPacket_GetData(const sfPacket* packet);
	size_t sfPacket_GetDataSize(const sfPacket* packet);
	bool sfPacket_EndOfPacket(const sfPacket* packet);
	bool sfPacket_CanRead(const sfPacket* packet);
	bool sfPacket_ReadBool(sfPacket* packet);
	byte sfPacket_ReadInt8(sfPacket* packet);
	ubyte sfPacket_ReadUint8(sfPacket* packet);
	short sfPacket_ReadInt16(sfPacket* packet);
	ushort sfPacket_ReadUint16(sfPacket* packet);
	int sfPacket_ReadInt32(sfPacket* packet);
	uint sfPacket_ReadUint32(sfPacket* packet);
	float sfPacket_ReadFloat(sfPacket* packet);
	double sfPacket_ReadDouble(sfPacket* packet);
	void sfPacket_ReadString(sfPacket* packet, char* string);
	void sfPacket_ReadWideString(sfPacket* packet, wchar_t* string);
	void sfPacket_WriteBool(sfPacket* packet, bool);
	void sfPacket_WriteInt8(sfPacket* packet, byte);
	void sfPacket_WriteUint8(sfPacket* packet, ubyte);
	void sfPacket_WriteInt16(sfPacket* packet, short);
	void sfPacket_WriteUint16(sfPacket* packet, ushort);
	void sfPacket_WriteInt32(sfPacket* packet, int);
	void sfPacket_WriteUint32(sfPacket* packet, uint);
	void sfPacket_WriteFloat(sfPacket* packet, float);
	void sfPacket_WriteDouble(sfPacket* packet, double);
	void sfPacket_WriteString(sfPacket* packet, const char* string);
	void sfPacket_WriteWideString(sfPacket* packet, const wchar_t* string);
}


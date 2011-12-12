#include<SFML/Network/Packet.hpp>
#include<new>

typedef sf::Packet sfPacket;

void sfPacket_Create(sfPacket* packet) {
	new(packet) sfPacket();
}

void sfPacket_Destroy(sfPacket* packet) {
	packet->~sfPacket();
}

void sfPacket_Append(sfPacket* packet, const void* data, size_t sizeInBytes) {
	packet->Append(data, sizeInBytes);
}

void sfPacket_Clear(sfPacket* packet) {
	packet->Clear();
}

const char* sfPacket_GetData(const sfPacket* packet) {
	return packet->GetData();
}

size_t sfPacket_GetDataSize(const sfPacket* packet) {
	return packet->GetDataSize();
}

bool sfPacket_EndOfPacket(const sfPacket* packet) {
	return packet->EndOfPacket();
}

void sfPacket_Read(sfPacket* packet, bool& data) {
	*packet >> data;
}

void sfPacket_Read(sfPacket* packet, sf::Int8& data) {
	*packet >> data;
}

void sfPacket_Read(sfPacket* packet, sf::Uint8& data) {
	*packet >> data;
}

void sfPacket_Read(sfPacket* packet, sf::Int16& data) {
	*packet >> data;
}

void sfPacket_Read(sfPacket* packet, sf::Uint16& data) {
	*packet >> data;
}

void sfPacket_Read(sfPacket* packet, sf::Int32& data) {
	*packet >> data;
}

void sfPacket_Read(sfPacket* packet, sf::Uint32& data) {
	*packet >> data;
}

void sfPacket_Read(sfPacket* packet, float& data) {
	*packet >> data;
}

void sfPacket_Read(sfPacket* packet, double& data) {
	*packet >> data;
}

void sfPacket_Write(sfPacket* packet, bool data) {
	*packet << data;
}

void sfPacket_Write(sfPacket* packet, sf::Int8 data) {
	*packet << data;
}

void sfPacket_Write(sfPacket* packet, sf::Uint8 data) {
	*packet << data;
}

void sfPacket_Write(sfPacket* packet, sf::Int16 data) {
	*packet << data;
}

void sfPacket_Write(sfPacket* packet, sf::Uint16 data) {
	*packet << data;
}

void sfPacket_Write(sfPacket* packet, sf::Int32 data) {
	*packet << data;
}

void sfPacket_Write(sfPacket* packet, sf::Uint32 data) {
	*packet << data;
}

void sfPacket_Write(sfPacket* packet, double data) {
	*packet << data;
}

void sfPacket_Write(sfPacket* packet, const char* data) {
	*packet << data;
}


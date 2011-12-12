#include<SFML/Network/IpAddress.hpp>
#include<new>

typedef sf::IpAddress sfIpAddress;

void sfIpAddress_Create(sfIpAddress& ipAddress, const char* address) {
	new(&ipAddress) sfIpAddress(address);
}

void sfIpAddress_Create(sfIpAddress& ipAddress, sf::Uint8 byte0, sf::Uint8 byte1, sf::Uint8 byte2, sf::Uint8 byte3) {
	new(&ipAddress) sfIpAddress(byte0, byte1, byte2, byte3);
}

void sfIpAddress_Create(sfIpAddress& ipAddress, sf::Uint32 address) {
	new(&ipAddress) sfIpAddress(address);
}

const char* sfIpAddress_ToString(const sfIpAddress& ipAddress) {
	return ipAddress.ToString().c_str();
}

sf::Uint32 sfIpAddress_ToInteger(const sfIpAddress& ipAddress) {
	return ipAddress.ToInteger();
}

sfIpAddress sfIpAddress_GetLocalAddress() {
	return sfIpAddress::GetLocalAddress();
}

sfIpAddress sfIpAddress_GetPublicAddress(sf::Uint32 timeout) {
	return sfIpAddress::GetPublicAddress(timeout);
}

sfIpAddress sfIpAddress_LocalHost() {
	return sfIpAddress::LocalHost;
}


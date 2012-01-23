#include<SFML/Network/Ftp.hpp>
#include<SFML/Network/IpAddress.hpp>
#include<SFML/System/Enumeration.hpp>
#include<SFML/System/PointerProvider.hpp>
#include<new>

typedef sf::Ftp::Response sfFtpResponse;

sfFtpResponse* sfFtpResponse_Create(unsigned int code, const char* message, size_t length) {
	return new sfFtpResponse(sf::Enumeration<sf::Ftp::Response::Status, unsigned int>(code), std::string(message, length));
}

void sfFtpResponse_Destroy(sfFtpResponse* response) {
	delete response;
}

bool sfFtpResponse_IsOk(const sfFtpResponse* response) {
	return response->IsOk();
}

unsigned int sfFtpResponse_GetStatus(const sfFtpResponse* response) {
	return response->GetStatus();
}

const char* sfFtpResponse_GetMessage(const sfFtpResponse* response) {
	return response->GetMessage().c_str();
}

typedef sf::Ftp::DirectoryResponse sfFtpDirectoryResponse;

void sfFtpDirectoryResponse_Destroy(sfFtpDirectoryResponse* directoryResponse) {
	delete directoryResponse;
}

const char* sfFtpDirectoryResponse_GetDirectory(const sfFtpDirectoryResponse* directoryResponse) {
	return directoryResponse->GetDirectory().c_str();
}

typedef sf::Ftp::ListingResponse sfFtpListingResponse;

void sfFtpListingResponse_Destroy(sfFtpListingResponse* listingResponse) {
	delete listingResponse;
}

typedef sf::Ftp sfFtp;

void sfFtp_Create(sfFtp* ftp) {
	new(ftp) sfFtp();
}

void sfFtp_Destroy(sfFtp* ftp) {
	ftp->~sfFtp();
}

typedef sf::Time sfTime;
typedef sf::IpAddress sfIpAddress;

sfFtpResponse* sfFtp_Connect(sfFtp* ftp, sfIpAddress server, unsigned short port, sfTime timeout) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->Connect(server, port, timeout)));
}

sfFtpResponse* sfFtp_Disconnect(sfFtp* ftp) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->Disconnect()));
}
	
sfFtpResponse* sfFtp_Login(sfFtp* ftp) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->Login()));
}

sfFtpResponse* sfFtp_Login(sfFtp* ftp, const char* userName, size_t userNameLength, const char* password, size_t passwordLength) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->Login(std::string(userName, userNameLength), std::string(password, passwordLength))));
}


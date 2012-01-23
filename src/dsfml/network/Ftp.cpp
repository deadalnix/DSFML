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

sfFtpResponse* sfFtp_KeepAlive(sfFtp* ftp) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->KeepAlive()));
}

sfFtpResponse* sfFtp_GetWorkingDirectory(sfFtp* ftp) {
	return reinterpret_cast<sfFtpDirectoryResponse*>(new sf::PointerProvider<sfFtpDirectoryResponse>(ftp->GetWorkingDirectory()));
}

sfFtpListingResponse* sfFtp_GetDirectoryListing(sfFtp* ftp, const char* directory, size_t directoryLength) {
	return reinterpret_cast<sfFtpListingResponse*>(new sf::PointerProvider<sfFtpListingResponse>(ftp->GetDirectoryListing(std::string(directory, directoryLength))));
}

sfFtpResponse* sfFtp_ChangeDirectory(sfFtp* ftp, const char* directory, size_t directoryLength) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->ChangeDirectory(std::string(directory, directoryLength))));
}

sfFtpResponse* sfFtp_ParentDirectory(sfFtp* ftp) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->ParentDirectory()));
}

sfFtpResponse* sfFtp_CreateDirectory(sfFtp* ftp, const char* name, size_t nameLength) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->CreateDirectory(std::string(name, nameLength))));
}

sfFtpResponse* sfFtp_DeleteDirectory(sfFtp* ftp, const char* name, size_t nameLength) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->DeleteDirectory(std::string(name, nameLength))));
}

sfFtpResponse* sfFtp_RenameFile(sfFtp* ftp, const char* file, size_t fileLength, const char* newName, size_t newNameLength) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->RenameFile(std::string(file, fileLength), std::string(newName, newNameLength))));
}

sfFtpResponse* sfFtp_DeleteFile(sfFtp* ftp, const char* name, size_t nameLength) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->DeleteFile(std::string(name, nameLength))));
}

sfFtpResponse* sfFtp_Download(sfFtp* ftp, const char* remoteFile, size_t remoteFileLength, const char* localPath, size_t localPathLength, unsigned int mode) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->Download(std::string(remoteFile, remoteFileLength), std::string(localPath, localPathLength), sf::Enumeration<sf::Ftp::TransferMode, unsigned int>(mode))));
}

sfFtpResponse* sfFtp_Upload(sfFtp* ftp, const char* localFile, size_t localFileLength, const char* remotePath, size_t remotePathLength, unsigned int mode) {
	return reinterpret_cast<sfFtpResponse*>(new sf::PointerProvider<sfFtpResponse>(ftp->Download(std::string(localFile, localFileLength), std::string(remotePath, remotePathLength), sf::Enumeration<sf::Ftp::TransferMode, unsigned int>(mode))));
}


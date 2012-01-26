#include<SFML/Network/Ftp.hpp>
#include<SFML/Network/IpAddress.hpp>
#include<SFML/System/Enumeration.hpp>
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

const char** sfFtpListingResponse_GetFilenames(const sfFtpListingResponse* listingResponse) {
	const std::vector<std::string>& filenames = listingResponse->GetFilenames();
	const char** cfilenames = new const char*[filenames.size()];
	
	size_t i = 0;
	for(std::vector<std::string>::const_iterator it = filenames.begin(); it != filenames.end(); ++it) {
		cfilenames[i++] = it->c_str();
	}
	
	return cfilenames;
}

size_t sfFtpListingResponse_GetFilenamesCount(const sfFtpListingResponse* listingResponse) {
	return listingResponse->GetFilenames().size();
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
	return new sfFtpResponse(ftp->Connect(server, port, timeout));
}

sfFtpResponse* sfFtp_Disconnect(sfFtp* ftp) {
	return new sfFtpResponse(ftp->Disconnect());
}
	
sfFtpResponse* sfFtp_Login(sfFtp* ftp) {
	return new sfFtpResponse(ftp->Login());
}

sfFtpResponse* sfFtp_Login(sfFtp* ftp, const char* userName, size_t userNameLength, const char* password, size_t passwordLength) {
	return new sfFtpResponse(ftp->Login(std::string(userName, userNameLength), std::string(password, passwordLength)));
}

sfFtpResponse* sfFtp_KeepAlive(sfFtp* ftp) {
	return new sfFtpResponse(ftp->KeepAlive());
}

sfFtpResponse* sfFtp_GetWorkingDirectory(sfFtp* ftp) {
	return new sfFtpDirectoryResponse(ftp->GetWorkingDirectory());
}

sfFtpListingResponse* sfFtp_GetDirectoryListing(sfFtp* ftp, const char* directory, size_t directoryLength) {
	return new sfFtpListingResponse(ftp->GetDirectoryListing(std::string(directory, directoryLength)));
}

sfFtpResponse* sfFtp_ChangeDirectory(sfFtp* ftp, const char* directory, size_t directoryLength) {
	return new sfFtpResponse(ftp->ChangeDirectory(std::string(directory, directoryLength)));
}

sfFtpResponse* sfFtp_ParentDirectory(sfFtp* ftp) {
	return new sfFtpResponse(ftp->ParentDirectory());
}

sfFtpResponse* sfFtp_CreateDirectory(sfFtp* ftp, const char* name, size_t nameLength) {
	return new sfFtpResponse(ftp->CreateDirectory(std::string(name, nameLength)));
}

sfFtpResponse* sfFtp_DeleteDirectory(sfFtp* ftp, const char* name, size_t nameLength) {
	return new sfFtpResponse(ftp->DeleteDirectory(std::string(name, nameLength)));
}

sfFtpResponse* sfFtp_RenameFile(sfFtp* ftp, const char* file, size_t fileLength, const char* newName, size_t newNameLength) {
	return new sfFtpResponse(ftp->RenameFile(std::string(file, fileLength), std::string(newName, newNameLength)));
}

sfFtpResponse* sfFtp_DeleteFile(sfFtp* ftp, const char* name, size_t nameLength) {
	return new sfFtpResponse(ftp->DeleteFile(std::string(name, nameLength)));
}

sfFtpResponse* sfFtp_Download(sfFtp* ftp, const char* remoteFile, size_t remoteFileLength, const char* localPath, size_t localPathLength, unsigned int mode) {
	return new sfFtpResponse(ftp->Download(std::string(remoteFile, remoteFileLength), std::string(localPath, localPathLength), sf::Enumeration<sf::Ftp::TransferMode, unsigned int>(mode)));
}

sfFtpResponse* sfFtp_Upload(sfFtp* ftp, const char* localFile, size_t localFileLength, const char* remotePath, size_t remotePathLength, unsigned int mode) {
	return new sfFtpResponse(ftp->Download(std::string(localFile, localFileLength), std::string(remotePath, remotePathLength), sf::Enumeration<sf::Ftp::TransferMode, unsigned int>(mode)));
}


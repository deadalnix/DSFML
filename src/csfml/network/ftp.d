module csfml.network.ftp;

public import csfml.network.types;

import csfml.network.ipaddress;

enum sfFtpTransferMode {
	sfFtpBinary,
	sfFtpAscii,
	sfFtpEbcdic,
}

enum sfFtpStatus {
	sfFtpRestartMarkerReply = 110,
	sfFtpServiceReadySoon = 120,
	sfFtpDataConnectionAlreadyOpened = 125,
	sfFtpOpeningDataConnection = 150,
	sfFtpOk = 200,
	sfFtpPointlessCommand = 202,
	sfFtpSystemStatus = 211,
	sfFtpDirectoryStatus = 212,
	sfFtpFileStatus = 213,
	sfFtpHelpMessage = 214,
	sfFtpSystemType = 215,
	sfFtpServiceReady = 220,
	sfFtpClosingConnection = 221,
	sfFtpDataConnectionOpened = 225,
	sfFtpClosingDataConnection = 226,
	sfFtpEnteringPassiveMode = 227,
	sfFtpLoggedIn = 230,
	sfFtpFileActionOk = 250,
	sfFtpDirectoryOk = 257,
	sfFtpNeedPassword = 331,
	sfFtpNeedAccountToLogIn = 332,
	sfFtpNeedInformation = 350,
	sfFtpServiceUnavailable = 421,
	sfFtpDataConnectionUnavailable = 425,
	sfFtpTransferAborted = 426,
	sfFtpFileActionAborted = 450,
	sfFtpLocalError = 451,
	sfFtpInsufficientStorageSpace = 452,
	sfFtpCommandUnknown = 500,
	sfFtpParametersUnknown = 501,
	sfFtpCommandNotImplemented = 502,
	sfFtpBadCommandSequence = 503,
	sfFtpParameterNotImplemented = 504,
	sfFtpNotLoggedIn = 530,
	sfFtpNeedAccountToStore = 532,
	sfFtpFileUnavailable = 550,
	sfFtpPageTypeUnknown = 551,
	sfFtpNotEnoughMemory = 552,
	sfFtpFilenameNotAllowed = 553,
	sfFtpInvalidResponse = 1000,
	sfFtpConnectionFailed = 1001,
	sfFtpConnectionClosed = 1002,
	sfFtpInvalidFile = 1003,
}

extern(C) {
	void sfFtpListingResponse_Destroy(sfFtpListingResponse* ftpListingResponse);
	bool sfFtpListingResponse_IsOk(const sfFtpListingResponse* ftpListingResponse);
	sfFtpStatus sfFtpListingResponse_GetStatus(const sfFtpListingResponse* ftpListingResponse);
	const(char*) sfFtpListingResponse_GetMessage(const sfFtpListingResponse* ftpListingResponse);
	size_t sfFtpListingResponse_GetCount(const sfFtpListingResponse* ftpListingResponse);
	const(char*) sfFtpListingResponse_GetFilename(const sfFtpListingResponse* ftpListingResponse, size_t index);
	void sfFtpDirectoryResponse_Destroy(sfFtpDirectoryResponse* ftpDirectoryResponse);
	bool sfFtpDirectoryResponse_IsOk(const sfFtpDirectoryResponse* ftpDirectoryResponse);
	sfFtpStatus sfFtpDirectoryResponse_GetStatus(const sfFtpDirectoryResponse* ftpDirectoryResponse);
	const(char*) sfFtpDirectoryResponse_GetMessage(const sfFtpDirectoryResponse* ftpDirectoryResponse);
	const(char*) sfFtpDirectoryResponse_GetDirectory(const sfFtpDirectoryResponse* ftpDirectoryResponse);
	void sfFtpResponse_Destroy(sfFtpResponse* ftpResponse);
	bool sfFtpResponse_IsOk(const sfFtpResponse* ftpResponse);
	sfFtpStatus sfFtpResponse_GetStatus(const sfFtpResponse* ftpResponse);
	const(char*) sfFtpResponse_GetMessage(const sfFtpResponse* ftpResponse);
	sfFtp* sfFtp_Create();
	void sfFtp_Destroy(sfFtp* ftp);
	sfFtpResponse* sfFtp_Connect(sfFtp* ftp, sfIpAddress server, ushort port, uint timeout);
	sfFtpResponse* sfFtp_LoginAnonymous(sfFtp* ftp);
	sfFtpResponse* sfFtp_Login(sfFtp* ftp, const char* userName, const char* password);
	sfFtpResponse* sfFtp_Disconnect(sfFtp* ftp);
	sfFtpResponse* sfFtp_KeepAlive(sfFtp* ftp);
	sfFtpDirectoryResponse* sfFtp_GetWorkingDirectory(sfFtp* ftp);
	sfFtpListingResponse* sfFtp_GetDirectoryListing(sfFtp* ftp, const char* directory);
	sfFtpResponse* sfFtp_ChangeDirectory(sfFtp* ftp, const char* directory);
	sfFtpResponse* sfFtp_ParentDirectory(sfFtp* ftp);
	sfFtpResponse* sfFtp_CreateDirectory(sfFtp* ftp, const char* name);
	sfFtpResponse* sfFtp_DeleteDirectory(sfFtp* ftp, const char* name);
	sfFtpResponse* sfFtp_RenameFile(sfFtp* ftp, const char* file, const char* newName);
	sfFtpResponse* sfFtp_DeleteFile(sfFtp* ftp, const char* name);
	sfFtpResponse* sfFtp_Download(sfFtp* ftp, const char* distantFile, const char* destPath, sfFtpTransferMode mode);
	sfFtpResponse* sfFtp_Upload(sfFtp* ftp, const char* localFile, const char* destPath, sfFtpTransferMode mode);
}


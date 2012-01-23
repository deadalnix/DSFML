module dsfml.network.ftp;

import dsfml.network.ipaddress;
import dsfml.system.time;
import dsfml.sizes;

// TODO: Get rid of this.
import std.c.string;
import std.c.stdlib;

enum TransferMode {
	Binary,
	Ascii,
	Ebcdic,
}

enum Status {
	RestartMarkerReply = 110,
	ServiceReadySoon = 120,
	DataConnectionAlreadyOpened = 125,
	OpeningDataConnection = 150,
	Ok = 200,
	PointlessCommand = 202,
	SystemStatus = 211,
	DirectoryStatus = 212,
	FileStatus = 213,
	HelpMessage = 214,
	SystemType = 215,
	ServiceReady = 220,
	ClosingConnection = 221,
	DataConnectionOpened = 225,
	ClosingDataConnection = 226,
	EnteringPassiveMode = 227,
	LoggedIn = 230,
	FileActionOk = 250,
	DirectoryOk = 257,
	NeedPassword = 331,
	NeedAccountToLogIn = 332,
	NeedInformation = 350,
	ServiceUnavailable = 421,
	DataConnectionUnavailable = 425,
	TransferAborted = 426,
	FileActionAborted = 450,
	LocalError = 451,
	InsufficientStorageSpace = 452,
	CommandUnknown = 500,
	ParametersUnknown = 501,
	CommandNotImplemented = 502,
	BadCommandSequence = 503,
	ParameterNotImplemented = 504,
	NotLoggedIn = 530,
	NeedAccountToStore = 532,
	FileUnavailable = 550,
	PageTypeUnknown = 551,
	NotEnoughMemory = 552,
	FilenameNotAllowed = 553,
	InvalidResponse = 1000,
	ConnectionFailed = 1001,
	ConnectionClosed = 1002,
	InvalidFile = 1003,
}

final class Ftp {
	private void[ftpSize] data = void;
	
	@property
	package final inout(sfFtp*) ftp() inout {
		return cast(inout(sfFtp)*) &this;
	}
	
	static class Response {
		private sfFtpResponse* response;
		
		private this(sfFtpResponse* response) in {
			assert(response != null);
		} body {
			this.response = response;
		}
		
		this(Status code = Status.InvalidResponse, string message = "") {
			response = sfFtpResponse_Create(code, message.ptr, message.length);
		}
		
		~this() {
			sfFtpResponse_Destroy(response);
		}
		
		@property
		final bool ok() const {
			return sfFtpResponse_IsOk(response);
		}
		
		@property
		final Status status() const {
			return cast(Status) sfFtpResponse_GetStatus(response);
		}
		
		// TODO: Avoid using C stuff and pass directly the reference to the string.
		@property
		final string message() const {
			const char* cmessage = sfFtpResponse_GetMessage(response);
			scope(exit) free(cast(char*) cmessage);
			
			return cmessage[0 .. strlen(cmessage)].idup;
		}
	}
	
	static final class DirectoryResponse : Response {
		@property
		private final inout(sfFtpDirectoryResponse)* directoryResponse() inout {
			return cast(inout(sfFtpDirectoryResponse)*) response;
		}
		
		@property
		private final void directoryResponse(sfFtpDirectoryResponse* directoryResponse) {
			response = cast(sfFtpResponse*) directoryResponse;
		}
		
		private this(sfFtpDirectoryResponse* directoryResponse) in {
			assert(directoryResponse != null);
		} body {
			this.directoryResponse = directoryResponse;
		}
		
		~this() {
			sfFtpDirectoryResponse_Destroy(directoryResponse);
		}
		
		// TODO: Avoid using C stuff and pass directly the reference to the string.
		@property
		final string getDirectory() const {
			const char* cdirectory = sfFtpDirectoryResponse_GetDirectory(directoryResponse);
			scope(exit) free(cast(char*) cdirectory);
			
			return cdirectory[0 .. strlen(cdirectory)].idup;
		}
	}
	
	static final class ListingResponse : Response {
		@property
		private final inout(sfFtpListingResponse)* listingResponse() inout {
			return cast(inout(sfFtpListingResponse)*) response;
		}
		
		@property
		private final void listingResponse(sfFtpListingResponse* listingResponse) {
			response = cast(sfFtpResponse*) listingResponse;
		}
		
		private this(sfFtpListingResponse* listingResponse) in {
			assert(listingResponse != null);
		} body {
			this.listingResponse = listingResponse;
		}
		
		~this() {
			sfFtpListingResponse_Destroy(listingResponse);
		}
		/*
		@property
		final string[] filenames() const {
			// TODO:
		}*/
	}
	
	this() {
		sfFtp_Create(ftp);
	}
	
	~this() {
		sfFtp_Destroy(ftp);
	}
	
	Response connect(IpAddress server, ushort port = 21, Time timeout = Time()) {
		return new Response(sfFtp_Connect(ftp, server.ipAddress, port, *(cast(sfTime*) &timeout)));
	}
	
	Response disconnect() {
		return new Response(sfFtp_Disconnect(ftp));
	}
	
	Response login() {
		return new Response(sfFtp_Login(ftp));
	}
	
	Response login(string userName, string password) {
		return new Response(sfFtp_Login(ftp, userName.ptr, userName.length, password.ptr, password.length));
	}
	/*
	public Response keepAlive() {
		return new Response(sfFtp_KeepAlive(ftp));
	}
	
	public DirectoryResponse getWorkingDirectory() {
		return new DirectoryResponse();
	}
	
	public ListingResponse getDirectoryListing(string directory = "") {
		return new ListingResponse(directory);
	}
	
	public Response changeDirectory(string directory) {
		return new Response(sfFtp_ChangeDirectory(ftp, toStringz(directory)));
	}
	
	public Response parentDirectory() {
		return new Response(sfFtp_ParentDirectory(ftp));
	}
	
	public Response createDirectory(string name) {
		return new Response(sfFtp_CreateDirectory(ftp, toStringz(name)));
	}
	
	public Response deleteDirectory(string name) {
		return new Response(sfFtp_DeleteDirectory(ftp, toStringz(name)));
	}
	
	public Response renameFile(string file, string newName) {
		return new Response(sfFtp_RenameFile(ftp, toStringz(file), toStringz(newName)));
	}
	
	public Response deleteFile(string name) {
		return new Response(sfFtp_DeleteFile(ftp, toStringz(name)));
	}
	
	public Response download(string remoteFile, string localPath, sfFtpTransferMode mode = sfFtpTransferMode.sfFtpBinary) {
		return new Response(sfFtp_Download(ftp, toStringz(remoteFile), toStringz(localPath), mode));
	}
	
	public Response upload(string localFile, string remotePath, sfFtpTransferMode mode = sfFtpTransferMode.sfFtpBinary) {
		return new Response(sfFtp_Upload(ftp, toStringz(localFile), toStringz(remotePath), mode));
	}*/
}

package extern(C++) {
	struct sfFtp {
		private void[ftpSize] data = void;
	}
	
	// No opaque struct possible dur to dmd bug.
	struct sfFtpResponse {}
	
	sfFtpResponse* sfFtpResponse_Create(uint code, const char* message, size_t length);
	void sfFtpResponse_Destroy(sfFtpResponse* response);
	
	bool sfFtpResponse_IsOk(const sfFtpResponse* response);
	uint sfFtpResponse_GetStatus(const sfFtpResponse* response);
	const(char)* sfFtpResponse_GetMessage(const sfFtpResponse* response);
	
	// No opaque struct possible dur to dmd bug.
	struct sfFtpDirectoryResponse {}
	
	void sfFtpDirectoryResponse_Destroy(sfFtpDirectoryResponse* directoryResponse);
	const(char)* sfFtpDirectoryResponse_GetDirectory(const sfFtpDirectoryResponse* directoryResponse);
	
	// No opaque struct possible dur to dmd bug.
	struct sfFtpListingResponse {}
	
	void sfFtpListingResponse_Destroy(sfFtpListingResponse* listingResponse);
	
	// Ftp functions
	void sfFtp_Create(sfFtp* ftp);
	void sfFtp_Destroy(sfFtp* ftp);
	
	sfFtpResponse* sfFtp_Connect(sfFtp* ftp, sfIpAddress server, ushort port, sfTime timeout);
	sfFtpResponse* sfFtp_Disconnect(sfFtp* ftp);
	sfFtpResponse* sfFtp_Login(sfFtp* ftp);
	sfFtpResponse* sfFtp_Login(sfFtp* ftp, const char* userName, size_t userNameLength, const char* password, size_t passwordLength);
}


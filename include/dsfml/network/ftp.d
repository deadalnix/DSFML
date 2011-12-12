module dsfml.network.ftp;

import csfml.network.ftp;

import dsfml.network.ipaddress;

import std.string;
import std.c.string;

class Ftp {
	private sfFtp* ftp;
	
	public this() {
		ftp = sfFtp_Create();
	}
	
	public ~this() {
		sfFtp_Destroy(ftp);
	}
	/*
	public Response connect(IpAddress server, ushort port = 21, uint timeout = 0) {
		return new Response(sfFtp_Connect(ftp, server.getCIpAddress(), port, timeout));
	}
	*/
	public Response disconnect() {
		return new Response(sfFtp_Disconnect(ftp));
	}
	
	public Response login() {
		return new Response(sfFtp_LoginAnonymous(ftp));
	}
	
	public Response login(string userName, string password) {
		return new Response(sfFtp_Login(ftp, toStringz(userName), toStringz(password)));
	}
	
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
	}
		
	static class Response {
		private sfFtpResponse* response;
		
		private this(sfFtpResponse* response) {
			if(response is null) throw new Exception("NullArgumentException : Response is null.");
			
			this.response = response;
		}
		
		private this() {
			response = null;
		}
		
		public ~this() {
			sfFtpResponse_Destroy(response);
		}
		
		public bool isOk() const {
			return sfFtpResponse_IsOk(response);
		}
		
		public sfFtpStatus getStatus() const {
			return sfFtpResponse_GetStatus(response);
		}
		
		public string getMessage() const {
			const(char*) cmessage = sfFtpResponse_GetMessage(response);
			
			return cmessage[0 .. strlen(cmessage)].idup;
		}
	}
	
	class DirectoryResponse : Response {
		private sfFtpDirectoryResponse* response;
		
		private this() {
			response = sfFtp_GetWorkingDirectory(ftp);
		}
		
		public ~this() {
			sfFtpDirectoryResponse_Destroy(response);
		}
		
		public bool isOk() const {
			return sfFtpDirectoryResponse_IsOk(response);
		}
		
		public sfFtpStatus getStatus() const {
			return sfFtpDirectoryResponse_GetStatus(response);
		}
		
		public string getMessage() const {
			const(char*) cmessage = sfFtpDirectoryResponse_GetMessage(response);
			
			return cmessage[0 .. strlen(cmessage)].idup;
		}
		
		public string getDirectory() const {
			const(char*) cdirectory = sfFtpDirectoryResponse_GetDirectory(response);
			
			return cdirectory[0 .. strlen(cdirectory)].idup;
		}
	}
	
	class ListingResponse : Response {
		private sfFtpListingResponse* response;
		
		private this(string directory) {
			response = sfFtp_GetDirectoryListing(ftp, toStringz(directory));
		}
		
		public ~this() {
			sfFtpListingResponse_Destroy(response);
		}
		
		public bool isOk() const {
			return sfFtpListingResponse_IsOk(response);
		}
		
		public sfFtpStatus getStatus() const {
			return sfFtpListingResponse_GetStatus(response);
		}
		
		public string getMessage() const {
			const(char*) cmessage = sfFtpListingResponse_GetMessage(response);
			
			return cmessage[0 .. strlen(cmessage)].idup;
		}
		
		public string[] getFilenames(size_t index) const {
			size_t count	= sfFtpListingResponse_GetCount(response);
			string[] ret	= new string[count];
			
			for(size_t i = 0; i < count; i++) {
				const(char*) cfilename = sfFtpListingResponse_GetFilename(response, i);
				
				ret[i] = cfilename[0 .. strlen(cfilename)].idup;
			}
			
			return ret;
		}
	}
}


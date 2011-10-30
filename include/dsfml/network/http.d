module dsfml.network.http;

import csfml.network.http;

import dsfml.network.ipaddress;

import std.string;
import std.c.string;

class Http {
	private sfHttp* http;
	
	public this() {
		http = sfHttp_Create();
	}
	
	public this(string host, ushort port = 0) {
		this();
		
		setHost(host, port);
	}
	
	public ~this() {
		sfHttp_Destroy(http);
	}
	
	public void setHost(string host, ushort port = 0) {
		sfHttp_SetHost(http, toStringz(host), port);
	}
	
	public Response sendRequest(const(Request) request, uint timeout = 0) {
		return new Response(request, timeout);
	}
	
	static class Request {
		private sfHttpRequest* request;
		
		public this(string uri = "/", sfHttpMethod method = sfHttpMethod.sfHttpGet, string requestBody = "") {
			request = sfHttpRequest_Create();
			
			setUri(uri);
			setMethod(method);
			setBody(requestBody);
		}
		
		public ~this() {
			sfHttpRequest_Destroy(request);
		}
		
		public void setField(string field, string value) {
			sfHttpRequest_SetField(request, toStringz(field), toStringz(value));
		}
		
		public void setMethod(sfHttpMethod method) {
			sfHttpRequest_SetMethod(request, method);
		}
		
		public void setUri(string uri) {
			sfHttpRequest_SetUri(request, toStringz(uri));
		}
		
		public void setHttpVersion(uint major, uint minor) {
			sfHttpRequest_SetHttpVersion(request, major, minor);
		}
		
		public void setBody(string requestBody) {
			sfHttpRequest_SetBody(request, toStringz(requestBody));
		}
	}
	
	class Response {
		private sfHttpResponse* response;
		
		private this(const Request request, uint timeout = 0) {
			response = sfHttp_SendRequest(http, request.request, timeout);
		}
		
		public ~this() {
			sfHttpResponse_Destroy(response);
		}
		
		public string getField(string field) const {
			const(char*) cvalue = sfHttpResponse_GetField(response, toStringz(field));
			
			return cvalue[0 .. strlen(cvalue)].idup;
		}
		
		public sfHttpStatus getStatus() const {
			return sfHttpResponse_GetStatus(response);
		}
		
		public uint getMajorVersion() const {
			return sfHttpResponse_GetMajorVersion(response);
		}
		
		public uint getMinorVersion() const {
			return sfHttpResponse_GetMinorVersion(response);
		}
		
		public string getBody() const {
			const(char*) cbody = sfHttpResponse_GetBody(response);
			
			return cbody[0 .. strlen(cbody)].idup;
		}
	}
}


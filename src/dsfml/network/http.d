module dsfml.network.http;

import dsfml.network.ipaddress;
import dsfml.system.time;
import dsfml.sizes;

// TODO: Get rid of this.
import std.c.string;
import std.c.stdlib;

enum Method {
	Get,
	Post,
	Head,
}

enum Status {
	Ok = 200,
	Created = 201,
	Accepted = 202,
	NoContent = 204,
	MultipleChoices = 300,
	MovedPermanently = 301,
	MovedTemporarily = 302,
	NotModified = 304,
	BadRequest = 400,
	Unauthorized = 401,
	Forbidden = 403,
	NotFound = 404,
	InternalServerError = 500,
	NotImplemented = 501,
	BadGateway = 502,
	ServiceNotAvailable = 503,
	InvalidResponse = 1000,
	ConnectionFailed = 1001,
}

final class Http {
	private void[httpSize] data = void;
	
	@property
	package final inout(sfHttp*) http() inout {
		return cast(inout(sfHttp)*) &this;
	}
	
	static final class Request {
		private sfHttpRequest* request;
		
		this(string uri = "/", Method method = Method.Get, string requestBody = "") {
			request = sfHttpRequest_Create(uri.ptr, uri.length, method, requestBody.ptr, requestBody.length);
		}
		
		~this() {
			sfHttpRequest_Destroy(request);
		}
		
		// TODO: setfield
		
		@property
		final void method(Method method) {
			sfHttpRequest_SetMethod(request, method);
		}
		
		@property
		final void uri(string uri) {
			sfHttpRequest_SetUri(request, uri.ptr, uri.length);
		}
		
		// TODO: http version
		
		@property
		final void requestBody(string requestBody) {
			sfHttpRequest_SetBody(request, requestBody.ptr, requestBody.length);
		}
	}
	
	static final class Response {
		private sfHttpResponse* response;
		
		this() {
			response = sfHttpResponse_Create();
		}
		
		private this(sfHttpResponse* response) {
			this.response = response;
		}
		
		~this() {
			sfHttpResponse_Destroy(response);
		}
		
		final string getField(string field) const {
			const char* cfield = sfHttpResponse_GetField(response, field.ptr, field.length);
			scope(exit) free(cast(char*) cfield);
			
			return cfield[0 .. strlen(cfield)].idup;
		}
		
		@property
		final Status status() const {
			return cast(Status) sfHttpResponse_GetStatus(response);
		}
		
		@property
		final uint majorHttpVersion() const {
			return sfHttpResponse_GetMajorHttpVersion(response);
		}
		
		@property
		final uint minorHttpVersion() const {
			return sfHttpResponse_GetMinorHttpVersion(response);
		}
		
		@property
		final string responseBody() const {
			const char* cbody = sfHttpResponse_GetBody(response);
			scope(exit) free(cast(char*) cbody);
			
			return cbody[0 .. strlen(cbody)].idup;
		}
	}
	
	this() {
		sfHttp_Create(http);
	}
	
	this(string host, ushort port = 0) {
		sfHttp_Create(http, host.ptr, host.length, port);
	}
	
	~this() {
		sfHttp_Destroy(http);
	}
	
	void setHost(string host, ushort port = 0) {
		sfHttp_SetHost(http, host.ptr, host.length, port);
	}
	
	Response sendRequest(ref const Request request, Time timeout = Time()) {
		return new Response(sfHttp_SendRequest(http, *request.request, *(cast(sfTime*) &timeout)));
	}
}

package extern(C++) {
	struct sfHttp {
		private void[httpSize] data = void;
	}
	
	struct sfHttpRequest {}
	
	sfHttpRequest* sfHttpRequest_Create(const char* uri, size_t uriLength, uint method, const char* requestBody, size_t requestBodyLength);
	void sfHttpRequest_Destroy(sfHttpRequest* request);
	
	void sfHttpRequest_SetField(sfHttpRequest* request, const char* field, size_t fieldLength, const char* value, size_t valueLength);
	void sfHttpRequest_SetMethod(sfHttpRequest* request, uint method);
	void sfHttpRequest_SetUri(sfHttpRequest* request, const char* uri, size_t uriLength);
	void sfHttpRequest_SetHttpVersion(sfHttpRequest* request, uint major, uint minor);
	void sfHttpRequest_SetBody(sfHttpRequest* request, const char* requestBody, size_t requestBodyLength);
	
	struct sfHttpResponse {}
	
	sfHttpResponse* sfHttpResponse_Create();
	void sfHttpResponse_Destroy(sfHttpResponse* response);
	
	const(char)* sfHttpResponse_GetField(const sfHttpResponse* response, const char* field, size_t fieldLength);
	uint sfHttpResponse_GetStatus(const sfHttpResponse* response);
	uint sfHttpResponse_GetMajorHttpVersion(const sfHttpResponse* response);
	uint sfHttpResponse_GetMinorHttpVersion(const sfHttpResponse* response);
	const(char)* sfHttpResponse_GetBody(const sfHttpResponse* response);
	
	void sfHttp_Create(sfHttp* http);
	void sfHttp_Create(sfHttp* http, const char* host, size_t hostLength, ushort port);
	void sfHttp_Destroy(sfHttp* http);
	
	void sfHttp_SetHost(sfHttp* http, const char* host, size_t hostLength, ushort port);
	sfHttpResponse* sfHttp_SendRequest(sfHttp* http, ref const sfHttpRequest request, sfTime timeout);
}


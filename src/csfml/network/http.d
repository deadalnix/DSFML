module csfml.network.http;

public import csfml.network.types;

import csfml.network.ipaddress;

enum sfHttpMethod {
    sfHttpGet,
    sfHttpPost,
    sfHttpHead,
}

enum sfHttpStatus {
    sfHttpOk = 200,
    sfHttpCreated = 201,
    sfHttpAccepted = 202,
    sfHttpNoContent = 204,
    sfHttpMultipleChoices = 300,
    sfHttpMovedPermanently = 301,
    sfHttpMovedTemporarily = 302,
    sfHttpNotModified = 304,
    sfHttpBadRequest = 400,
    sfHttpUnauthorized = 401,
    sfHttpForbidden = 403,
    sfHttpNotFound = 404,
    sfHttpInternalServerError = 500,
    sfHttpNotImplemented = 501,
    sfHttpBadGateway = 502,
    sfHttpServiceNotAvailable = 503,
    sfHttpInvalidResponse = 1000,
    sfHttpConnectionFailed = 1001,
}

extern(C) {
	sfHttpRequest* sfHttpRequest_Create();
	void sfHttpRequest_Destroy(sfHttpRequest* httpRequest);
	void sfHttpRequest_SetField(sfHttpRequest* httpRequest, const char* field, const char* value);
	void sfHttpRequest_SetMethod(sfHttpRequest* httpRequest, sfHttpMethod method);
	void sfHttpRequest_SetUri(sfHttpRequest* httpRequest, const char* uri);
	void sfHttpRequest_SetHttpVersion(sfHttpRequest* httpRequest, uint major, uint minor);
	void sfHttpRequest_SetBody(sfHttpRequest* httpRequest, const char* requestBody);
	void sfHttpResponse_Destroy(sfHttpResponse* httpResponse);
	const(char*) sfHttpResponse_GetField(const sfHttpResponse* httpResponse, const char* field);
	sfHttpStatus sfHttpResponse_GetStatus(const sfHttpResponse* httpResponse);
	uint sfHttpResponse_GetMajorVersion(const sfHttpResponse* httpResponse);
	uint sfHttpResponse_GetMinorVersion(const sfHttpResponse* httpResponse);
	const(char*) sfHttpResponse_GetBody(const sfHttpResponse* httpResponse);
	sfHttp* sfHttp_Create();
	void sfHttp_Destroy(sfHttp* http);
	void sfHttp_SetHost(sfHttp* http, const char* host, ushort port);
	sfHttpResponse* sfHttp_SendRequest(sfHttp* http, const sfHttpRequest* request, uint timeout);
}


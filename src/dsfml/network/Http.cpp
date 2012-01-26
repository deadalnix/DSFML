#include<SFML/Network/Http.hpp>
// #include<SFML/Network/IpAddress.hpp>
#include<SFML/System/Enumeration.hpp>
#include<new>

typedef sf::Http::Request sfHttpRequest;

sfHttpRequest* sfHttpRequest_Create(const char* uri, size_t uriLength, unsigned int method, const char* requestBody, size_t requestBodyLength) {
	return new sfHttpRequest(std::string(uri, uriLength), sf::Enumeration<sf::Http::Request::Method, unsigned int>(method), std::string(requestBody, requestBodyLength));
}

void sfHttpRequest_Destroy(sfHttpRequest* request) {
	delete request;
}

void sfHttpRequest_SetField(sfHttpRequest* request, const char* field, size_t fieldLength, const char* value, size_t valueLength) {
	request->SetField(std::string(field, fieldLength), std::string(value, valueLength));
}

void sfHttpRequest_SetMethod(sfHttpRequest* request, unsigned int method) {
	request->SetMethod(sf::Enumeration<sf::Http::Request::Method, unsigned int>(method));
}

void sfHttpRequest_SetUri(sfHttpRequest* request, const char* uri, size_t uriLength) {
	request->SetUri(std::string(uri, uriLength));
}

void sfHttpRequest_SetHttpVersion(sfHttpRequest* request, unsigned int major, unsigned int minor) {
	request->SetHttpVersion(major, minor);
}

void sfHttpRequest_SetBody(sfHttpRequest* request, const char* requestBody, size_t requestBodyLength) {
	request->SetBody(std::string(requestBody, requestBodyLength));
}

typedef sf::Http::Response sfHttpResponse;

sfHttpResponse* sfHttpResponse_Create() {
	return new sfHttpResponse();
}

void sfHttpResponse_Destroy(sfHttpResponse*  response) {
	delete response;
}

const char* sfHttpResponse_GetField(const sfHttpResponse* response, const char* field, size_t fieldLength) {
	return response->GetField(std::string(field, fieldLength)).c_str();
}

unsigned int sfHttpResponse_GetStatus(const sfHttpResponse* response) {
	return response->GetStatus();
}

unsigned int sfHttpResponse_GetMajorHttpVersion(const sfHttpResponse* response) {
	return response->GetMajorHttpVersion();
}

unsigned int sfHttpResponse_GetMinorHttpVersion(const sfHttpResponse* response) {
	return response->GetMinorHttpVersion();
}

const char* sfHttpResponse_GetBody(const sfHttpResponse* response) {
	return response->GetBody().c_str();
}


set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/network)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/network)

# all source files
set(SRC
    ${SRCROOT}/all.d
    ${INCROOT}/ftp.d
    ${INCROOT}/http.d
    ${SRCROOT}/ipaddress.d
    ${SRCROOT}/IpAddress.cpp
    ${SRCROOT}/packet.d
    ${SRCROOT}/Packet.cpp
    ${SRCROOT}/socket.d
    ${SRCROOT}/Socket.cpp
    ${SRCROOT}/tcplistener.d
    ${SRCROOT}/TcpListener.cpp
    ${SRCROOT}/tcpsocket.d
    ${SRCROOT}/TcpSocket.cpp
    ${SRCROOT}/udpsocket.d
    ${SRCROOT}/UdpSocket.cpp)

# define the dsfml-system target
dsfml_add_library(dsfml-network
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_NETWORK_LIBRARY})

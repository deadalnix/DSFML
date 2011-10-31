set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/network)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/network)

# all source files
set(SRC
    ${INCROOT}/all.d
    ${INCROOT}/ftp.d
    ${INCROOT}/http.d
    ${INCROOT}/ipaddress.d
    ${INCROOT}/packet.d
    ${INCROOT}/socket.d
    ${INCROOT}/socketselector.d
    ${INCROOT}/tcplistener.d
    ${INCROOT}/tcpsocket.d
    ${INCROOT}/udpsocket.d)

# define the dsfml-system target
dsfml_add_library(dsfml-network
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_NETWORK_LIBRARY})

set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/network)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/network)

# all source files
set(SRC
    ${INCROOT}/ftp.d
    ${INCROOT}/ipaddress.d)

# define the dsfml-system target
dsfml_add_library(dsfml-network
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_NETWORK_LIBRARY})

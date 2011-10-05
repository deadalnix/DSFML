set(INCROOT ${CMAKE_SOURCE_DIR}/include/sfml/system)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/sfml/system)

# all source files
set(SRC
    ${INCROOT}/clock.d
    ${INCROOT}/inputstream.d
    ${INCROOT}/mutex.d
    ${INCROOT}/lock.d
    ${INCROOT}/sleep.d)

# define the dsfml-system target
dsfml_add_library(dsfml-system
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_SYSTEM_LIBRARY})

set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/system)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/system)

# all source files
set(SRC
    ${INCROOT}/all.d
    ${INCROOT}/clock.d
    ${INCROOT}/inputstream.d
    ${INCROOT}/mutex.d
    ${INCROOT}/lock.d
    ${INCROOT}/sleep.d
    ${SRCROOT}/thread.d
    ${INCROOT}/utils.d)

# define the dsfml-system target
dsfml_add_library(dsfml-system
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_SYSTEM_LIBRARY})

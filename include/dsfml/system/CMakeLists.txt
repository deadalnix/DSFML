set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/system)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/system)

# all source files
set(SRC
    ${SRCROOT}/all.d
    ${SRCROOT}/clock.d
    ${SRCROOT}/Clock.cpp
    ${SRCROOT}/inputstream.d
    ${SRCROOT}/mutex.d
    ${SRCROOT}/Mutex.cpp
    ${SRCROOT}/lock.d
    ${SRCROOT}/sleep.d
    ${SRCROOT}/Sleep.cpp
    ${SRCROOT}/thread.d
    ${SRCROOT}/time.d
    ${SRCROOT}/Time.cpp
    ${SRCROOT}/utils.d)

# define the dsfml-system target
dsfml_add_library(dsfml-system
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_SYSTEM_LIBRARY})

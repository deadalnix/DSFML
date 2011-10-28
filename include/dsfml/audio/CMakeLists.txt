set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/audio)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/audio)

# all source files
set(SRC
    ${INCROOT}/listener.d
    ${INCROOT}/music.d
    ${INCROOT}/soundstream.d)

# define the dsfml-system target
dsfml_add_library(dsfml-audio
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_AUDIO_LIBRARY})

set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/audio)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/audio)

# all source files
set(SRC
    ${INCROOT}/all.d
    ${INCROOT}/listener.d
    ${INCROOT}/music.d
    ${INCROOT}/sound.d
    ${INCROOT}/soundbuffer.d
    ${INCROOT}/soundbufferrecorder.d
    ${INCROOT}/soundrecorder.d
    ${INCROOT}/soundsource.d
    ${INCROOT}/soundstream.d)

# define the dsfml-system target
dsfml_add_library(dsfml-audio
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_AUDIO_LIBRARY})

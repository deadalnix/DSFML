set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/audio)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/audio)

# all source files
set(SRC
    ${INCROOT}/all.d
    ${INCROOT}/listener.d
    ${SRCROOT}/music.d
    ${SRCROOT}/Music.cpp
    ${SRCROOT}/sound.d
    ${SRCROOT}/Sound.cpp
    ${SRCROOT}/soundbuffer.d
    ${SRCROOT}/SoundBuffer.cpp
    ${INCROOT}/soundbufferrecorder.d
    ${INCROOT}/soundrecorder.d
    ${SRCROOT}/soundsource.d
    ${SRCROOT}/SoundSource.cpp
    ${SRCROOT}/soundstream.d
    ${SRCROOT}/SoundStream.cpp)

# define the dsfml-system target
dsfml_add_library(dsfml-audio
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_AUDIO_LIBRARY})

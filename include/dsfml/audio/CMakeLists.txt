set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/audio)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/audio)

# all source files
set(SRC
    ${SRCROOT}/all.d
    ${SRCROOT}/listener.d
    ${SRCROOT}/Listener.cpp
    ${SRCROOT}/music.d
    ${SRCROOT}/Music.cpp
    ${SRCROOT}/sound.d
    ${SRCROOT}/Sound.cpp
    ${SRCROOT}/soundbuffer.d
    ${SRCROOT}/SoundBuffer.cpp
    ${SRCROOT}/soundbufferrecorder.d
    ${SRCROOT}/SoundBufferRecorder.cpp
    ${SRCROOT}/soundrecorder.d
    ${SRCROOT}/SoundRecorder.cpp
    ${SRCROOT}/soundsource.d
    ${SRCROOT}/SoundSource.cpp
    ${SRCROOT}/soundstream.d
    ${SRCROOT}/SoundStream.cpp)

# define the dsfml-system target
dsfml_add_library(dsfml-audio
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_AUDIO_LIBRARY})

set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/window)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/window)

# all source files
set(SRC
    ${SRCROOT}/all.d
    ${INCROOT}/context.d
    ${INCROOT}/event.d
    ${INCROOT}/joystick.d
    ${INCROOT}/keyboard.d
    ${INCROOT}/mouse.d
    ${INCROOT}/videomode.d
    ${INCROOT}/window.d
    ${INCROOT}/windowhandle.d)

# define the dsfml-window target
dsfml_add_library(dsfml-window
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_WINDOW_LIBRARY})

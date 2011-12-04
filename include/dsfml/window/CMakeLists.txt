set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/window)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/window)

# all source files
set(SRC
    ${SRCROOT}/all.d
    ${SRCROOT}/context.d
    ${SRCROOT}/Context.cpp
    ${SRCROOT}/contextsettings.d
    ${SRCROOT}/event.d
    ${SRCROOT}/Event.cpp
    ${SRCROOT}/joystick.d
    ${SRCROOT}/Joystick.cpp
    ${SRCROOT}/keyboard.d
    ${SRCROOT}/Keyboard.cpp
    ${SRCROOT}/mouse.d
    ${SRCROOT}/Mouse.cpp
    ${SRCROOT}/videomode.d
    ${SRCROOT}/VideoMode.cpp
    ${SRCROOT}/window.d
    ${SRCROOT}/Window.cpp
    ${SRCROOT}/windowhandle.d
    ${SRCROOT}/windowstyle.d)

# define the dsfml-window target
dsfml_add_library(dsfml-window
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_WINDOW_LIBRARY})

set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/window)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/window)

# all source files
set(SRC
    ${INCROOT}/context.d
    ${INCROOT}/videomode.d)

# define the dsfml-window target
dsfml_add_library(dsfml-window
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_WINDOW_LIBRARY})

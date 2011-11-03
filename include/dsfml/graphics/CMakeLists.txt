set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/graphics)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/graphics)

# all source files
set(SRC
    ${INCROOT}/color.d
    ${INCROOT}/glyph.d
    ${INCROOT}/rect.d)

# define the dsfml-system target
dsfml_add_library(dsfml-graphics
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_GRAPHICS_LIBRARY})

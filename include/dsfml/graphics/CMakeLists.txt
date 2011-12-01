set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/graphics)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/graphics)

# all source files
set(SRC
    ${SRCROOT}/color.d
    ${SRCROOT}/font.d
    ${SRCROOT}/Font.cpp
    ${INCROOT}/glyph.d
    ${SRCROOT}/image.d
    ${SRCROOT}/Image.cpp
    ${SRCROOT}/rect.d
    ${INCROOT}/renderwindow.d
    ${SRCROOT}/texture.d
    ${SRCROOT}/Texture.cpp)

# define the dsfml-system target
dsfml_add_library(dsfml-graphics
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_GRAPHICS_LIBRARY})

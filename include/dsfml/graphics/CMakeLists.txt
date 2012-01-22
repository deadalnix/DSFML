set(INCROOT ${CMAKE_SOURCE_DIR}/include/dsfml/graphics)
set(SRCROOT ${CMAKE_SOURCE_DIR}/src/dsfml/graphics)

# all source files
set(SRC
    ${SRCROOT}/all.d
    ${SRCROOT}/blendmode.d
    ${SRCROOT}/color.d
    ${SRCROOT}/drawable.d
    ${SRCROOT}/Drawable.cpp
    ${SRCROOT}/font.d
    ${SRCROOT}/Font.cpp
    ${SRCROOT}/glyph.d
    ${SRCROOT}/image.d
    ${SRCROOT}/Image.cpp
    ${SRCROOT}/primitivetype.d
    ${SRCROOT}/rect.d
    ${SRCROOT}/renderstates.d
    ${SRCROOT}/RenderStates.cpp
    ${SRCROOT}/rendertarget.d
    ${SRCROOT}/RenderTarget.cpp
    ${SRCROOT}/renderwindow.d
    ${SRCROOT}/RenderWindow.cpp
    ${SRCROOT}/texture.d
    ${SRCROOT}/Texture.cpp)

# define the dsfml-system target
dsfml_add_library(dsfml-graphics
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_GRAPHICS_LIBRARY})

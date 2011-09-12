
set(SRCROOT ${CMAKE_SOURCE_DIR}/include/sfml/system)

# all source files
set(SRC
    ${SRCROOT}/clock.d
)

# define the dsfml-system target
dsfml_add_library(dsfml-system
                  SOURCES ${SRC}
                  DEPENDS ${CSFML_SYSTEM_LIBRARY})

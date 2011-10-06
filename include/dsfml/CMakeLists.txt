# include the SFML specific macros
include(${CMAKE_SOURCE_DIR}/cmake/Macros.cmake)

# add the CSFML sources path
include_directories(${CMAKE_SOURCE_DIR}/include)

# define the path of our additional CMake modules
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")

# set the output directory for CSFML libraries
set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}/lib")

# define the export symbol
# add_definitions(-DCSFML_EXPORTS)

# find CSFML libraries (C)
if(WINDOWS)
    set(CSFML_STATIC_LIBRARIES TRUE)
    add_definitions(-DCSFML_STATIC)
endif()
find_package(CSFML 2.0 COMPONENTS system window network graphics audio REQUIRED)
include_directories(${CSFML_INCLUDE_DIR})

# add the modules subdirectories
add_subdirectory(system)
add_subdirectory(window)
# add_subdirectory(Network)
# add_subdirectory(Graphics)
# add_subdirectory(Audio)
if(WINDOWS)
    # add_subdirectory(Main)
endif()

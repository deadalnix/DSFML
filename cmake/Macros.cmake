
# some of these macros are inspired from the boost/cmake macros

# check if a value is contained in a list
# sets ${var} to TRUE if the value is found
macro(dsfml_list_contains var value)
    set(${var})
    foreach(value2 ${ARGN})
        if(${value} STREQUAL ${value2})
            set(${var} TRUE)
        endif()
    endforeach()
endmacro()

# parse a list of arguments and options
# ex: sfml_parse_arguments(THIS "SOURCES;DEPENDS" "FLAG" FLAG SOURCES s1 s2 s3 DEPENDS d1 d2)
# will define the following variables:
# - THIS_SOURCES (s1 s2 s3)
# - THIS_DEPENDS (d1 d2)
# - THIS_FLAG TRUE
macro(dsfml_parse_arguments prefix arg_names option_names)
    foreach(arg_name ${arg_names})
        set(${prefix}_${arg_name})
    endforeach()
    foreach(option_name ${option_names})
        set(${prefix}_${option_name} FALSE)
    endforeach()
    set(current_arg_name)
    set(current_arg_list)
    foreach(arg ${ARGN})
        dsfml_list_contains(is_arg_name ${arg} ${arg_names})
        if(is_arg_name)
            set(${prefix}_${current_arg_name} ${current_arg_list})
            set(current_arg_name ${arg})
            set(current_arg_list)
        else()
            dsfml_list_contains(is_option ${arg} ${option_names})
            if(is_option)
                set(${prefix}_${arg} TRUE)
            else()
                set(current_arg_list ${current_arg_list} ${arg})
            endif()
        endif()
    endforeach()
    set(${prefix}_${current_arg_name} ${current_arg_list})
endmacro()

# add a new target which is a CSFML library
# ex: dsfml_add_library(sfml-graphics
#                       SOURCES sprite.cpp image.cpp ...
#                       DEPENDS sfml-window sfml-system)
macro(dsfml_add_library target)

    # parse the arguments
    dsfml_parse_arguments(THIS "SOURCES;DEPENDS" "" ${ARGN})

    # create the target
    add_library(${target} ${THIS_SOURCES})

    # adjust the output file prefix/suffix to match our conventions
    if(WINDOWS)
        # include the major version number in Windows shared library names (but not import library names)
        set_target_properties(${target} PROPERTIES DEBUG_POSTFIX -d)
        set_target_properties(${target} PROPERTIES SUFFIX "-${VERSION_MAJOR}${CMAKE_SHARED_LIBRARY_SUFFIX}")
    else()
        set_target_properties(${target} PROPERTIES DEBUG_POSTFIX -d)
    endif()

    # set the version and soversion of the target (for compatible systems -- mostly Linuxes)
    set_target_properties(${target} PROPERTIES SOVERSION ${VERSION_MAJOR})
    set_target_properties(${target} PROPERTIES VERSION ${VERSION_MAJOR}.${VERSION_MINOR})

    # link the target to its external dependencies (C++ SFML libraries)
    target_link_libraries(${target} ${THIS_DEPENDS})

    # add the install rule
    install(TARGETS ${target}
            RUNTIME DESTINATION bin COMPONENT bin
            LIBRARY DESTINATION lib${LIB_SUFFIX} COMPONENT bin 
            ARCHIVE DESTINATION lib${LIB_SUFFIX} COMPONENT devel)

endmacro()

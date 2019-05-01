find_package(PkgConfig QUIET)
if(PkgConfig_FOUND)
    pkg_check_modules(GLIB2 QUIET glib-2.0)
endif()

if(WIN32 AND NOT BUILD_STATIC)
    find_file(GLIB2_DLL
        NAMES glib-2.dll glib-2-vs9.dll libglib-2.0-0.dll
        HINTS ${GLIB2_LIBRARY_DIRS}/../bin $ENV{VCPKG_ROOT}
        PATH_SUFFIXES glib bin)
endif()

find_library(GLIB2_LIBRARIES
    NAMES glib glib-2.0
    PATH GLIB_LIBRARY_DIR)

find_path(GLIB2_GLIB2CONFIG_INCLUDE_PATH
    NAMES glibconfig.h
    PATH GLIBCONF_INCLUDE_DIR)

find_path(GLIB2_INCLUDE_DIRS
    NAMES glib.h
    PATH GLIB2_INCLUDE_DIR)

if(NOT GLIB2_LIBRARIES OR NOT GLIB2_INCLUDE_DIRS OR NOT GLIB2_GLIB2CONFIG_INCLUDE_PATH )
        message(WARNING "Not sure if I found GLIB, continuing anyway.")
endif()

#INCLUDE( FindPackageHandleStandardArgs)
#FIND_PACKAGE_HANDLE_STANDARD_ARGS( GLIB2 DEFAULT_MSG GLIB2_LIBRARIES GLIB2_GLIB2CONFIG_INCLUDE_PATH GLIB2_GLIB2_INCLUDE_PATH)
cmake_minimum_required( VERSION 3.15...99.99)

project( mulle-web-developer VERSION 0.2.5 LANGUAGES NONE)

set( PROJECT_VERSION 0.2.5)

set( EXTENSIONS
src/  # backslash is important
)


install( DIRECTORY ${EXTENSIONS}
   DESTINATION "share/mulle-sde/extensions"
   USE_SOURCE_PERMISSIONS
   PATTERN "*._DS_Store" EXCLUDE
   PATTERN "*.ignore" EXCLUDE
)


######
#
# must be after CPACK_PACKAGE_VERSION
include( CMakePackage.cmake)
include( CPack)

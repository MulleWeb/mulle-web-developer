#
# CPack and project specific stuff
#
######

set( CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set( CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set( CPACK_PACKAGE_CONTACT "Nat! <nat@mulle-kybernetik.de>")
set( CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
set( CPACK_PACKAGE_DESCRIPTION_SUMMARY "🧢 mulle-c developer kit for mulle-sde")
set( CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set( CPACK_STRIP_FILES false)

# stuff needed for Debian
# memo: its impossible to check for chosen generator here
#
# CPackDeb doesn't produce 100% proper debian file unfortunately
#
set( CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://github.com/mulle-nat/${PROJECT_NAME}")
# not strictly required

#
# mulle-test is optional
#
set( CPACK_DEBIAN_PACKAGE_DEPENDS "mulle-sde-developer")
set( CPACK_DEBIAN_PACKAGE_RECOMMENDS "mulle-test")

# stuff needed for RPM

set( CPACK_RPM_PACKAGE_VENDOR "Mulle kybernetiK")



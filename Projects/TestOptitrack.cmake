# Author: Eugenio Marinetto
# Date: 2012-10-28

set(EP_OPTION_NAME "USE_${EP_NAME}")
set(EP_REQUIRED_PROJECTS NPTrackingTools)
set(EP_OPTION_DESCRIPTION "Test Optitrack")
set(EP_OPTION_DEFAULT ON)


cma_list(APPEND EP_REQUIRED_PROJECTS Doxygen IF ${PROJECT_NAME}_BUILD_DOCUMENTATION)

cma_end_definition()
# -----------------------------------------------------------------------------


set(EP_CMAKE_ARGS
  -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
  -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
  -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
  -DCMAKE_INSTALL_PREFIX:PATH=${DESTDIR}
  -DBUILD_DOCUMENTATION:BOOL=${${PROJECT_NAME}_BUILD_DOCUMENTATION}
  -DNPTrackingTools_DIR:PATH=${${PROJECT_NAME}_NPTrackingTools_DIR}
  )


ExternalProject_Add(${EP_NAME}
  DEPENDS ${EP_REQUIRED_PROJECTS}
  # download
  # patch
  # update
  UPDATE_COMMAND ""
  # configure
  SOURCE_DIR ${PROJECT_SOURCE_DIR}/${EP_NAME}
  CMAKE_ARGS ${EP_CMAKE_ARGS}
  # build
  BINARY_DIR ${PROJECT_BINARY_DIR}/${EP_NAME}-build
  # install
# INSTALL_COMMAND ""
  # test
  )

set(${PROJECT_NAME}_${EP_NAME}_DIR "${PROJECT_BINARY_DIR}/${EP_NAME}-build" CACHE INTERNAL "")

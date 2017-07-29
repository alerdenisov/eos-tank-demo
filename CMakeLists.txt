file(GLOB SOURCE_FILES "*.cpp")
add_wast_target(tank_demo "${SOURCE_FILES}" "${CMAKE_SOURCE_DIR}/contracts" ${CMAKE_CURRENT_SOURCE_DIR})

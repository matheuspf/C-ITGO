cmake_minimum_required(VERSION 2.8.8)

set(PROJECT_NAME GKLS)

project(${PROJECT_NAME})



set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")


set(PROJECT_SOURCE_DIR "Src")

file(GLOB SRC_FILES ${PROJECT_SOURCE_DIR}/*.c)

foreach(SRC_FILE ${SRC_FILES})
    get_filename_component(LIB_NAME ${SRC_FILE} NAME_WE)
    add_library(${LIB_NAME} OBJECT ${SRC_FILE})
    set(LIBS ${LIBS} $<TARGET_OBJECTS:${LIB_NAME}>)
endforeach()

add_library(${PROJECT_NAME} SHARED ${LIBS})

#add_executable(${PROJECT_NAME} t1.c)
#target_link_libraries(${PROJECT_NAME} ${PROJECT_NAME} -lm)
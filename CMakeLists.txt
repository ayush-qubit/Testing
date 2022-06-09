cmake_minimum_required(VERSION 3.4)
project(spatial VERSION 0.0.1 LANGUAGES CXX)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

if(NOT DEFINED ENV{LLVM_HOME})
    message(FATAL_ERROR "$LLVM_HOME is not defined")
else ()
    set(ENV{LLVM_DIR} $ENV{LLVM_HOME}/lib/cmake/llvm)
endif()

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})
link_directories(${LLVM_LIBRARY_DIRS})

include(GNUInstallDirs)

add_executable(testing main.cpp)

set_target_properties(testing PROPERTIES
    COMPILE_FLAGS "-fno-rtti -g"
)

llvm_map_components_to_libnames(llvm_libs support core irreader passes transformutils)
target_link_libraries(testing ${llvm_libs})
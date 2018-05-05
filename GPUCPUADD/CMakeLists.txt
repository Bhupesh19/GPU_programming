cmake_minimum_required(VERSION 3.5)
project(Add)
find_package(CUDA QUIET REQUIRED)
set(CUDA_TOOLKIT_ROOT_DIR
    /usr/local/cuda-9.1
)
set(COMMNSRC
    src/main.cpp)
set(CPUSRC
    src/cpu.cpp)
set(GPUSRC
    src/gpu.cu)
include_directories( 
    inc)

if(CUDA_FOUND)
    message(STATUS "CUDA FOUND")
    message(STATUS ${CUDA_TOOLKIT_ROOT_DIR})
    # convert .cpp file into .cu file
#    set_source_files_properties(
#        src/main.cpp PROPERTIES CUDA_SOURCE_PROPERTY_FORAMT OBJ
#    )

    cuda_add_executable(final ${COMMNSRC} ${GPUSRC})
else(CUDA_FOUND)
    message(WARNING "CUDA NOT FOUND")
    add_executable(final ${COMMNSRC} ${CPUSRC})
endif()

# Finding 1: The code which contains any CUDA specific keyword 
# should be in .cu file

#Finding 2: with .cu files - If CUDA_SEPARABLE_COMPLATION is not ON then I get 
#ptxas fatal : Unresolved extern function '_ZN2v39normalizeEv' error for host function

# Finding 3: CMAKE version 3.8 or above better support for compliation 
 
cmake_minimum_required(VERSION 3.5)
project(SCOM)
find_package(CUDA QUIET REQUIRED)
set(CUDA_TOOLKIT_ROOT_DIR
    /usr/local/cuda-9.1
)
# solve this error h:652:42: error: ‘memcpy’ was not declared in this scope
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_FORCE_INLINES")

set(SRCD
    src/main.cu
    src/v3.cu
    src/particle.cu)
include_directories( 
    inc)

if(CUDA_FOUND)
    message(STATUS "CUDA FOUND")
    message(STATUS ${CUDA_TOOLKIT_ROOT_DIR})
# Pass options to NVCC
    list(APPEND CUDA_NVCC_FLAGS 
        "-O3")
    message(STATUS ${CUDA_NVCC_FLAGS})
    set(CUDA_SEPARABLE_COMPILATION ON)
    cuda_add_executable(final ${SRCD})
    #set_property(TARGET final PROPERTY CUDA_SEPARABLE_COMPILATION ON)     
# convert .cpp file into .cu file
    #set_source_files_properties(
    #    src/main.cpp PROPERTIES CUDA_SOURCE_PROPERTY_FORAMT OBJ
    #)


else(CUDA_FOUND)
    message(WARNING "CUDA NOT FOUND")
    add_executable(final ${COMMNSRC} ${CPUSRC})
endif()

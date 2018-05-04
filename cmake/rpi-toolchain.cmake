SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

set(CMAKE_C_COMPILER ${CMAKE_C_COMPILER} CACHE PATH "Location of c compiler")
set(CMAKE_CXX_COMPILER ${CMAKE_CXX_COMPILER} CACHE PATH "Location of c++ compiler")

set(CMAKE_SYSROOT ${CMAKE_SYSROOT} CACHE PATH "Location of sysroot")


set(RPI_ASM_FLAGS "-mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard -marm -c")
set(RPI_C_FLAGS "-mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard -marm -U_FORTIFY_SOURCE -I${CMAKE_SYSROOT}/usr/include/arm-linux-gnueabihf")
set(RPI_CXX_FLAGS "-mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard -marm -U_FORTIFY_SOURCE -I${CMAKE_SYSROOT}/usr/include/arm-linux-gnueabihf -std=c++11")
set(RPI_LD_FLAGS "-B${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf -Wl,-rpath-link,${CMAKE_SYSROOT}/lib/arm-linux-gnueabihf -Wl,-rpath-link,${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf")

set(CMAKE_ASM_FLAGS             	""			CACHE STRING "asm flags")
set(CMAKE_C_FLAGS             		""			CACHE STRING "c flags")
set(CMAKE_CXX_FLAGS           		""			CACHE STRING "c++ flags")

set(CMAKE_C_FLAGS_DEBUG       		"-g"    		CACHE STRING "c Debug flags")
set(CMAKE_CXX_FLAGS_DEBUG     		"-g"			CACHE STRING "c++ Debug flags")

set(CMAKE_C_FLAGS_RELEASE     		"-O3 -DNDEBUG"		CACHE STRING "c Release flags")
set(CMAKE_CXX_FLAGS_RELEASE   		"-O3 -DNDEBUG"		CACHE STRING "c++ Release flags")

set(CMAKE_C_FLAGS_RELWITHDEBINFO	"-O2 -g -DNDEBUG"    	CACHE STRING "c Release with debug info flags")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO	"-O2 -g -DNDEBUG"	CACHE STRING "c++ Release with debug info flags")

set(CMAKE_C_FLAGS_MINSIZEREL		"-Os -DNDEBUG"    	CACHE STRING "c Release with minimum size")
set(CMAKE_CXX_FLAGS_MINSIZEREL		"-Os -DNDEBUG"		CACHE STRING "c++ Release with minimum size")


set(CMAKE_SHARED_LINKER_FLAGS 		""	CACHE STRING "shared linker flags")
set(CMAKE_MODULE_LINKER_FLAGS 		""	CACHE STRING "module linker flags")
set(CMAKE_EXE_LINKER_FLAGS    		""	CACHE STRING "executable linker flags")

set(CMAKE_ASM_FLAGS			"${RPI_ASM_FLAGS} ${CMAKE_ASM_FLAGS}")
set(CMAKE_C_FLAGS			"${RPI_C_FLAGS} ${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS			"${RPI_CXX_FLAGS} ${CMAKE_CXX_FLAGS}")

set(CMAKE_C_FLAGS_DEBUG			"${CMAKE_C_FLAGS_DEBUG}")
set(CMAKE_CXX_FLAGS_DEBUG		"${CMAKE_CXX_FLAGS_DEBUG}")

set(CMAKE_C_FLAGS_RELEASE		"${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_RELEASE		"${CMAKE_CXX_FLAGS_RELEASE}")

set(CMAKE_C_FLAGS_RELWITHDEBINFO	"${CMAKE_C_FLAGS_RELWITHDEBINFO}")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO	"${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")

set(CMAKE_C_FLAGS_MINSIZEREL		"${CMAKE_C_FLAGS_MINSIZEREL}")
set(CMAKE_CXX_FLAGS_MINSIZEREL		"${CMAKE_CXX_FLAGS_MINSIZEREL}")

set(CMAKE_SHARED_LINKER_FLAGS		"${RPI_LD_FLAGS} ${CMAKE_SHARED_LINKER_FLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS		"${RPI_LD_FLAGS} ${CMAKE_MODULE_LINKER_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS		"${RPI_LD_FLAGS} ${CMAKE_EXE_LINKER_FLAGS}")

set(PKG_CONFIG_USE_CMAKE_PREFIX_PATH ON)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)






# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/matheus/Algoritmos/testes/GKLS/C/Dp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/matheus/Algoritmos/testes/GKLS/C/Dp/build

# Include any dependencies generated for this target.
include CMakeFiles/gkls.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gkls.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gkls.dir/flags.make

CMakeFiles/gkls.dir/Src/gkls.c.o: CMakeFiles/gkls.dir/flags.make
CMakeFiles/gkls.dir/Src/gkls.c.o: ../Src/gkls.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/matheus/Algoritmos/testes/GKLS/C/Dp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/gkls.dir/Src/gkls.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/gkls.dir/Src/gkls.c.o   -c /home/matheus/Algoritmos/testes/GKLS/C/Dp/Src/gkls.c

CMakeFiles/gkls.dir/Src/gkls.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gkls.dir/Src/gkls.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/matheus/Algoritmos/testes/GKLS/C/Dp/Src/gkls.c > CMakeFiles/gkls.dir/Src/gkls.c.i

CMakeFiles/gkls.dir/Src/gkls.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gkls.dir/Src/gkls.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/matheus/Algoritmos/testes/GKLS/C/Dp/Src/gkls.c -o CMakeFiles/gkls.dir/Src/gkls.c.s

CMakeFiles/gkls.dir/Src/gkls.c.o.requires:

.PHONY : CMakeFiles/gkls.dir/Src/gkls.c.o.requires

CMakeFiles/gkls.dir/Src/gkls.c.o.provides: CMakeFiles/gkls.dir/Src/gkls.c.o.requires
	$(MAKE) -f CMakeFiles/gkls.dir/build.make CMakeFiles/gkls.dir/Src/gkls.c.o.provides.build
.PHONY : CMakeFiles/gkls.dir/Src/gkls.c.o.provides

CMakeFiles/gkls.dir/Src/gkls.c.o.provides.build: CMakeFiles/gkls.dir/Src/gkls.c.o


gkls: CMakeFiles/gkls.dir/Src/gkls.c.o
gkls: CMakeFiles/gkls.dir/build.make

.PHONY : gkls

# Rule to build all files generated by this target.
CMakeFiles/gkls.dir/build: gkls

.PHONY : CMakeFiles/gkls.dir/build

CMakeFiles/gkls.dir/requires: CMakeFiles/gkls.dir/Src/gkls.c.o.requires

.PHONY : CMakeFiles/gkls.dir/requires

CMakeFiles/gkls.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gkls.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gkls.dir/clean

CMakeFiles/gkls.dir/depend:
	cd /home/matheus/Algoritmos/testes/GKLS/C/Dp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/matheus/Algoritmos/testes/GKLS/C/Dp /home/matheus/Algoritmos/testes/GKLS/C/Dp /home/matheus/Algoritmos/testes/GKLS/C/Dp/build /home/matheus/Algoritmos/testes/GKLS/C/Dp/build /home/matheus/Algoritmos/testes/GKLS/C/Dp/build/CMakeFiles/gkls.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gkls.dir/depend

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
include CMakeFiles/GKLS.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/GKLS.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/GKLS.dir/flags.make

# Object files for target GKLS
GKLS_OBJECTS =

# External object files for target GKLS
GKLS_EXTERNAL_OBJECTS = \
"/home/matheus/Algoritmos/testes/GKLS/C/Dp/build/CMakeFiles/rnd_gen.dir/Src/rnd_gen.c.o" \
"/home/matheus/Algoritmos/testes/GKLS/C/Dp/build/CMakeFiles/fnc.dir/Src/fnc.c.o" \
"/home/matheus/Algoritmos/testes/GKLS/C/Dp/build/CMakeFiles/gkls.dir/Src/gkls.c.o"

libGKLS.so: CMakeFiles/rnd_gen.dir/Src/rnd_gen.c.o
libGKLS.so: CMakeFiles/fnc.dir/Src/fnc.c.o
libGKLS.so: CMakeFiles/gkls.dir/Src/gkls.c.o
libGKLS.so: CMakeFiles/GKLS.dir/build.make
libGKLS.so: CMakeFiles/GKLS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/matheus/Algoritmos/testes/GKLS/C/Dp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C shared library libGKLS.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/GKLS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/GKLS.dir/build: libGKLS.so

.PHONY : CMakeFiles/GKLS.dir/build

CMakeFiles/GKLS.dir/requires:

.PHONY : CMakeFiles/GKLS.dir/requires

CMakeFiles/GKLS.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/GKLS.dir/cmake_clean.cmake
.PHONY : CMakeFiles/GKLS.dir/clean

CMakeFiles/GKLS.dir/depend:
	cd /home/matheus/Algoritmos/testes/GKLS/C/Dp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/matheus/Algoritmos/testes/GKLS/C/Dp /home/matheus/Algoritmos/testes/GKLS/C/Dp /home/matheus/Algoritmos/testes/GKLS/C/Dp/build /home/matheus/Algoritmos/testes/GKLS/C/Dp/build /home/matheus/Algoritmos/testes/GKLS/C/Dp/build/CMakeFiles/GKLS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/GKLS.dir/depend

# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/alen/ibex-lib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alen/ibex-lib/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/TestFunction.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/TestFunction.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/TestFunction.dir/flags.make

tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o: tests/CMakeFiles/TestFunction.dir/flags.make
tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o: ../tests/TestFunction.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestFunction.dir/TestFunction.cpp.o -c /home/alen/ibex-lib/tests/TestFunction.cpp

tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestFunction.dir/TestFunction.cpp.i"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alen/ibex-lib/tests/TestFunction.cpp > CMakeFiles/TestFunction.dir/TestFunction.cpp.i

tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestFunction.dir/TestFunction.cpp.s"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alen/ibex-lib/tests/TestFunction.cpp -o CMakeFiles/TestFunction.dir/TestFunction.cpp.s

tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o.requires:

.PHONY : tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o.requires

tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o.provides: tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/TestFunction.dir/build.make tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o.provides.build
.PHONY : tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o.provides

tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o.provides.build: tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o


# Object files for target TestFunction
TestFunction_OBJECTS = \
"CMakeFiles/TestFunction.dir/TestFunction.cpp.o"

# External object files for target TestFunction
TestFunction_EXTERNAL_OBJECTS =

tests/TestFunction: tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o
tests/TestFunction: tests/CMakeFiles/TestFunction.dir/build.make
tests/TestFunction: tests/libtest_common.a
tests/TestFunction: src/libibex.a
tests/TestFunction: interval_lib_wrapper/filib/filibsrc-3.0.2.2-build/libprim.a
tests/TestFunction: lp_lib_wrapper/soplex/soplex-4.0.2/lib/libsoplex.a
tests/TestFunction: tests/CMakeFiles/TestFunction.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TestFunction"
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestFunction.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/TestFunction.dir/build: tests/TestFunction

.PHONY : tests/CMakeFiles/TestFunction.dir/build

tests/CMakeFiles/TestFunction.dir/requires: tests/CMakeFiles/TestFunction.dir/TestFunction.cpp.o.requires

.PHONY : tests/CMakeFiles/TestFunction.dir/requires

tests/CMakeFiles/TestFunction.dir/clean:
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/TestFunction.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/TestFunction.dir/clean

tests/CMakeFiles/TestFunction.dir/depend:
	cd /home/alen/ibex-lib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alen/ibex-lib /home/alen/ibex-lib/tests /home/alen/ibex-lib/build /home/alen/ibex-lib/build/tests /home/alen/ibex-lib/build/tests/CMakeFiles/TestFunction.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/TestFunction.dir/depend

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
include tests/CMakeFiles/TestExprLinearity.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/TestExprLinearity.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/TestExprLinearity.dir/flags.make

tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o: tests/CMakeFiles/TestExprLinearity.dir/flags.make
tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o: ../tests/TestExprLinearity.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o -c /home/alen/ibex-lib/tests/TestExprLinearity.cpp

tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.i"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alen/ibex-lib/tests/TestExprLinearity.cpp > CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.i

tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.s"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alen/ibex-lib/tests/TestExprLinearity.cpp -o CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.s

tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o.requires:

.PHONY : tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o.requires

tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o.provides: tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/TestExprLinearity.dir/build.make tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o.provides.build
.PHONY : tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o.provides

tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o.provides.build: tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o


# Object files for target TestExprLinearity
TestExprLinearity_OBJECTS = \
"CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o"

# External object files for target TestExprLinearity
TestExprLinearity_EXTERNAL_OBJECTS =

tests/TestExprLinearity: tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o
tests/TestExprLinearity: tests/CMakeFiles/TestExprLinearity.dir/build.make
tests/TestExprLinearity: tests/libtest_common.a
tests/TestExprLinearity: src/libibex.a
tests/TestExprLinearity: interval_lib_wrapper/filib/filibsrc-3.0.2.2-build/libprim.a
tests/TestExprLinearity: lp_lib_wrapper/soplex/soplex-4.0.2/lib/libsoplex.a
tests/TestExprLinearity: tests/CMakeFiles/TestExprLinearity.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TestExprLinearity"
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestExprLinearity.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/TestExprLinearity.dir/build: tests/TestExprLinearity

.PHONY : tests/CMakeFiles/TestExprLinearity.dir/build

tests/CMakeFiles/TestExprLinearity.dir/requires: tests/CMakeFiles/TestExprLinearity.dir/TestExprLinearity.cpp.o.requires

.PHONY : tests/CMakeFiles/TestExprLinearity.dir/requires

tests/CMakeFiles/TestExprLinearity.dir/clean:
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/TestExprLinearity.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/TestExprLinearity.dir/clean

tests/CMakeFiles/TestExprLinearity.dir/depend:
	cd /home/alen/ibex-lib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alen/ibex-lib /home/alen/ibex-lib/tests /home/alen/ibex-lib/build /home/alen/ibex-lib/build/tests /home/alen/ibex-lib/build/tests/CMakeFiles/TestExprLinearity.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/TestExprLinearity.dir/depend


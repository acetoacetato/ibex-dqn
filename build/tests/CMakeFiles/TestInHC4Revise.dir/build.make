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
include tests/CMakeFiles/TestInHC4Revise.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/TestInHC4Revise.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/TestInHC4Revise.dir/flags.make

tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o: tests/CMakeFiles/TestInHC4Revise.dir/flags.make
tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o: ../tests/TestInHC4Revise.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o -c /home/alen/ibex-lib/tests/TestInHC4Revise.cpp

tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.i"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alen/ibex-lib/tests/TestInHC4Revise.cpp > CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.i

tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.s"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alen/ibex-lib/tests/TestInHC4Revise.cpp -o CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.s

tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o.requires:

.PHONY : tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o.requires

tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o.provides: tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/TestInHC4Revise.dir/build.make tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o.provides.build
.PHONY : tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o.provides

tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o.provides.build: tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o


# Object files for target TestInHC4Revise
TestInHC4Revise_OBJECTS = \
"CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o"

# External object files for target TestInHC4Revise
TestInHC4Revise_EXTERNAL_OBJECTS =

tests/TestInHC4Revise: tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o
tests/TestInHC4Revise: tests/CMakeFiles/TestInHC4Revise.dir/build.make
tests/TestInHC4Revise: tests/libtest_common.a
tests/TestInHC4Revise: src/libibex.a
tests/TestInHC4Revise: interval_lib_wrapper/filib/filibsrc-3.0.2.2-build/libprim.a
tests/TestInHC4Revise: lp_lib_wrapper/soplex/soplex-4.0.2/lib/libsoplex.a
tests/TestInHC4Revise: tests/CMakeFiles/TestInHC4Revise.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TestInHC4Revise"
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestInHC4Revise.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/TestInHC4Revise.dir/build: tests/TestInHC4Revise

.PHONY : tests/CMakeFiles/TestInHC4Revise.dir/build

tests/CMakeFiles/TestInHC4Revise.dir/requires: tests/CMakeFiles/TestInHC4Revise.dir/TestInHC4Revise.cpp.o.requires

.PHONY : tests/CMakeFiles/TestInHC4Revise.dir/requires

tests/CMakeFiles/TestInHC4Revise.dir/clean:
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/TestInHC4Revise.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/TestInHC4Revise.dir/clean

tests/CMakeFiles/TestInHC4Revise.dir/depend:
	cd /home/alen/ibex-lib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alen/ibex-lib /home/alen/ibex-lib/tests /home/alen/ibex-lib/build /home/alen/ibex-lib/build/tests /home/alen/ibex-lib/build/tests/CMakeFiles/TestInHC4Revise.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/TestInHC4Revise.dir/depend


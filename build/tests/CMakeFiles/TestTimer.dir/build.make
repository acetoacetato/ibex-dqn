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
include tests/CMakeFiles/TestTimer.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/TestTimer.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/TestTimer.dir/flags.make

tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o: tests/CMakeFiles/TestTimer.dir/flags.make
tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o: ../tests/TestTimer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestTimer.dir/TestTimer.cpp.o -c /home/alen/ibex-lib/tests/TestTimer.cpp

tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestTimer.dir/TestTimer.cpp.i"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alen/ibex-lib/tests/TestTimer.cpp > CMakeFiles/TestTimer.dir/TestTimer.cpp.i

tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestTimer.dir/TestTimer.cpp.s"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alen/ibex-lib/tests/TestTimer.cpp -o CMakeFiles/TestTimer.dir/TestTimer.cpp.s

tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o.requires:

.PHONY : tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o.requires

tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o.provides: tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/TestTimer.dir/build.make tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o.provides.build
.PHONY : tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o.provides

tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o.provides.build: tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o


# Object files for target TestTimer
TestTimer_OBJECTS = \
"CMakeFiles/TestTimer.dir/TestTimer.cpp.o"

# External object files for target TestTimer
TestTimer_EXTERNAL_OBJECTS =

tests/TestTimer: tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o
tests/TestTimer: tests/CMakeFiles/TestTimer.dir/build.make
tests/TestTimer: tests/libtest_common.a
tests/TestTimer: src/libibex.a
tests/TestTimer: interval_lib_wrapper/filib/filibsrc-3.0.2.2-build/libprim.a
tests/TestTimer: lp_lib_wrapper/soplex/soplex-4.0.2/lib/libsoplex.a
tests/TestTimer: tests/CMakeFiles/TestTimer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TestTimer"
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestTimer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/TestTimer.dir/build: tests/TestTimer

.PHONY : tests/CMakeFiles/TestTimer.dir/build

tests/CMakeFiles/TestTimer.dir/requires: tests/CMakeFiles/TestTimer.dir/TestTimer.cpp.o.requires

.PHONY : tests/CMakeFiles/TestTimer.dir/requires

tests/CMakeFiles/TestTimer.dir/clean:
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/TestTimer.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/TestTimer.dir/clean

tests/CMakeFiles/TestTimer.dir/depend:
	cd /home/alen/ibex-lib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alen/ibex-lib /home/alen/ibex-lib/tests /home/alen/ibex-lib/build /home/alen/ibex-lib/build/tests /home/alen/ibex-lib/build/tests/CMakeFiles/TestTimer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/TestTimer.dir/depend


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
include tests/CMakeFiles/TestBxpSystemCache.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/TestBxpSystemCache.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/TestBxpSystemCache.dir/flags.make

tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o: tests/CMakeFiles/TestBxpSystemCache.dir/flags.make
tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o: ../tests/TestBxpSystemCache.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o -c /home/alen/ibex-lib/tests/TestBxpSystemCache.cpp

tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.i"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alen/ibex-lib/tests/TestBxpSystemCache.cpp > CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.i

tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.s"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alen/ibex-lib/tests/TestBxpSystemCache.cpp -o CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.s

tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o.requires:

.PHONY : tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o.requires

tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o.provides: tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/TestBxpSystemCache.dir/build.make tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o.provides.build
.PHONY : tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o.provides

tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o.provides.build: tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o


# Object files for target TestBxpSystemCache
TestBxpSystemCache_OBJECTS = \
"CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o"

# External object files for target TestBxpSystemCache
TestBxpSystemCache_EXTERNAL_OBJECTS =

tests/TestBxpSystemCache: tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o
tests/TestBxpSystemCache: tests/CMakeFiles/TestBxpSystemCache.dir/build.make
tests/TestBxpSystemCache: tests/libtest_common.a
tests/TestBxpSystemCache: src/libibex.a
tests/TestBxpSystemCache: interval_lib_wrapper/filib/filibsrc-3.0.2.2-build/libprim.a
tests/TestBxpSystemCache: lp_lib_wrapper/soplex/soplex-4.0.2/lib/libsoplex.a
tests/TestBxpSystemCache: tests/CMakeFiles/TestBxpSystemCache.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TestBxpSystemCache"
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestBxpSystemCache.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/TestBxpSystemCache.dir/build: tests/TestBxpSystemCache

.PHONY : tests/CMakeFiles/TestBxpSystemCache.dir/build

tests/CMakeFiles/TestBxpSystemCache.dir/requires: tests/CMakeFiles/TestBxpSystemCache.dir/TestBxpSystemCache.cpp.o.requires

.PHONY : tests/CMakeFiles/TestBxpSystemCache.dir/requires

tests/CMakeFiles/TestBxpSystemCache.dir/clean:
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/TestBxpSystemCache.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/TestBxpSystemCache.dir/clean

tests/CMakeFiles/TestBxpSystemCache.dir/depend:
	cd /home/alen/ibex-lib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alen/ibex-lib /home/alen/ibex-lib/tests /home/alen/ibex-lib/build /home/alen/ibex-lib/build/tests /home/alen/ibex-lib/build/tests/CMakeFiles/TestBxpSystemCache.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/TestBxpSystemCache.dir/depend


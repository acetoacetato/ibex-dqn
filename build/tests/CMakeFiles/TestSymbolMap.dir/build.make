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
include tests/CMakeFiles/TestSymbolMap.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/TestSymbolMap.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/TestSymbolMap.dir/flags.make

tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o: tests/CMakeFiles/TestSymbolMap.dir/flags.make
tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o: ../tests/TestSymbolMap.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o -c /home/alen/ibex-lib/tests/TestSymbolMap.cpp

tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.i"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alen/ibex-lib/tests/TestSymbolMap.cpp > CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.i

tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.s"
	cd /home/alen/ibex-lib/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alen/ibex-lib/tests/TestSymbolMap.cpp -o CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.s

tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o.requires:

.PHONY : tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o.requires

tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o.provides: tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/TestSymbolMap.dir/build.make tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o.provides.build
.PHONY : tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o.provides

tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o.provides.build: tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o


# Object files for target TestSymbolMap
TestSymbolMap_OBJECTS = \
"CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o"

# External object files for target TestSymbolMap
TestSymbolMap_EXTERNAL_OBJECTS =

tests/TestSymbolMap: tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o
tests/TestSymbolMap: tests/CMakeFiles/TestSymbolMap.dir/build.make
tests/TestSymbolMap: tests/libtest_common.a
tests/TestSymbolMap: src/libibex.a
tests/TestSymbolMap: interval_lib_wrapper/filib/filibsrc-3.0.2.2-build/libprim.a
tests/TestSymbolMap: lp_lib_wrapper/soplex/soplex-4.0.2/lib/libsoplex.a
tests/TestSymbolMap: tests/CMakeFiles/TestSymbolMap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alen/ibex-lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TestSymbolMap"
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestSymbolMap.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/TestSymbolMap.dir/build: tests/TestSymbolMap

.PHONY : tests/CMakeFiles/TestSymbolMap.dir/build

tests/CMakeFiles/TestSymbolMap.dir/requires: tests/CMakeFiles/TestSymbolMap.dir/TestSymbolMap.cpp.o.requires

.PHONY : tests/CMakeFiles/TestSymbolMap.dir/requires

tests/CMakeFiles/TestSymbolMap.dir/clean:
	cd /home/alen/ibex-lib/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/TestSymbolMap.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/TestSymbolMap.dir/clean

tests/CMakeFiles/TestSymbolMap.dir/depend:
	cd /home/alen/ibex-lib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alen/ibex-lib /home/alen/ibex-lib/tests /home/alen/ibex-lib/build /home/alen/ibex-lib/build/tests /home/alen/ibex-lib/build/tests/CMakeFiles/TestSymbolMap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/TestSymbolMap.dir/depend


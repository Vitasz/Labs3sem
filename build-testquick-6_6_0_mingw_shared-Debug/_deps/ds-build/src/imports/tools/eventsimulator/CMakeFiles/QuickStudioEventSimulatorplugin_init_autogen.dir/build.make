# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles JOM" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = C:\msys64\mingw64\bin\cmake.exe

# The command to remove a file.
RM = C:\msys64\mingw64\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\qtProjects\testquick

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

# Utility rule file for QuickStudioEventSimulatorplugin_init_autogen.

# Include any custom commands dependencies for this target.
include _deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\compiler_depend.make

# Include the progress variables for this target.
include _deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\progress.make

_deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen: _deps\ds-build\src\imports\tools\eventsimulator\QuickStudioEventSimulatorplugin_init.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC and UIC for target QuickStudioEventSimulatorplugin_init"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\tools\eventsimulator
	C:\msys64\mingw64\bin\cmake.exe -E cmake_autogen C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init_autogen.dir/AutogenInfo.json Debug
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

QuickStudioEventSimulatorplugin_init_autogen: _deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen
QuickStudioEventSimulatorplugin_init_autogen: _deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\build.make
.PHONY : QuickStudioEventSimulatorplugin_init_autogen

# Rule to build all files generated by this target.
_deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\build: QuickStudioEventSimulatorplugin_init_autogen
.PHONY : _deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\build

_deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\clean:
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\tools\eventsimulator
	$(CMAKE_COMMAND) -P CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\cmake_clean.cmake
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug
.PHONY : _deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\clean

_deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles JOM" C:\qtProjects\testquick C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-src\src\imports\tools\eventsimulator C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\tools\eventsimulator C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps\ds-build\src\imports\tools\eventsimulator\CMakeFiles\QuickStudioEventSimulatorplugin_init_autogen.dir\depend


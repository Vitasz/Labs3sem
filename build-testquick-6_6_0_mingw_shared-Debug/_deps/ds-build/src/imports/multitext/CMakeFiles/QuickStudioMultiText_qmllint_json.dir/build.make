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

# Utility rule file for QuickStudioMultiText_qmllint_json.

# Include any custom commands dependencies for this target.
include _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\compiler_depend.make

# Include the progress variables for this target.
include _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\progress.make

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json: C:\msys64\mingw64\bin\qmllint-qt6.exe
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json: C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-src\src\imports\multitext\MultiTextElement.qml
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json: C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-src\src\imports\multitext\MultiTextItem.qml
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json: C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-src\src\imports\multitext\MultiTextException.qml
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-src\src\imports\multitext
	call C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\.qt\bin\qt_setup_tool_path.bat C:/msys64/mingw64/bin/qmllint-qt6.exe --bare -I C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/qml -I C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/qml -I C:/msys64/mingw64/share/qt6/qml --resource C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/multitext/.rcc/qmake_QtQuick_Studio_MultiText.qrc --resource C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/multitext/.rcc/QuickStudioMultiText_raw_qml_0.qrc C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-src/src/imports/multitext/MultiTextElement.qml C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-src/src/imports/multitext/MultiTextItem.qml C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-src/src/imports/multitext/MultiTextException.qml --json C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/QuickStudioMultiText_qmllint.json
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

QuickStudioMultiText_qmllint_json: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json
QuickStudioMultiText_qmllint_json: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\build.make
.PHONY : QuickStudioMultiText_qmllint_json

# Rule to build all files generated by this target.
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\build: QuickStudioMultiText_qmllint_json
.PHONY : _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\build

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\clean:
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	$(CMAKE_COMMAND) -P CMakeFiles\QuickStudioMultiText_qmllint_json.dir\cmake_clean.cmake
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug
.PHONY : _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\clean

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles JOM" C:\qtProjects\testquick C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-src\src\imports\multitext C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmllint_json.dir\depend


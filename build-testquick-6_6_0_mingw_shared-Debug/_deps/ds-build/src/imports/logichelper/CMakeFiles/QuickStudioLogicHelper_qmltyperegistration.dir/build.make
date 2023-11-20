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

# Utility rule file for QuickStudioLogicHelper_qmltyperegistration.

# Include any custom commands dependencies for this target.
include _deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\compiler_depend.make

# Include the progress variables for this target.
include _deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\progress.make

_deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration: _deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp
_deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration: qml\QtQuick\Studio\LogicHelper\QuickStudioLogicHelper.qmltypes
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\logichelper
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

_deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp: _deps\ds-build\src\imports\logichelper\qmltypes\QuickStudioLogicHelper_foreign_types.txt
_deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp: _deps\ds-build\src\imports\logichelper\meta_types\qt6quickstudiologichelper_debug_metatypes.json
_deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp: C:\msys64\mingw64\share\qt6\bin\qmltyperegistrar.exe
_deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp: C:\msys64\mingw64\share\qt6\metatypes\qt6qml_relwithdebinfo_metatypes.json
_deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp: C:\msys64\mingw64\share\qt6\metatypes\qt6core_relwithdebinfo_metatypes.json
_deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp: C:\msys64\mingw64\share\qt6\metatypes\qt6network_relwithdebinfo_metatypes.json
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic QML type registration for target QuickStudioLogicHelper"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\logichelper
	call ..\..\..\..\..\.qt\bin\qt_setup_tool_path.bat C:/msys64/mingw64/share/qt6/bin/qmltyperegistrar.exe --generate-qmltypes=C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/qml/QtQuick/Studio/LogicHelper/QuickStudioLogicHelper.qmltypes --import-name=QtQuick.Studio.LogicHelper --major-version=6 --minor-version=4 --past-major-version 1 @C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/logichelper/qmltypes/QuickStudioLogicHelper_foreign_types.txt -o C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/logichelper/quickstudiologichelper_qmltyperegistrations.cpp C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/logichelper/meta_types/qt6quickstudiologichelper_debug_metatypes.json
	C:\msys64\mingw64\bin\cmake.exe -E make_directory C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/logichelper/.generated
	C:\msys64\mingw64\bin\cmake.exe -E touch C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/logichelper/.generated/QuickStudioLogicHelper.qmltypes
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

qml\QtQuick\Studio\LogicHelper\QuickStudioLogicHelper.qmltypes: _deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate qml\QtQuick\Studio\LogicHelper\QuickStudioLogicHelper.qmltypes

QuickStudioLogicHelper_qmltyperegistration: _deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration
QuickStudioLogicHelper_qmltyperegistration: _deps\ds-build\src\imports\logichelper\quickstudiologichelper_qmltyperegistrations.cpp
QuickStudioLogicHelper_qmltyperegistration: qml\QtQuick\Studio\LogicHelper\QuickStudioLogicHelper.qmltypes
QuickStudioLogicHelper_qmltyperegistration: _deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\build.make
.PHONY : QuickStudioLogicHelper_qmltyperegistration

# Rule to build all files generated by this target.
_deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\build: QuickStudioLogicHelper_qmltyperegistration
.PHONY : _deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\build

_deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\clean:
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\logichelper
	$(CMAKE_COMMAND) -P CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\cmake_clean.cmake
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug
.PHONY : _deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\clean

_deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles JOM" C:\qtProjects\testquick C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-src\src\imports\logichelper C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\logichelper C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps\ds-build\src\imports\logichelper\CMakeFiles\QuickStudioLogicHelper_qmltyperegistration.dir\depend


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

# Include any dependencies generated for this target.
include _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\depend.make
# Include any dependencies generated by the compiler for this target.
include _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\compiler_depend.make

# Include the progress variables for this target.
include _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\progress.make

# Include the compile flags for this target's objects.
include _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\flags.make

_deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp: C:\msys64\mingw64\share\qt6\bin\qmlcachegen.exe
_deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp: _deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qml_loader_file_list.rsp
_deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp: _deps\ds-build\src\imports\multitext\.rcc\qmake_QtQuick_Studio_MultiText.qrc
_deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp: _deps\ds-build\src\imports\multitext\.rcc\QuickStudioMultiText_raw_qml_0.qrc
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating .rcc/qmlcache/QuickStudioMultiText_qmlcache_loader.cpp"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	call ..\..\..\..\..\.qt\bin\qt_setup_tool_path.bat C:/msys64/mingw64/share/qt6/bin/qmlcachegen.exe --resource-name qmlcache_QuickStudioMultiText --resource C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/multitext/.rcc/qmake_QtQuick_Studio_MultiText.qrc --resource C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/multitext/.rcc/QuickStudioMultiText_raw_qml_0.qrc -o C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/multitext/.rcc/qmlcache/QuickStudioMultiText_qmlcache_loader.cpp @C:/qtProjects/build-testquick-6_6_0_mingw_shared-Debug/_deps/ds-build/src/imports/multitext/.rcc/qmlcache/QuickStudioMultiText_qml_loader_file_list.rsp
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.obj: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\flags.make
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.obj: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\includes_CXX.rsp
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.obj: _deps\ds-build\src\imports\multitext\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.obj: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object _deps/ds-build/src/imports/multitext/CMakeFiles/QuickStudioMultiText_qmlcache.dir/QuickStudioMultiText_qmlcache_autogen/mocs_compilation.cpp.obj"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.obj -MF CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.obj.d -o CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.obj -c C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/QuickStudioMultiText_qmlcache.dir/QuickStudioMultiText_qmlcache_autogen/mocs_compilation.cpp.i"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp > CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.i
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/QuickStudioMultiText_qmlcache.dir/QuickStudioMultiText_qmlcache_autogen/mocs_compilation.cpp.s"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp -o CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.s
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.obj: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\flags.make
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.obj: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\includes_CXX.rsp
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.obj: _deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.obj: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object _deps/ds-build/src/imports/multitext/CMakeFiles/QuickStudioMultiText_qmlcache.dir/.rcc/qmlcache/QuickStudioMultiText_qmlcache_loader.cpp.obj"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.obj -MF CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.obj.d -o CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.obj -c C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/QuickStudioMultiText_qmlcache.dir/.rcc/qmlcache/QuickStudioMultiText_qmlcache_loader.cpp.i"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp > CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.i
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/QuickStudioMultiText_qmlcache.dir/.rcc/qmlcache/QuickStudioMultiText_qmlcache_loader.cpp.s"
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp -o CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.s
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug

QuickStudioMultiText_qmlcache: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\QuickStudioMultiText_qmlcache_autogen\mocs_compilation.cpp.obj
QuickStudioMultiText_qmlcache: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp.obj
QuickStudioMultiText_qmlcache: _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\build.make
.PHONY : QuickStudioMultiText_qmlcache

# Rule to build all files generated by this target.
_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\build: QuickStudioMultiText_qmlcache
.PHONY : _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\build

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\clean:
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext
	$(CMAKE_COMMAND) -P CMakeFiles\QuickStudioMultiText_qmlcache.dir\cmake_clean.cmake
	cd C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug
.PHONY : _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\clean

_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\depend: _deps\ds-build\src\imports\multitext\.rcc\qmlcache\QuickStudioMultiText_qmlcache_loader.cpp
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles JOM" C:\qtProjects\testquick C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-src\src\imports\multitext C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext C:\qtProjects\build-testquick-6_6_0_mingw_shared-Debug\_deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps\ds-build\src\imports\multitext\CMakeFiles\QuickStudioMultiText_qmlcache.dir\depend


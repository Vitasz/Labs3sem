file(REMOVE_RECURSE
  "../../qml/testquick/Constants.qml"
  "../../qml/testquick/DirectoryFontLoader.qml"
  "../../qml/testquick/EventListModel.qml"
  "../../qml/testquick/EventListSimulator.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/testquick_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()

file(REMOVE_RECURSE
  "../qml/content/App.qml"
  "../qml/content/LabButton.ui.qml"
  "../qml/content/MyLr1.ui.qml"
  "../qml/content/Screen01.ui.qml"
  "../qml/content/fonts/Inter-Black.ttf"
  "../qml/content/fonts/Inter-Bold.ttf"
  "../qml/content/fonts/Inter-ExtraBold.ttf"
  "../qml/content/fonts/Inter-ExtraLight.ttf"
  "../qml/content/fonts/Inter-Light.ttf"
  "../qml/content/fonts/Inter-Medium.ttf"
  "../qml/content/fonts/Inter-Regular.ttf"
  "../qml/content/fonts/Inter-SemiBold.ttf"
  "../qml/content/fonts/Inter-Thin.ttf"
  "../qml/content/fonts/Inter-VariableFont_slnt,wght.ttf"
  "../qml/content/fonts/fonts.txt"
  "../qml/content/images/Menu_icon.svg"
  "../qml/content/images/c++ico.png"
  "../qml/content/images/lab2.png"
  "../qml/content/images/lab3.png"
  "../qml/content/images/lab4.png"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/content_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()

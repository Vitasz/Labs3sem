import QtQuick
import QtQuick.Window
import QtQuick.Controls

import "Lab1"
import "Lab2"

ApplicationWindow {
    visible: true
    width: 1366
    height: 768
    color: "white"
    //visibility: Window.FullScreen
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width
    flags: Qt.Window
    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: MainScreen {
        }
    }
}

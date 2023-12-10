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
        pushEnter: Transition {
                id: pushEnter
                ParallelAnimation {
                    PropertyAction { property: "x"; value: pushEnter.ViewTransition.item.pos }
                    NumberAnimation { properties: "y"; from: pushEnter.ViewTransition.item.pos + stackView.offset; to: pushEnter.ViewTransition.item.pos; duration: 400; easing.type: Easing.OutCubic }
                    NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 400; easing.type: Easing.OutCubic }
                }
            }
        initialItem: MainScreen {
        }
    }
}

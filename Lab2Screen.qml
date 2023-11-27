import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

//import testquick
//import QtCharts
Page {
    id: main
    width: 1920
    height: 1024
    visible: true
   // color: "#ffffff"


    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 91
        height: 1024
        anchors.left: parent.left
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#106697"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
            orientation: Gradient.Vertical
        }
        transformOrigin: Item.Left

        Image {
            id: menuicon
            x: 24
            width: 43
            height: 34
            source: "images/Menu_icon.svg"
            anchors.topMargin: 30
            z: 1
            anchors.top: parent.top
            transformOrigin: Item.Top
            fillMode: Image.PreserveAspectFit
        }

    }
}

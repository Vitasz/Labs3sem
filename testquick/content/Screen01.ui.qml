

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts

//import testquick
Rectangle {
    id: main
    width: 1920
    height: 1024

    color: Constants.backgroundColor
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
            y: 30
            width: 43
            height: 34
            source: "images/Menu_icon.svg"
            z: 1
            transformOrigin: Item.Top
            fillMode: Image.PreserveAspectFit
        }
    }

    ScrollView {
        id: scrollView
        x: 200
        y: 0

        clip: true
        height: main.height - y
        width: main.width - x
        ColumnLayout {
            id: columnLayout

            spacing: 30

            Text {
                id: text1
                text: qsTr("Лабораторные работы 3 семестра.")
                font.pixelSize: 50
                topPadding: 30
                transformOrigin: Item.Top
                font.family: "Inter Black"
                font.styleName: "Black"
            }

            GridLayout {
                id: gridLayout
                anchors.top: text1.bottom
                transformOrigin: Item.Center
                rowSpacing: 45
                columnSpacing: 60
                columns: 3
                anchors.topMargin: 30

                MyLr1 {
                    id: lr1

                    iconPath: "images/c++ico.png"
                    labName: "Лабораторная работа №1"
                    shortInfo1: "<html><ul><li>Smart Pointer</li><li>Unique Pointer</li></html>"
                    shortInfo2: "<html><ul><li>Shared Pointer</li><li>MemorySpan</li></html>"
                }

                MyLr1 {
                    id: lr2

                    iconPath: "images/lab2.png"
                    labName: "Лабораторная работа №2"
                    shortInfo1: "<html><ul><li>Quick sort</li><li>Selection sort</li></html>"
                    shortInfo2: "<html><ul><li>Radix sort</li><li>Shell sort</li></html>"
                }

                MyLr1 {
                    id: lr3

                    iconPath: "images/lab3.png"
                    labName: "Лабораторная работа №3"
                    shortInfo1: "<html><ul><li>Dictionary</li><li>Search tree</li></html>"
                    shortInfo2: "<html><ul><li>Minimax</li><li>Data search</li></html>"
                }

                MyLr1 {
                    id: lr4

                    iconPath: "images/lab4.png"
                    labName: "Лабораторная работа №4"
                    shortInfo1: "<html><ul><li>Graphs</li><li>Coloring</li></html>"
                    shortInfo2: "<html><ul><li>Pathfinding</li><li>Priority queue</li></html>"
                }
            }
        }
    }
}

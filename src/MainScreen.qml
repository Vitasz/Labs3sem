import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

//import testquick
//import QtCharts
import "Lab1"
Page  {
    id: main


    visible: true
    //color: "#ffffff"

    ScrollView {
        id: scrollView
        x: 200
        y: 0

        clip: false
        height: main.height - y
        width: main.width - x
        ColumnLayout {
            id: columnLayout
            clip: false
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
                visible: true
                smooth: true
                clip: false

                rowSpacing: 45
                columnSpacing: 60


                //anchors.topMargin: 30
                LabCard {
                    id: lr1
                    Layout.leftMargin: 50

                    iconPath: "images/images/lab1.png"
                    labName: "Лабораторная работа №1"
                    shortInfo1: "<html><ul><li>Smart Pointer</li><li>Unique Pointer</li></html>"
                    shortInfo2: "<html><ul><li>Shared Pointer</li><li>MemorySpan</li></html>"
                    labLoad: "qrc:/Lab1/Lab1Screen.qml"
                }
                LabCard {
                    id: lr2

                    iconPath: "images/images/lab2.png"
                    labName: "Лабораторная работа №2"
                    shortInfo1: "<html><ul><li>Quick sort</li><li>Selection sort</li></html>"
                    shortInfo2: "<html><ul><li>Radix sort</li><li>Shell sort</li></html>"
                    labLoad: "qrc:/Lab2/Lab2Screen.qml"
                }

                LabCard {
                    id: lr3

                    iconPath: "images/images/lab3.png"
                    labName: "Лабораторная работа №3"
                    shortInfo1: "<html><ul><li>Dictionary</li><li>Search tree</li></html>"
                    shortInfo2: "<html><ul><li>Minimax</li><li>Data search</li></html>"
                    labLoad: "qrc:/Lab3/Lab3Screen.qml"
                }

                LabCard {
                    id: lr4
                    Layout.leftMargin: 50
                    iconPath: "images/images/lab4.png"
                    labName: "Лабораторная работа №4"
                    shortInfo1: "<html><ul><li>Graphs</li><li>Coloring</li></html>"
                    shortInfo2: "<html><ul><li>Pathfinding</li><li>Priority queue</li></html>"
                    labLoad: "qrc:/Lab4/Lab4Screen.qml"
                }


            }
        }
    }

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

    }


}

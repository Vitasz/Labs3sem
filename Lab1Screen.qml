import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
//import testquick
import "qrc:/../images"
Page {
    id: main
    width: 1366
    height: 768
    visible: true
    //color: "#ffffff"


    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 91
        height: parent.height
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
            source: "qrc:/images/images/Menu_icon.svg"
            anchors.topMargin: 30
            z: 1
            anchors.top: parent.top
            transformOrigin: Item.Top
            fillMode: Image.PreserveAspectFit

        }

    }

    Item{
        id: itminfo
        visible: true
        anchors.left: rectangle.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 30
        anchors.topMargin: 30
        anchors.leftMargin: 30
        anchors.bottom: parent.bottom

        ScrollView {
            id: scrollView
            visible: true
            anchors.fill: itminfo

            //contentWidth:  itminfo.width
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff
            contentHeight: column.height+50

            ColumnLayout {
                id: column
                x: 0
                y: 0
                width: 1206
                spacing: 30
                visible: true
                clip: false
                Item {
                    id: item2
                    height: main.height-50
                    visible: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                    Shape{
                        id: mainShape
                        width: 800; height: 700;
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        ShapePath{

                            startX: 0
                            startY: mainShape.height
                            PathLine {
                                x: 525; y: mainShape.height
                            }
                            PathLine{
                                x: 850;
                                y: 0;
                            }
                            capStyle: ShapePath.SquareCap
                            joinStyle: ShapePath.RoundJoin
                            strokeWidth: 20 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            fillColor: "transparent"
                        }

                        Text{
                            y: 824
                            property string link: "https://onedrive.live.com/?authkey=%21AAEcehJrYtdi4w8&cid=187CCF51BB4995EC&id=187CCF51BB4995EC%2185691&parId=187CCF51BB4995EC%2185682&o=OneUp"
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            ///anchors.leftMargin: 236
                            anchors.bottomMargin: 10
                            anchors.rightMargin: 150
                            anchors.right: mainShape.right

                            text: "Задание: <a
                            href='" + link+"'>useless_file.pdf</a>"
                            anchors.left: parent.left
                            anchors.bottom: parent.bottom
                            onLinkActivated: Qt.openUrlExternally(link)
                            font.letterSpacing: 2
                            font.pixelSize: 30
                            font.styleName: "Black"
                            font.family: "Inter Light"
                        }
                    }

                    ColumnLayout{
                        y: 499
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenterOffset: -11
                        spacing: 5
                        Text{
                            id: title
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter

                            text: qsTr("Лабораторная работа №1")
                            font.pixelSize: 50
                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                        Text{
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Умные указатели.")
                            font.letterSpacing: 15
                            font.pixelSize: 30
                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }

                    }

                    ColumnLayout{
                        anchors.left: mainShape.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        layoutDirection: Qt.LeftToRight
                        anchors.leftMargin: -125
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        clip: false

                        MainButton{
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            width: 300
                            bttnText: "Информация"

                        }

                        MainDottedLine{
                            width: 400
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        }

                        MainButton{
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            scrollTo: real.y
                            width: 410
                            bttnText: "Реализация"
                        }
                        MainDottedLine{
                            width: 510
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        }
                        MainButton{
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            width: 520
                            bttnText: "Тестирование"
                        }
                    }

                }
                ColumnLayout {
                    id: info
                    height: main.height - 50
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    spacing: 20
                    Text{
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Краткая информация")
                        horizontalAlignment: Text.AlignHCenter
                        font.letterSpacing: 2
                        font.pixelSize: 30
                        font.styleName: "Black"
                        font.family: "Inter Light"
                    }
                    Shape{
                        id: lineinfo
                        Layout.fillWidth: true
                        ShapePath{
                            startX: 0; startY: 0
                            PathLine {
                                x: lineinfo.width; y: 0
                            }
                            fillColor: "transparent"
                            capStyle: ShapePath.SquareCap
                            joinStyle: ShapePath.RoundJoin
                            strokeWidth: 2 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            strokeStyle: ShapePath.DashLine
                            //capStyle: ShapePath.RoundCap
                            dashPattern: [1, 3] // Set the dash pattern for a dotted line
                        }
                    }
                }
                ColumnLayout {
                    id: real
                    height: main.height - 50
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    spacing: 20
                    Text{
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Реализация")
                        horizontalAlignment: Text.AlignHCenter
                        font.letterSpacing: 2
                        font.pixelSize: 30
                        font.styleName: "Black"
                        font.family: "Inter Light"
                    }
                    Shape{
                        id: linereal
                        Layout.fillWidth: true
                        ShapePath{
                            startX: 0; startY: 0
                            PathLine {
                                x: linereal.width; y: 0
                            }
                            fillColor: "transparent"
                            capStyle: ShapePath.SquareCap
                            joinStyle: ShapePath.RoundJoin
                            strokeWidth: 2 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            strokeStyle: ShapePath.DashLine
                            //capStyle: ShapePath.RoundCap
                            dashPattern: [1, 3] // Set the dash pattern for a dotted line
                        }
                    }
                    ColumnLayout {

                        visible: true
                        smooth: true
                        clip: false
                        spacing: 10
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        RowLayout{
                            visible: true
                            smooth: true
                            clip: false
                            spacing: 10
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignHCenter
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "Smart Pointer"
                                className: "SmrtPtr"
                            }
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "Unique Pointer"
                                className: "UnqPtr"
                            }
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "Shared Pointer"
                                className: "ShrdPtr"
                            }

                        }

                        RowLayout{
                            visible: true
                            smooth: true
                            clip: false
                            spacing: 10
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignHCenter
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "Memory Span"
                                className: "MemorySpan"
                            }
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "MS Pointer"
                                className: "MSPtr"
                            }

                        }



                    }
                }
                ColumnLayout {
                    id: tests
                    height: main.height - 50
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    spacing: 20
                    Text{
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Тестирование")
                        horizontalAlignment: Text.AlignHCenter
                        font.letterSpacing: 2
                        font.pixelSize: 30
                        font.styleName: "Black"
                        font.family: "Inter Light"
                    }
                    Shape{
                        id: linetests
                        Layout.fillWidth: true
                        ShapePath{
                            startX: 0; startY: 0
                            PathLine {
                                x: linetests.width; y: 0
                            }
                            fillColor: "transparent"
                            capStyle: ShapePath.SquareCap
                            joinStyle: ShapePath.RoundJoin
                            strokeWidth: 2 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            strokeStyle: ShapePath.DashLine
                            //capStyle: ShapePath.RoundCap
                            dashPattern: [1, 3] // Set the dash pattern for a dotted line
                        }
                    }
                }
            }
        }
    }

}


import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
//import testquick
import "qrc:/../images"
Page {
    id: main
    width: 1920
    //height: 1024

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
            source: "images/Menu_icon.svg"
            anchors.topMargin: 30
            z: 1
            anchors.top: parent.top
            transformOrigin: Item.Top
            fillMode: Image.PreserveAspectFit

        }

    }
    ScrollView {
        id: scrollView
        anchors.left: rectangle.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.leftMargin: 25
        anchors.rightMargin: 50
        width: parent.width
        clip: false
        height: main.height - y
        ColumnLayout{
            anchors.fill: parent
            anchors.rightMargin: -320
            anchors.horizontalCenter: parent.horizontalCenter
           // Layout.fillWidth: true
            //width: 1809
            //height: 737
            //anchors.rightMargin: -3
            //anchors.bottomMargin: 0
            //anchors.rightMargin: 0
            //margins: 3
            /*Item{
                id: item1
                anchors.fill: parent
                ColumnLayout{
                    x: 30
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 5
                    Text{
                        id: title
                         Layout.alignment: Qt.AlignCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        text: qsTr("Лабораторная работа №1")
                        font.pixelSize: 60
                        font.styleName: "Black"
                        font.family: "Inter Black"
                    }
                    Text{
                        Layout.alignment: Qt.AlignCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Умные указатели.")
                        font.letterSpacing: 15
                        font.pixelSize: 40
                        font.styleName: "Black"
                        font.family: "Inter Black"
                    }

                }

                Shape{
                    id: mainShape
                    x: 0; y: 0;
                    width: 1000; height: main.height/10*9;
                    ShapePath{

                        startX: 0
                        startY: mainShape.height
                        PathLine {
                            x: 650; y: mainShape.height
                        }
                        PathLine{
                            x: 1000;
                            y: 0;
                        }
                        capStyle: ShapePath.SquareCap
                        joinStyle: ShapePath.RoundJoin
                        strokeWidth: 20 // Adjust the width of the separator as needed
                        strokeColor: "black"
                        fillColor: "transparent"
                    }
                }
                Text{
                    x: 205;
                    y: mainShape.height-100
                    property string link: "https://onedrive.live.com/?authkey=%21AAEcehJrYtdi4w8&cid=187CCF51BB4995EC&id=187CCF51BB4995EC%2185691&parId=187CCF51BB4995EC%2185682&o=OneUp"
                    Layout.alignment: Qt.AlignCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Задание: <a
                            href='" + link+"'>useless_file.pdf</a>"
                    onLinkActivated: Qt.openUrlExternally(link)
                    font.letterSpacing: 2
                    font.pixelSize: 30
                    font.styleName: "Black"
                    font.family: "Inter Light"
                }

                ColumnLayout{
                    height: mainShape.height
                    anchors.right: parent.right
                    anchors.top: parent.top - 30;
                    clip: false

                    MainButton{
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        width: 300
                        bttnText: "Информация"
                    }

                    MainDottedLine{
                        width: 416
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    }

                    MainButton{
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        width: 428
                        bttnText: "Реализация"
                    }
                    MainDottedLine{
                        width: 544
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    }
                    MainButton{
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        width: 556
                        bttnText: "Тестирование"
                    }
                }
            }
*/
            ColumnLayout{
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillWidth: true
                Text{
                    text: qsTr("Краткая информация")
                    Layout.alignment: Qt.AlignCenter


                    font.letterSpacing: 2
                }

            }
        }

    }

}


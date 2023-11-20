import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts

//import testquick
Item {
    id: itm
    width: 418
    height: 495

    property string iconPath: "images/c++ico.png"
    property string labName: "Лабораторная работа"
    property string shortInfo1: "<html><ul><li>Smart Pointer</li><li>Unique Pointer</li></html>"
    property string shortInfo2: "<html><ul><li>Shared Pointer</li><li>MemorySpan</li></html>"

    Rectangle {
        id: rectangle1
        width: 418
        height: 495
        radius: 20
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

        ColumnLayout {
            id: columnLayout1
            width: parent.width
            height: parent.height
            Image {
                id: ico
                source: itm.iconPath
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                transformOrigin: Item.Center
                fillMode: Image.PreserveAspectFit
            }

            ColumnLayout {
                id: columnLayout
                width: parent.width
                anchors.top: ico.bottom
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                anchors.topMargin: 40
                spacing: 20

                Text {
                    id: text2
                    color: "#ffffff"
                    text: itm.labName
                    font.pixelSize: 30
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.styleName: "Black"
                    font.family: "Inter Black"
                }

                RowLayout {
                    id: rowLayout
                    spacing: 20
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    Text {
                        id: text3
                        color: "#ffffff"
                        text: shortInfo1
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignLeft
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        fontSizeMode: Text.HorizontalFit
                        leftPadding: -20
                        font.styleName: "Black"
                        font.family: "Inter"
                    }

                    Text {
                        id: text4
                        color: "#ffffff"
                        text: shortInfo2
                        font.pixelSize: 20
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        fontSizeMode: Text.HorizontalFit
                        leftPadding: -20
                        font.family: "Inter Black"
                        font.styleName: "Black"
                    }
                }

                LabButton {
                    id: labButton
                    width: 244
                    height: 49
                    anchors.bottom: parent.bottom
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    anchors.bottomMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}

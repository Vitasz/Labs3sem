import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
//import testquick
//import QtCharts
Page {
    id: main
    //width: 1920
    //height: 1024

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
    ScrollView {
        id: scrollView
        anchors.left: rectangle.right
        anchors.leftMargin: 20
        clip: false
        height: main.height - y
        width: main.width - x
        ColumnLayout{
            anchors.fill: parent
            //margins: 3
            Item{
                id: item1
                anchors.fill: parent
                //width: 1465;
                //height: 984;
                ColumnLayout{
                    //x: 800;
                    //y: 105;
                    //width: 707;
                    height: 867;
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 10
                    clip: false

                    Shape{
                        id: shape
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        width: 405
                        height: 237
                        Layout.rightMargin: 20

                        ShapePath {

                            strokeWidth: 10
                            strokeColor: "black"
                            fillColor: "white"

                            startX: 405; startY: 0
                            PathLine{ x: 105; y: 0;  }
                             PathLine{ x: 0; y: 237 }
                             PathLine{ x: 405; y: 237 }
                            PathLine{ x: 405; y: 0 }
                        }
                        Text {
                            //anchors.fill: parent

                            id: text2
                            color: "#000000"
                            text: qsTr("Информация")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            anchors.rightMargin: 30
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                    }
                    Shape{
                        height: 3
                        anchors.left: parent
                        anchors.right: parent
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        ShapePath{
                            startX: 0
                            startY: 0
                            PathLine {
                                x: parent.width
                                y: 0
                            }

                            strokeWidth: 2 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            //capStyle: ShapePath.RoundCap
                            dashPattern: [1, 1] // Set the dash pattern for a dotted line
                        }
                    }

                    Shape{
                        //id: shape
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        width: 405
                        height: 237
                        Layout.rightMargin: 20

                        ShapePath {

                            strokeWidth: 10
                            strokeColor: "black"
                            fillColor: "white"

                            startX: 405; startY: 0
                            PathLine{ x: 105; y: 0;  }
                             PathLine{ x: 0; y: 237 }
                             PathLine{ x: 405; y: 237 }
                            PathLine{ x: 405; y: 0 }
                        }
                        Text {
                            //anchors.fill: parent

                            //id: text2
                            color: "#000000"
                            text: qsTr("Информация")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            anchors.rightMargin: 30
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                    }
                    Shape{
                        //id: shape
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        width: 405
                        height: 237
                        Layout.rightMargin: 20

                        ShapePath {

                            strokeWidth: 10
                            strokeColor: "black"
                            fillColor: "white"

                            startX: 405; startY: 0
                            PathLine{ x: 105; y: 0;  }
                             PathLine{ x: 0; y: 237 }
                             PathLine{ x: 405; y: 237 }
                            PathLine{ x: 405; y: 0 }
                        }
                        Text {
                            //anchors.fill: parent

                            //id: text2
                            color: "#000000"
                            text: qsTr("Информация")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            font.pixelSize: 40
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            anchors.rightMargin: 30
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                    }
                }
            }
        }
    }

}

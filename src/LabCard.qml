import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item {
    id: itm
    width: 420
    height: 470

    property string iconPath: "images/c++ico.png"
    property string labName: "Лабораторная работа"
    property string shortInfo1: "<html><ul><li>Smart Pointer</li><li>Unique Pointer</li></html>"
    property string shortInfo2: "<html><ul><li>Shared Pointer</li><li>MemorySpan</li></html>"
    property string labLoad: "Lab1Screen.qml"
    transform: Scale{
        id: itmscale
        origin.x: itm.width/2
        origin.y: itm.height/2
        xScale: 1; yScale: 1
        Behavior on xScale{
            SmoothedAnimation{
                velocity: 1
            }
        }
        Behavior on yScale{
            SmoothedAnimation{
                velocity: 1
            }
        }
    }

    Rectangle {
        id: rect
        width: parent.width-20
        height: parent.height-20
        radius: 20
        anchors.centerIn: parent
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

                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                spacing: 20

                Text {
                    id: text2
                    color: "#ffffff"
                    text: itm.labName
                    font.pixelSize: 30
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

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
            }
        }
        transform: Rotation {
            id: rectRotation
            axis.x: 1
            axis.y: 0
            axis.z: 0
            origin.x: rect.width / 2
            origin.y: rect.height / 2
            origin.z: 0
            angle: 0 // Initial angle

            Behavior on angle{
                SmoothedAnimation{
                    velocity: 100
                }
            }

        }
        BrightnessContrast {
            id: brightness
            anchors.fill: parent
            source: parent
            brightness: 0
            contrast: 0
            Behavior on brightness{
                SmoothedAnimation{
                    velocity: 100
                }
            }
        }

    }

    MouseArea {
        anchors.fill: parent
        onPositionChanged: (mouse) => {
                               var centerX = parent.width / 2;
                               var centerY = parent.height / 2;


                               if (mouse.x > centerX && mouse.y < centerY ||
                                   mouse.x < centerX && mouse.y > centerY){
                                   rectRotation.axis.y = 1
                               }
                               else{
                                   rectRotation.axis.y = -1
                               }

                               var maxAngle = 20;
                               var angle = (Math.abs(mouse.x - centerX) + Math.abs(mouse.y-centerY))*maxAngle/
                               (centerX + centerY);
                               if (mouse.x < centerX && mouse.y > centerY||
                                   mouse.x > centerX && mouse.y > centerY){
                                   angle*=-1;
                               }
                               rectRotation.angle = angle;
                               brightness.contrast = (mouse.y-centerY) / centerY*maxAngle/300;
                               brightness.brightness = -(mouse.y-centerY) / centerY*maxAngle/300;
                           }
        onExited: {
            rectRotation.angle = 0;
            brightness.contrast = 0
            brightness.brightness = 0
            itmscale.xScale = itmscale.yScale = 1
        }
        onEntered:{
            itmscale.xScale = itmscale.yScale = 1.2
        }
        onClicked: {
            stackView.push(labLoad)
        }

        hoverEnabled: true
    }
    Loader{
        id:ld;
        anchors.fill: parent;
    }
}

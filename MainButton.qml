import QtQuick
import QtQuick.Shapes

Shape{
    id: shape
    width: 300
    height: 237
    property string bttnText: ""
    ShapePath {
        id: shapepath
        //anchors.right: parent
        strokeWidth: 5
        strokeColor: "#03053C"
        fillColor: "white"

        startX: 0; startY: 0
        PathLine{ x: -105; y: 237 }
        PathLine{ x: shape.width; y: 237 }
        PathLine{ x: shape.width; y: 0 }
        PathLine{ x: 0; y: 0;  }

        Behavior on fillColor {

            ColorAnimation {
                duration: 200
            }
        }
    }

    Text {
        id: text
        color: "#000000"
        text: qsTr(bttnText)
        anchors.centerIn: parent;

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.letterSpacing: 6
        font.pixelSize: 40
        font.styleName: "Black"
        font.family: "Inter Black"
    }
    MouseArea {
        anchors.fill: shape
        hoverEnabled: true

        onEntered: {
            shapepath.fillColor = "#03053C"
            shapepath.strokeColor = "transparent"
            text.color = "#ffffff"
        }

        onExited: {
            shapepath.fillColor = "white"
            shapepath.strokeColor = "#03053C"
            text.color = "#000000"
        }
        cursorShape: Qt.PointingHandCursor
    }
}

import QtQuick
import QtQuick.Shapes

Shape{
    id: shape
    width: 300
    height: 200
    property string bttnText: ""
    property int scrollTo: 0
    property string backgroundColor: "white"
    ShapePath {
        id: shapepath
        //anchors.right: parent
        strokeWidth: 5
        strokeColor: "#03053C"
        fillColor: backgroundColor

        startX: 0; startY: 0
        PathLine{ x: -90; y: 200 }
        PathLine{ x: shape.width; y: 200 }
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

        font.letterSpacing: 2
        font.pixelSize: 40
        font.styleName: "Black"
        font.family: "Inter Black"
    }
    MouseArea {
        id: mousearea
        anchors.fill: shape
        hoverEnabled: true

        onEntered: {
            shapepath.fillColor = "#03053C"
            shapepath.strokeColor = "transparent"
            text.color = "#ffffff"
        }

        onExited: {
            shapepath.fillColor = backgroundColor
            shapepath.strokeColor = "#03053C"
            text.color = "#000000"
        }
        onClicked: {
            scrollView.contentItem.contentY = scrollTo
        }
        cursorShape: Qt.PointingHandCursor
    }
}

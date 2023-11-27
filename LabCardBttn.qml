import QtQuick 6.2


Item {
    id: itm
    width: 200
    height: 100

    property string color: "#ffffff"
    property string colorHovered: "#d2d2d2"
    property int radius: 20
    Rectangle {
        id: rctng
        width: itm.width
        height: itm.height

        color: "#ffffff"
        radius: itm.radius

        Text {
            color: "#000000"
            text: qsTr("Подробнее")
            width: itm.width
            height: itm.height
            opacity: 1
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            z: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
            font.pointSize: 20
            font.family: "Inter"
        }
    }
    MouseArea {
        id: msar
        width: itm.width
        height: itm.height
        hoverEnabled: true
        onEntered: rctng.color = itm.colorHovered
        onExited: rctng.color = itm.color
    }
}

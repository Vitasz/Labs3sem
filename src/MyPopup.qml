import QtQuick 6.2
import QtQuick.Controls

Popup {
    id: popup
    width: 100;
    height: 50;
    modal: true

    anchors.centerIn: Overlay.overlay
    property string myText: ""
    Text {
        text: myText
        anchors.centerIn: parent
    }
}

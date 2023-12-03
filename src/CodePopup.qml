import QtQuick 6.2
import QtQuick.Controls

Popup {
    id: popup
    modal: true
    anchors.centerIn: Overlay.overlay

    property string code: "Test"
    FontLoader {
        id: localFontRegular
        source: "qrc:/fonts/fonts/AzeretMono-Light.ttf"
    }
    Rectangle{
        anchors.centerIn: parent
        width: Window.width-100
        height: Window.height-100
        color: "black"
        radius: 20
        gradient: Gradient {
            GradientStop {
                position: 1
                color: "#ffffff"
            }

            GradientStop {
                position: 0
                color: "#ffffff"
            }
            orientation: Gradient.Vertical
        }
        ScrollView{
            anchors.fill: parent;
            anchors.margins: 20
            Text{
                textFormat: TextEdit.RichText
                text: code
                font.pixelSize: 15
                font.family: localFontRegular.font.family
                font.weight: localFontRegular.font.weight
                font.styleName: localFontRegular.font.styleName

            }
        }
    }
}

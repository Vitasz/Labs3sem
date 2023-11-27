import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects

Window {
    id: root
    width: 500
    height: 500
    visible: true
    Rectangle {
        id: rect
        width: 200;
        height: 200
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: "#ff0000"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
        anchors.centerIn: parent

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
                    duration: 250
                }
            }

        }
         BrightnessContrast {
            id: brightness
            anchors.fill: parent
            source: parent
            brightness: 0
            Behavior on brightness{
                SmoothedAnimation{
                    duration: 250
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
                brightness.brightness = -(mouse.y-centerY) / centerY*maxAngle/100;
            }
            onExited: {
                rectRotation.angle = 0;
                brightness.brightness = 0
            }

            hoverEnabled: true
        }



    }

}

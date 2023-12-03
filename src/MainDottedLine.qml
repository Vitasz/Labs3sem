import QtQuick
import QtQuick.Shapes

Shape{
    id: shape
    height: 3
    width: 416
    ShapePath{
        startX: 0
        startY: 0
        PathLine {
            x: shape.width
            y: 0
        }

        strokeWidth: 3 // Adjust the width of the separator as needed
        strokeColor: "#03053C"
        strokeStyle: ShapePath.DashLine
        //capStyle: ShapePath.RoundCap
        dashPattern: [1, 3] // Set the dash pattern for a dotted line
    }
}

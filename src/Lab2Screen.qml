import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 600
    height: 400
    title: "Sorting Visualizer"

    Rectangle {
        id: mainRect
        anchors.fill: parent

        property var array: []

        function swapElements(index1, index2) {
            // Swap array elements
            var temp = mainRect.array[index1];
            mainRect.array[index1] = mainRect.array[index2];
            mainRect.array[index2] = temp;

            repeater.model = mainRect.array;
        }

        function generateRandomArray() {
            // Generate a new random array
            mainRect.array = [];
            colorArray = []; // New array to store colors
            for (var i = 0; i < 50; i++) {
                mainRect.array.push(Math.floor(Math.random() * 100) + 1);
                colorArray.push("steelblue");
            }

            repeater.model = mainRect.array;
        }

        Timer {
            id: timer
            interval: 100
            repeat: false
        }

        function delay(delayTime, cb) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.start();
        }

        property var colorArray: [] // Array to store colors

        Repeater {
            id: repeater
            model: mainRect.array.length
            Rectangle {
                width: mainRect.width/mainRect.array.length
                height: mainRect.array[index] * 4
                color: mainRect.colorArray[index] // Use the color from the array
                border.color: "black"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: index * (width)
            }
        }

        function bubbleSort() {
            var i = 0;
            var j = 0;

            function performSwap() {
                if (mainRect.array[j] > mainRect.array[j + 1]) {
                    // Change the color before swapping
                    colorArray[j] = "red"; // Set the color to red for the first rectangle
                    colorArray[j + 1] = "red"; // Set the color to red for the second rectangle

                    mainRect.swapElements(j, j + 1);
                    colorArray[j] = "steelblue";
                    colorArray[j + 1] = "steelblue";

                    return;
                }
                j++;
                if (j >= mainRect.array.length - 1 - i) {
                    j = 0;
                    i++;
                    if (i >= mainRect.array.length - 1) {
                        repeater.model = mainRect.array

                        // Sorting completed
                        return;
                    }
                }

                delay(1000, function(){
                    timer.stop();
                    performSwap();

                });
            }

            // Start the sorting process
            performSwap();
        }

        RowLayout {
            spacing: 10
            Button {
                id: srtButton
                text: "Sort"
                onClicked: mainRect.bubbleSort();
            }

            Button {
                id: genButton
                text: "Generate New Array"
                anchors.leftMargin: 0
                onClicked: mainRect.generateRandomArray();
            }
        }
    }
}

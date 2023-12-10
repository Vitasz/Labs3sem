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
        property int arraySize: 100
        property bool isSorting: false
        function swapElements(index1, index2) {
            // Swap array elements
            var temp = mainRect.array[index1]
            mainRect.array[index1] = mainRect.array[index2]
            mainRect.array[index2] = temp
            mainRect.colorArray[index1] = "red"
            mainRect.colorArray[index2] = "red"
            repeater.model = mainRect.array
        }

        function generateRandomArray() {
            console.log(mainRect.isSorting)
            // Generate a new random array
            if (mainRect.isSorting)
                return
            mainRect.array = []
            mainRect.colorArray = [] // New array to store colors
            for (var i = 0; i < arraySize; i++) {
                mainRect.colorArray.push("steelblue")
                mainRect.array.push(Math.floor(Math.random() * 100) + 1)
            }

            repeater.model = mainRect.array
        }

        function delay(delayTime, cb) {
            timer.interval = delayTime
            timer.repeat = false
            timer.triggered.connect(cb)
            timer.start()
        }

        property var colorArray: [] // Array to store colors

        Repeater {
            id: repeater
            model: mainRect.array.length
            Rectangle {
                width: mainRect.width / mainRect.array.length
                height: mainRect.array[index] * (mainRect.height-20)/100
                color: mainRect.colorArray[index] // Use the color from the array
                border.color: "black"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: index * (width)
            }
        }

        // Bubble Sort Algorithm
        function bubbleSort() {
            if (mainRect.isSorting)
                return
            mainRect.isSorting = true
            var n = mainRect.array.length
            var i = 0
            var j = 0
            var originalArray = mainRect.array.slice()
            var outertimer = Qt.createQmlObject(
                        'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                        mainRect)

            outertimer.triggered.connect(function () {
                if (i < n) {
                    var innertimer = Qt.createQmlObject(
                                'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                                mainRect)

                    innertimer.triggered.connect(function () {
                        if (j < n - i - 1) {
                            if (mainRect.array[j] > mainRect.array[j + 1]) {
                                // Swap elements
                                swapElements(j, j + 1)

                                // Emit signal to update the QML interface
                                sortStepSignal()
                                colorArray[j] = "steelblue"
                                colorArray[j + 1] = "steelblue"
                            }
                            j++
                        } else {
                            innertimer.stop()
                            i++
                            j = 0 // Reset inner loop counter for the next iteration
                        }
                    })
                } else {
                    var k = 0;
                    var endtimer = Qt.createQmlObject(
                                'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                                mainRect)
                    endtimer.triggered.connect(function () {
                        if (k < n-1){
                            if (mainRect.array[k] <= mainRect.array[k+1]){
                                repeater.itemAt(k).color = "green"
                                colorArray[k] = "green"
                            }
                            else{
                                repeater.itemAt(k).color = "red"
                                colorArray[k] = "red"
                            }
                            k++
                        }
                        else{
                            repeater.itemAt(k).color = "green"
                            colorArray[k] = "green"
                            outertimer.stop()
                            endtimer.stop();
                            mainRect.isSorting = false
                        }
                    })

                }
            })
        }

        // Quick Sort Algorithm
        function quickSort() {
            if (mainRect.isSorting)
                return
            mainRect.isSorting = true
            var isPartition = false
            var high = mainRect.array.length - 1
            var n = high+1
            var low = 0
            var stack = []
            stack.push(low)
            stack.push(high)

            var outertimer = Qt.createQmlObject(
                        'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                        mainRect)
            outertimer.triggered.connect(function () {
                if (stack.length > 0 && !isPartition) {
                    isPartition = true
                    var high = stack.pop()
                    var low = stack.pop()
                    var innertimer = Qt.createQmlObject(
                                'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                                mainRect)
                    var pivot = mainRect.array[high]
                    var i = low - 1
                    var j = low
                    //PARTITION
                    innertimer.triggered.connect(function () {
                        outertimer.stop()
                        if (j < high) {
                            if (mainRect.array[j] < pivot) {
                                ++i
                                swapElements(i, j)
                                sortStepSignal()
                                colorArray[i] = "steelblue"
                                colorArray[j] = "steelblue"
                                //arr.move(i, j);
                            }
                            j++
                        } else {
                            innertimer.stop()

                            isPartition = false
                            swapElements(i + 1, high)
                            colorArray[i + 1] = "steelblue"
                            colorArray[high] = "steelblue"
                            var pivotIndex = i + 1
                            if (pivotIndex - 1 > low) {
                                stack.push(low)
                                stack.push(pivotIndex - 1)
                            }

                            if (pivotIndex + 1 < high) {
                                stack.push(pivotIndex + 1)
                                stack.push(high)
                            }
                            repeater.model = mainRect.array
                            sortStepSignal()
                            outertimer.start()
                        }
                    })
                } else if (!isPartition) {
                    var k = 0;
                    var endtimer = Qt.createQmlObject(
                                'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                                mainRect)
                    endtimer.triggered.connect(function () {
                        if (k < n-1){
                            if (mainRect.array[k] <= mainRect.array[k+1]){
                                repeater.itemAt(k).color = "green"
                                colorArray[k] = "green"
                            }
                            else{
                                repeater.itemAt(k).color = "red"
                                colorArray[k] = "red"
                            }
                            k++
                        }
                        else{
                            outertimer.stop()
                            endtimer.stop();
                            repeater.itemAt(k).color = "green"
                            colorArray[k] = "green"

                            mainRect.isSorting = false
                        }
                    })
                }
            })
        }

        function shellSort() {
            if (mainRect.isSorting)
                return;

            mainRect.isSorting = true;
            var n = mainRect.array.length;
            var gap = Math.floor(n / 2);

            var i = 0;
            var outertimer = Qt.createQmlObject(
                'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                mainRect
            );
            var innerSort = false
            var innerinnerSort = false
            outertimer.triggered.connect(function () {
                if (innerSort) return
                if (gap > 0) {
                    innerSort = true
                    var innertimer = Qt.createQmlObject(
                        'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                        mainRect
                    );
                    var i = gap
                    innertimer.triggered.connect(function () {

                        if (innerinnerSort) return
                        if (i<n){
                            var temp = mainRect.array[i];
                            var j = i;

                            while (j >= gap && mainRect.array[j - gap] > temp) {
                                mainRect.array[j] = mainRect.array[j - gap];
                                colorArray[j] = "red"
                                j -= gap;

                                // You may want to call swapElements here to visualize the swaps
                                // swapElements(j, j - gap);
                            }

                            mainRect.array[j] = temp;
                            repeater.model = mainRect.array
                            // Emit signal to update the QML interface
                            sortStepSignal();
                            for(var k = 0; k < n; k++){
                                colorArray[k] = "steelblue"
                            }

                            i++
                        }
                        else{
                            gap = Math.floor(gap / 2);
                            innertimer.stop();
                            innerSort = false
                        }
                    });
                } else {
                    repeater.model = mainRect.array;
                    var k = 0;
                    var endtimer = Qt.createQmlObject(
                                'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                                mainRect)
                    endtimer.triggered.connect(function () {
                        if (k < n-1){
                            if (mainRect.array[k] <= mainRect.array[k+1]){
                                repeater.itemAt(k).color = "green"
                                colorArray[k] = "green"
                            }
                            else{
                                repeater.itemAt(k).color = "red"
                                colorArray[k] = "red"
                            }
                            k++
                        }
                        else{
                            repeater.itemAt(k).color = "green"
                            colorArray[k] = "green"
                            outertimer.stop()
                            endtimer.stop();
                            mainRect.isSorting = false
                        }
                    })
                }
            });
        }

        function radixSort() {
            if (mainRect.isSorting)
                return
            mainRect.isSorting = true

            var n = mainRect.array.length
            var i = 0
            var maxDigits = getMaxDigits(mainRect.array)
            var currentDigit = 1

            var outerTimer = Qt.createQmlObject(
                'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                mainRect
            )
            //var innerSort = false
            outerTimer.triggered.connect(function () {
                //if (innerSort) return
                if (currentDigit <= maxDigits) {
                    outerTimer.stop();
                    var buckets = Array(2).fill(0).map(() => [])

                    // Distribute elements into buckets based on the current digit
                    for (var j = 0; j < n; j++) {
                        var digit = getDigit(mainRect.array[j], currentDigit)
                        buckets[digit].push(mainRect.array[j])
                    }

                    // Concatenate buckets to form a new array
                    var newarray = [].concat(...buckets)
                    var index = 0
                    var innerTimer = Qt.createQmlObject(
                        'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                        mainRect
                    )

                    innerTimer.triggered.connect(function () {
                        if (index < n){
                           mainRect.array[index] = newarray[index]

                            colorArray[index] = "red"
                            repeater.model = mainRect.array
                            sortStepSignal();
                            colorArray[index] = "steelblue"
                            index++
                        }
                        else{
                            innerTimer.stop();
                            outerTimer.start();
                        }

                    })

                    // Emit signal to update the QML interface
                    sortStepSignal()

                    currentDigit++
                } else {
                    repeater.model = mainRect.array;
                    var k = 0;
                    var endtimer = Qt.createQmlObject(
                                'import QtQuick 2.15; Timer { interval: 1; repeat: true; running: true;}',
                                mainRect)
                    endtimer.triggered.connect(function () {
                        if (k < n-1){
                            if (mainRect.array[k] <= mainRect.array[k+1]){
                                repeater.itemAt(k).color = "green"
                                colorArray[k] = "green"
                            }
                            else{
                                repeater.itemAt(k).color = "red"
                                colorArray[k] = "red"
                            }
                            k++
                        }
                        else{
                            repeater.itemAt(k).color = "green"
                            colorArray[k] = "green"
                            outerTimer.stop()
                            endtimer.stop();
                            mainRect.isSorting = false
                        }
                    })
                }
            })
        }

        // Helper function to get the maximum number of digits in the array
        function getMaxDigits(arr) {
            var max = Math.max(...arr)
            return Math.floor(Math.log2(max)) + 1
        }

        // Helper function to get the digit at a specific place value
        function getDigit(num, place) {
            return Math.floor((num / Math.pow(2, place - 1)) % 2)
        }


        signal sortStepSignal

        RowLayout {
            spacing: 10
            Button {
                id: bubblesrtButton
                text: "Bubble Sort"
                onClicked: mainRect.bubbleSort()
            }
            Button {
                id: quicksrtButton
                text: "Quick Sort"
                onClicked: mainRect.quickSort()
            }
            Button {
                id: shellsrtButton
                text: "Shell Sort"
                onClicked: mainRect.shellSort()
            }
            Button {
                id: radixsrtButton
                text: "Radix Sort"
                onClicked: mainRect.radixSort()
            }
            Button {
                id: genButton
                text: "Generate New Array"
                anchors.leftMargin: 0
                onClicked: mainRect.generateRandomArray()
            }
            Slider {
                id: sizeSlider
                from: 1
                to: 200
                stepSize: 1
                value: mainRect.arraySize

                onValueChanged: {
                    mainRect.arraySize = sizeSlider.value
                    mainRect.generateRandomArray()
                }
            }
        }
    }
}

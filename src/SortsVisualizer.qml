import QtQuick
import QtQuick.Controls.Imagine
import QtQuick.Layouts

Item {
    visible: true
    width: 600
    height: 400

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "transparent"
        property var array: []
        property int arraySize: 100
        property bool isSorting: false
        property int maxValue: 100
        property var colorArray: [] // Array to store colors

        function swapElements(index1, index2) {
            // Swap array elements
            var temp = mainRect.array[index1]
            mainRect.array[index1] = mainRect.array[index2]
            mainRect.array[index2] = temp
            mainRect.colorArray[index1] = "red"
            mainRect.colorArray[index2] = "red"
            repeater.model = mainRect.array
        }

        function generateArray(type, n) {
            if (mainRect.isSorting) return mainRect.array
            mainRect.array = []
            var arr = [];
            mainRect.colorArray = []
            var i = 0
            for(i = 0; i < n; i++){
                mainRect.colorArray.push("steelblue")
            }

            switch (type) {
                case "Random":
                    for (i = 0; i < n; i++) {
                        arr[i] = Math.floor(Math.random() * 100) + 1; // Assuming a range of 0 to 99 for random values
                    }
                    break;

                case "SortedBegin":
                    for (i = 0; i < Math.floor(n / 2); i++) {
                        arr[i] = i;
                    }
                    for (i = Math.floor(n / 2); i < n; i++) {
                        arr[i] = Math.floor(Math.random() * 100) + 1; // Assuming a range of n to n+99 for random values
                    }
                    break;

                case "SortedEnd":
                    for (i = 0; i < Math.floor(n / 2); i++) {
                        arr[i] = Math.floor(Math.random() * 100) + 1;
                    }
                    for (i = Math.floor(n / 2); i < n; i++) {
                        arr[i] = i;
                    }
                    break;

                case "Sorted":
                    for (i = 0; i < n; i++) {
                        arr[i] = i;
                    }
                    break;

                case "ManyOrdinary":
                    for (i = 0; i < n; i++) {
                        arr[i] = Math.floor(Math.random() * 10) + 1; // Assuming a range of 0 to 99 for random values
                    }
                    break;
            }
            maxValue = mainRect.findMaxValue(arr);
            return arr;
        }

        function findMaxValue(arr) {
                var maxValue = arr.length > 0 ? arr[0] : undefined;

                for (var i = 1; i < arr.length; i++) {
                    if (arr[i] > maxValue) {
                        maxValue = arr[i];
                    }
                }

                return maxValue;
            }


        Repeater {
            id: repeater
            model: mainRect.array.length
            Rectangle {
                width: mainRect.width / mainRect.array.length
                height: mainRect.array[index] * (mainRect.height-50)/mainRect.maxValue
                color: mainRect.colorArray[index] ?  mainRect.colorArray[index] : "steelblue"
                border.color: "black"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: index * (width)
            }
        }

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
            RadioButton {
                id: randomButton
                text: "Random"
                checked: true
            }

            RadioButton {
                id: sortedBeginButton
                text: "Sorted Begin"
            }

            RadioButton {
                id: sortedEndButton
                text: "Sorted End"
            }

            RadioButton {
                id: sortedButton
                text: "Sorted"
            }

            RadioButton {
                id: ordinaryButton
                text: "Many ordinary"
            }
            Button {
                id: genButton
                text: "Generate"
                anchors.leftMargin: 0
                onClicked: {
                    var selectedGenerator
                    if (randomButton.checked) {
                        selectedGenerator = "Random"
                    } else if (sortedBeginButton.checked) {
                        selectedGenerator = "SortedBegin"
                    } else if (sortedEndButton.checked) {
                        selectedGenerator = "SortedEnd"
                    } else if (sortedButton.checked) {
                        selectedGenerator = "Sorted"
                    } else if (ordinaryButton.checked) {
                        selectedGenerator = "ManyOrdinary"
                    }
                    mainRect.array = mainRect.generateArray(selectedGenerator, mainRect.arraySize)
                    repeater.model = mainRect.array
                }
            }
            Slider {
                id: sizeSlider
                from: 20
                to: 200
                stepSize: 1
                value: mainRect.arraySize

                onValueChanged: {
                    mainRect.arraySize = sizeSlider.value
                    var selectedGenerator
                    if (randomButton.checked) {
                        selectedGenerator = "Random"
                    } else if (sortedBeginButton.checked) {
                        selectedGenerator = "SortedBegin"
                    } else if (sortedEndButton.checked) {
                        selectedGenerator = "SortedEnd"
                    } else if (sortedButton.checked) {
                        selectedGenerator = "Sorted"
                    } else if (ordinaryButton.checked) {
                        selectedGenerator = "ManyOrdinary"
                    }
                    mainRect.array = mainRect.generateArray(selectedGenerator, mainRect.arraySize)
                    repeater.model = mainRect.array
                }
            }
        }



        signal sortStepSignal


        function bubbleSort() {
            if (mainRect.isSorting)
                return
            mainRect.isSorting = true
            for(var k = 0; k < mainRect.array.length; ++k){
                repeater.itemAt(k).color = "steelblue"
                colorArray[k] = "steelblue"
            }

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

        function quickSort() {
            if (mainRect.isSorting)
                return
            mainRect.isSorting = true
            for(var k = 0; k < mainRect.array.length; ++k){
                repeater.itemAt(k).color = "steelblue"
                colorArray[k] = "steelblue"
            }
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
            for(var k = 0; k < mainRect.array.length; ++k){
                repeater.itemAt(k).color = "steelblue"
                colorArray[k] = "steelblue"
            }
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
            function getMaxDigits(arr) {
                var max = Math.max(...arr)
                return Math.floor(Math.log2(max)) + 1
            }

            function getDigit(num, place) {
                return Math.floor((num / Math.pow(2, place - 1)) % 2)
            }

            if (mainRect.isSorting)
                return
            mainRect.isSorting = true
            for(var k = 0; k < mainRect.array.length; ++k){
                repeater.itemAt(k).color = "steelblue"
                colorArray[k] = "steelblue"
            }
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


    }
}

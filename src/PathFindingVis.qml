import QtQuick
import QtQuick.Controls.Imagine
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Shapes

Item {
    visible: true
    width: 600
    height: 600
    property int numRows: 25
    property int numCols: 50
    property int cellSize: width / numCols
    property bool isFinding: false
    RowLayout {
        id: panel
        spacing: 20
        RadioButton {
            id: astarbutton
            text: "A*"
            checked: true
        }
        Button {
            text: "Start"

            onClicked: {
                if (isFinding) return
                var selectedPathFind
                if (startCellIndex == -1 || endCellIndex == -1)
                    return
                clearVisited();
                isFinding = true;
                if (astarbutton.checked) {
                    findPath();
                } else if (bfsButton.checked) {
                    findPathBFS();
                }
            }
        }
        Button {
            text: "Regenerate"
            onClicked: {
                if (isFinding) return
                generateLabyrinth()
            }
        }

        Slider {
            from: 20
            to: 50
            onValueChanged: {
                if (isFinding) return
                numCols = value
                numRows = Math.trunc(value / 2)
                generateLabyrinth()
            }
        }
        Text {
            id: steps
            text: "Total steps: "
            color: "black"
        }

        Slider{
            id: inputWeight;
            from: 1;
            to: 2;
            stepSize: 0.01;
            //visible: false;

            property int index: 0;
            property Text text: null;
            property Rectangle rect: null;

            onValueChanged: {
                cellStates[index].weight = value;

                text.text = value.toFixed(2);
                rect.color = getCellColor(index);
            }
        }
    }

    GridLayout {
        id: grid
        rows: numRows
        columns: numCols
        anchors.top: panel.bottom;
        columnSpacing: 0
        rowSpacing: 0

        Repeater {
            id: repeater;
            model: numRows * numCols

            Rectangle {
                width: cellSize
                height: cellSize
                color: getCellColor(index)
                radius: (getCellColor(index) === "black") ? cellSize / 3 : cellSize / 8;
                Text{
                    id: text
                    text: (cellStates[index] && getCellColor(index) !== "black") ? cellStates[index].weight.toFixed(2) : ""
                    color: (parent.color === Qt.color("yellow") || parent.color === Qt.color("orange")) ? "black" : "white";
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: (mouse) => {
                       if (mouse.button === Qt.RightButton) {


                           var slider = inputWeight;
                           slider.text = text;
                           slider.rect = parent
                           slider.index = index;
                           slider.value = cellStates[index].weight;
                       }
                       else {
                            cellClicked(index)

                       }
                    }
                }
            }
        }
    }
    Rectangle {
        anchors.fill: grid
        border.width: 2
        border.color: "black"
        color: "transparent"
    }

    Component.onCompleted: generateLabyrinth();
    function getWeightColor(weight) {
        var blueValue = Math.round(weight * 255);
        //var whiteValue = 255 - blueValue; // Adding white to make it brighter
        return Qt.rgba(0, 0, 1 - (weight/10 + 0.5), 1);
    }
    function getCellColor(index) {
        if (!cellStates[index]){
            return "transparent)"
        }

        switch (cellStates[index].state) {
        case 1:
            return "black";
        case 0:
            return getWeightColor(cellStates[index].weight);
        case 2:
            return "green";
        case 3:
            return "red";
        case 4:
            return "yellow";
        case 5:
            return "orange";
        }
    }

    property var cellStates: Array(grid.rows * grid.columns);

    property int startCellIndex: -1
    property int endCellIndex: -1

    function cellClicked(index) {
        if (cellStates[index].state === 1) return;
        if (startCellIndex === -1 || endCellIndex != -1) {
            if (startCellIndex != -1) {
                repeater.itemAt(startCellIndex).color = getCellColor(index);
                repeater.itemAt(endCellIndex).color = getCellColor(index);
            }

            startCellIndex = index;
            cellStates[index].state = 2; // Start
            repeater.itemAt(index).color = getCellColor(index);
            endCellIndex = -1;
            clearVisited();
        } else if (endCellIndex === -1 && index !== startCellIndex) {
            endCellIndex = index;
            cellStates[index].state = 3; // End
            repeater.itemAt(index).color = getCellColor(index);
        }
    }

    function clearVisited() {
        for (let i = 0; i < cellStates.length; ++i) {
            if (cellStates[i].state === 4 || cellStates[i].state === 5) { // Visited
                cellStates[i].state = 0; // Empty
                repeater.itemAt(i).color = getCellColor(i);
            }
        }
    }

    function visualizePath(path) {
        var step = 1;
        for (var i = 1; i < path.length - 1; ++i) {
            cellStates[path[step]].state = 4; // Path
            repeater.itemAt(path[step]).color = getCellColor(path[step]);
            step++;
        }

        repeater.itemAt(startCellIndex).color = getCellColor(startCellIndex);
        repeater.itemAt(endCellIndex).color = getCellColor(endCellIndex);
        cellStates[startCellIndex].state = 2; // Path
        cellStates[endCellIndex].state = 3; // Path
    }

    function generateLabyrinth() {
        cellStates = [];
        for (let i = 0; i < numRows; ++i) {
            for (let j = 0; j < numCols; ++j) {
                // Set each cell with a 30% chance to be a wall
                cellStates.push({ state: (Math.random() < 0.3) ? 1 : 0, weight: Math.random() + 1 });
            }
        }
        startCellIndex = -1;
        endCellIndex = -1;
        repeater.model = cellStates;
    }

    function findPath() {
        // A* pathfinding algorithm
        var openSet = [startCellIndex];
        var cameFrom = {}; // Map to store the parent of each cell
        var gScore = {};   // Map to store the cost from start to each cell
        var fScore = {};   // Map to store the total cost of reaching the goal through each cell

        // Initialization
        for (let k = 0; k < cellStates.length; ++k) {
            gScore[k] = Infinity;
            fScore[k] = Infinity;
        }
        gScore[startCellIndex] = 0;
        fScore[startCellIndex] = heuristic(startCellIndex, endCellIndex);

        var timer = Qt.createQmlObject("import QtQuick 2.15; Timer { interval: 1; repeat: true; running: false; }", grid);
        var currentIndex = startCellIndex;
        var totalSteps = 0

        function processStep() {
            if (openSet.length > 0) {
                steps.text = "Total steps: " + totalSteps.toString();
                totalSteps++;
                var current = findLowestFScore(openSet, fScore);

                if (current === endCellIndex) {
                    // Path found, reconstruct and return the path
                    steps.text = "Total score: " + gScore[endCellIndex].toFixed(2);
                    visualizePath(reconstructPath(cameFrom, current, startCellIndex));
                    timer.stop();
                    isFinding = false;
                    return;
                }

                openSet.splice(openSet.indexOf(current), 1);

                var neighbors = getNeighbors(current);
                for (var i = 0; i < neighbors.length; ++i) {
                    var neighbor = neighbors[i];

                    if (cellStates[neighbor].state === 1) {
                        continue; // Skip obstacles
                    }

                    var tentativeGScore = gScore[current] + 1 * cellStates[neighbor].weight;

                    if (!gScore.hasOwnProperty(neighbor) || tentativeGScore < gScore[neighbor]) {
                        // Update information for the neighbor cell
                        cameFrom[neighbor] = current;
                        gScore[neighbor] = tentativeGScore;
                        fScore[neighbor] = gScore[neighbor] + heuristic(neighbor, endCellIndex);

                        if (cellStates[neighbor].state === 0) cellStates[neighbor].state = 5; // Visited
                        repeater.itemAt(neighbor).color = getCellColor(neighbor);

                        if (!openSet.includes(neighbor)) {
                            openSet.push(neighbor);
                        }
                    }
                }
            } else {
                // No path found, stop the timer
                timer.stop();
                isFinding = false;
            }
        }

        // Connect the timer to the processStep function
        timer.triggered.connect(processStep);
        timer.running = true;

        return []; // No path found
    }


    function reconstructPath(cameFrom, current, startCellIndex) {
        var path = [current];
        while (cameFrom[current] !== startCellIndex) {
            current = cameFrom[current];
            path.unshift(current);
        }
        path.unshift(current);
        path.unshift(startCellIndex);
        return path;
    }

    function findLowestFScore(set, fScore) {
        var lowest = set[0];
        for (var i = 1; i < set.length; ++i) {
            if (fScore[set[i]] < fScore[lowest]) {
                lowest = set[i];
            }
        }
        return lowest;
    }

    function heuristic(a, b) {
        var rowA = Math.floor(a / numCols);
        var colA = a % numCols;
        var rowB = Math.floor(b / numCols);
        var colB = b % numCols;
        return Math.abs(rowA - rowB) + Math.abs(colA - colB);
    }

    function getNeighbors(index) {
        var neighbors = [];
        var row = Math.trunc(index / numCols);
        var col = index % numCols;

        if (row > 0) neighbors.push(index - numCols); // Top
        if (row < numRows - 1) neighbors.push(index + numCols); // Bottom
        if (col > 0) neighbors.push(index - 1); // Left
        if (col < numCols - 1) neighbors.push(index + 1); // Right

        return neighbors;
    }

}

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
    RowLayout{
        id: panel
        spacing: 20
        RadioButton {
            id: astarbutton
            text: "A*"
            checked: true
        }

        RadioButton {
            id: bfsButton
            text: "BFS"
        }
        Button{
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
        Button{
            text: "Regenerate"
            onClicked: {
                if (isFinding) return
                generateLabyrinth()
            }
        }

        Slider{
            from: 20
            to: 100
            onValueChanged: {
                if (isFinding) return
                numCols = value
                numRows = Math.trunc(value/2)
                generateLabyrinth()
            }
        }
        Text{
            id: steps
            text: "Total steps: "
            color: "black"
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
                color: getCellColor(index) ?  getCellColor(index) : "transparent"
                radius: (getCellColor(index) === "black") ? cellSize/3 : cellSize/8;
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        cellClicked(index)
                    }
                }


            }
        }
    }
    Rectangle{
        anchors.fill: grid
        border.width: 2
        border.color: "black"
        color: "transparent"
    }


    Component.onCompleted: generateLabyrinth();
    function getCellColor(index) {
        switch(cellStates[index]){
        case 1:
            return "black"
        case 0:
            return "transparent"
        case 2:
            return "green"
        case 4:
            return "yellow"
        case 5:
            return "orange"
        }
    }

    property var cellStates: Array(grid.rows * grid.columns, 0)
    property int startCellIndex: -1
    property int endCellIndex: -1

    function cellClicked(index) {
       if (cellStates[index] === 1)return;
       if (startCellIndex === -1 || endCellIndex != -1) {
           if (startCellIndex!=-1){
               repeater.itemAt(startCellIndex).color = "transparent"
               repeater.itemAt(endCellIndex).color = "transparent"
           }

           startCellIndex = index;
           cellStates[index] = 2; // Start
           repeater.itemAt(index).color = "red";
           endCellIndex = -1;
           clearVisited();
       } else if (endCellIndex === -1 && index !== startCellIndex) {
           endCellIndex = index;
           cellStates[index] = 2; // End
           repeater.itemAt(index).color = "green";
       }
    }

    function clearVisited() {
        for (let i = 0; i < cellStates.length; ++i) {
            if (cellStates[i] === 4 || cellStates[i] === 5) { // Visited
                cellStates[i] = 0; // Empty
                repeater.itemAt(i).color = "transparent";
            }
        }
    }

    function visualizePath(path) {
        var step = 1;
        for (var i = 1; i < path.length - 1; ++i) {
            cellStates[path[step]] = 4; // Path
            repeater.itemAt(path[step]).color = "yellow"
            step++;
        }

        repeater.itemAt(startCellIndex).color = "red";
        repeater.itemAt(endCellIndex).color = "green";
        cellStates[startCellIndex] = 2; // Path
        cellStates[endCellIndex] = 2; // Path

    }

    function generateLabyrinth() {
        for (let i = 0; i < numRows; ++i) {
            for (let j = 0; j < numCols; ++j) {
                // Set each cell with a 30% chance to be a wall
                if (Math.random() < 0.3) {
                    cellStates[i * numCols + j] = 1; // Wall
                }
                else{
                    cellStates[i * numCols + j] = 0; // empty
                }
            }
        }
        startCellIndex = -1
        endCellIndex = -1
        repeater.model = cellStates
    }

    function findPath() {
        // A* pathfinding algorithm
        var openSet = [startCellIndex];
        var cameFrom = [];
        var gScore = Array(grid.rows * grid.columns, Infinity);
        var fScore = Array(grid.rows * grid.columns, Infinity);

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
            if (openSet.length > 0){
                steps.text = "Total steps: " + totalSteps.toString();
                totalSteps++;
                var current = findLowestFScore(openSet, fScore);

                if (current === endCellIndex) {
                    visualizePath(reconstructPath(cameFrom, current, startCellIndex));
                    timer.stop();
                    isFinding = false;

                    return;
                }

                openSet.splice(openSet.indexOf(current), 1);

                var neighbors = getNeighbors(current);
                for (var i = 0; i < neighbors.length; ++i) {
                    var neighbor = neighbors[i];

                    if (cellStates[neighbor] === 1) {
                        continue;
                    }
                    var tentativeGScore = gScore[current] + 1;

                    if (tentativeGScore < gScore[neighbor]) {
                        cameFrom[neighbor] = current;
                        cellStates[neighbor] = 5; // Visited
                        repeater.itemAt(neighbor).color = "orange"
                        gScore[neighbor] = tentativeGScore;
                        fScore[neighbor] = gScore[neighbor] + heuristic(neighbor, endCellIndex);

                        if (!openSet.includes(neighbor)) {
                            openSet.push(neighbor);
                        }
                    }
                }
            }
            else{
                timer.stop();
                isFinding = false;
            }
        }
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
        path.unshift(startCellIndex)
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
        var rowA = a / numCols;
        var colA = a % numCols;
        var rowB = b / numCols;
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

    function findPathBFS() {
        // Breadth-First Search algorithm
        var queue = [startCellIndex];
        var visited = Array(grid.rows * grid.columns).fill(false);
        var cameFrom = [];

        var timer = Qt.createQmlObject("import QtQuick 2.15; Timer { interval: 1; repeat: true; running: false; }", grid);
        var totalSteps = 0
        function processStep() {
            if (queue.length > 0) {
                totalSteps++
                steps.text = "Total steps: " + totalSteps.toString();
                var current = queue.shift();

                if (current === endCellIndex) {
                    visualizePath(reconstructPath(cameFrom, current, startCellIndex));
                    timer.stop();
                    isFinding = false;
                    return;
                }

                var neighbors = getNeighbors(current);
                for (var i = 0; i < neighbors.length; ++i) {
                    var neighbor = neighbors[i];

                    if (!visited[neighbor] && cellStates[neighbor] !== 1) {
                        visited[neighbor] = true;
                        cameFrom[neighbor] = current;
                        queue.push(neighbor);
                        if (cellStates[neighbor] === 0){
                            cellStates[neighbor] = 5; // Visited
                            repeater.itemAt(neighbor).color = "orange";
                        }
                    }
                }
            } else {
                timer.stop();
                isFinding = false;
            }
        }

        timer.triggered.connect(processStep);
        timer.running = true;

        return []; // No path found
    }
}

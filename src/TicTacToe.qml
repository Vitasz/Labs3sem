import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    visible: true
    width: 800
    height: 800

    id: window
    property int cellSize: width/fieldSize
    property var board: []
    property int fieldSize: 4
    property int maxDepth: 4
    property int winningLength: 3

    property bool gameInProgress: true

    function initializeBoard() {
        board = [];
        for (var i = 0; i < fieldSize * fieldSize; i++) {
            board.push("");
        }
    }

    Component.onCompleted: {
        initializeBoard();
    }


    function checkWin(player) {
        function checkLine(line) {
            return line.every(function (cell) {
                return cell === player;
            });
        }

        // Check rows
        for (var i = 0; i < fieldSize; i++) {
            for (var j = 0; j <= fieldSize - winningLength; j++) {
                var row = board.slice(i * fieldSize + j, i * fieldSize + j + winningLength);
                if (checkLine(row)) {
                    return true;
                }
            }
        }

        // Check columns
        for (var j = 0; j < fieldSize; j++) {
            for (var i = 0; i <= fieldSize - winningLength; i++) {
                var column = [];
                for (var k = i; k < i + winningLength; k++) {
                    column.push(board[k * fieldSize + j]);
                }
                if (checkLine(column)) {
                    return true;
                }
            }
        }

        // Check diagonals
        for (var i = 0; i <= fieldSize - winningLength; i++) {
            for (var j = 0; j <= fieldSize - winningLength; j++) {
                var diagonal1 = [];
                var diagonal2 = [];
                for (var k = 0; k < winningLength; k++) {
                    diagonal1.push(board[(i + k) * fieldSize + j + k]);
                    diagonal2.push(board[(i + k) * fieldSize + j + winningLength - 1 - k]);
                }

                if (checkLine(diagonal1) || checkLine(diagonal2)) {
                    return true;
                }
            }
        }

        return false;
    }




    function checkDraw() {
        // Check for a draw
        for (var i = 0; i < board.length; i++) {
            if (board[i] === "") {
                return false; // Board is not full
            }
        }
        return true; // Board is full (draw)
    }

    function cellClicked(index) {
        if (board[index] === "" && gameInProgress) {
            // Cell is empty, mark it with X or O
            board[index] = "X";
            // Check for a win or draw
            repeater.model = board;
            if (checkWin("X")) {
                showPopup("Player X wins!");
            } else if (checkDraw()) {
                showPopup("It's a draw!");
            } else {
                makeComputerMove();
                repeater.model = board;
            }
        }
    }

    function makeComputerMove() {
        // Find the best move using the minimax algorithm with alpha-beta pruning and depth limitation
        var bestScore = -Infinity;
        var bestMove;

        for (var i = 0; i < board.length; i++) {
            if (board[i] === "") {
                board[i] = "O";
                var score = minimax(board, 0, -Infinity, Infinity, false, maxDepth);
                board[i] = "";
                if (score > bestScore) {
                    bestScore = score;
                    bestMove = i;
                }
            }
        }

        // Make the best move for the computer
        board[bestMove] = "O";

        // Check for a win or draw
        if (checkWin("O")) {
            showPopup("Player O wins!");
        } else if (checkDraw()) {
            showPopup("It's a draw!");
        }
    }

    function minimax(board, depth, alpha, beta, isMaximizing, maxDepth) {
        var scores = {
            X: -1,
            O: 1,
            draw: 0
        };

        if (depth === maxDepth || checkWin("X") || checkWin("O") || checkDraw()) {
            var evalScore = evaluateBoard(board);
            return evalScore;
        }

        if (isMaximizing) {
            var maxScore = -Infinity;
            for (var i = 0; i < board.length; i++) {
                if (board[i] === "") {
                    board[i] = "O";
                    maxScore = Math.max(maxScore, minimax(board, depth + 1, alpha, beta, false, maxDepth));
                    board[i] = "";
                    alpha = Math.max(alpha, maxScore);
                    if (beta <= alpha) {
                        break; // Beta cutoff
                    }
                }
            }
            return maxScore;
        } else {
            var minScore = Infinity;
            for (var j = 0; j < board.length; j++) {
                if (board[j] === "") {
                    board[j] = "X";
                    minScore = Math.min(minScore, minimax(board, depth + 1, alpha, beta, true, maxDepth));
                    board[j] = "";
                    beta = Math.min(beta, minScore);
                    if (beta <= alpha) {
                        break; // Alpha cutoff
                    }
                }
            }
            return minScore;
        }
    }

    function evaluateBoard(board) {
        // Check for wins or draws
        if (checkWin("O")) {
            return 10; // Favorable for computer ('O') - computer wins
        } else if (checkWin("X")) {
            return -10; // Favorable for human ('X') - human wins
        } else if (checkDraw()) {
            return 0; // Neutral - draw
        }

        // Evaluate based on the number of 'O' and 'X' in rows, columns, and diagonals
        var computerScore = evaluateLine(board, 'O');
        var humanScore = evaluateLine(board, 'X');

        return computerScore - humanScore;
    }

    function evaluateLine(board, player) {
        var score = 0;

        // Check rows
        for (var i = 0; i < fieldSize; i++) {
            var startIndex = i * fieldSize;
            var line = board.slice(startIndex, startIndex + fieldSize);
            score += evaluateSubLine(line, player);
        }

        // Check columns
        for (var j = 0; j < fieldSize; j++) {
            var column = [];
            for (var k = j; k < board.length; k += fieldSize) {
                column.push(board[k]);
            }
            score += evaluateSubLine(column, player);
        }

        // Check diagonals
        var diagonal1 = [];
        var diagonal2 = [];
        for (var l = 0; l < fieldSize; l++) {
            diagonal1.push(board[l * (fieldSize + 1)]);
            diagonal2.push(board[(l + 1) * (fieldSize - 1)]);
        }
        score += evaluateSubLine(diagonal1, player);
        score += evaluateSubLine(diagonal2, player);

        return score;
    }

    function evaluateSubLine(subLine, player) {
        var score = 0;

        // Count occurrences of player and empty cells in the subLine
        var playerCount = subLine.filter(function (cell) {
            return cell === player;
        }).length;

        var emptyCount = subLine.filter(function (cell) {
            return cell === "";
        }).length;

        // Favorable for computer ('O')
        if (playerCount === winningLength - 1 && emptyCount === 1) {
            score = 1;
        }

        // Favorable for human ('X')
        if (playerCount === winningLength - 1 && subLine.indexOf("O") === -1) {
            score = -1;
        }

        return score;
    }


    function showPopup(message) {
        popup.myText = message;
        popup.open();
        gameInProgress = false; // Set game state to false
        popup.closed.connect(function () {
            // Reset the game state and board
            gameInProgress = true;
            initializeBoard();
        });
    }

    MyPopup {
        id: popup
        myText: "asdfasdf"
    }
    ColumnLayout{
        RowLayout{
            Column{
                Text{
                    text: "Размер поля: " + fieldSizeSlider.value.toString()
                }

                Slider{
                    id: fieldSizeSlider
                    from: 3
                    to: 10
                    stepSize: 1
                    onValueChanged: {
                        window.fieldSize = value;
                        initializeBoard()
                        grid.rows = value
                        grid.columns = value;
                        repeater.model = fieldSize * fieldSize
                        //grid.update()
                    }
                }
            }
            Column{
                Text{
                    text: "Длина цепочки: " + winningLengthSlider.value.toString()
                }

                Slider{
                    id: winningLengthSlider
                    from: 3
                    to: fieldSizeSlider.value
                    stepSize: 1
                    onValueChanged: {
                        window.winningLength = value;
                        //initializeBoard()
                        //grid.update()
                    }
                }
            }

            Column{
                Text{
                    text: "Глубина: " + maxDepthSlider.value.toString()
                }

                Slider{
                    id: maxDepthSlider
                    from: 2
                    to: 5
                    stepSize: 1
                    onValueChanged: {
                        window.maxDepth = value;
                    }
                }
            }

        }

        GridLayout {
            id: grid
            rows: fieldSize
            columns: fieldSize
            Layout.fillHeight: true
            Layout.fillWidth: true
            //anchors.fill: parent
            columnSpacing: 0
            rowSpacing: 0

            Repeater {
                id: repeater;
                model: fieldSize * fieldSize

                Rectangle {
                    width: cellSize
                    height: cellSize
                    color: "white"
                    border.width: 1
                    border.color: "black"
                    Text {
                        anchors.centerIn: parent
                        text: board[index] ? board[index] : ""
                        color: board[index] === "X" ? "red" : "blue"
                        font.pixelSize: 50
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            cellClicked(index);
                            update();
                        }
                    }
                }
            }
        }
    }
}

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtCharts

import "qrc:/Lab1"
import "qrc:/../images"

import TestClassPaths
Page {
    id: main


    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 91
        height: parent.height
        anchors.left: parent.left
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#106697"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
            orientation: Gradient.Vertical
        }
        transformOrigin: Item.Left
        Timer{
            id: timer
            interval: 1000
            onTriggered: {
                menuicon.visible = true
            }
        }

        Image {
            id: menuicon
            x: 24
            width: 30
            height: 30
            visible: true
            source: "qrc:/images/images/exit_icon.svg"
            anchors.topMargin: 30
            z: 1
            anchors.top: parent.top
            transformOrigin: Item.Top
            fillMode: Image.PreserveAspectFit
            MouseArea{
                id: exit
                anchors.fill: parent
                enabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    stackView.pop()
                }
            }
        }
    }
    Item {
        id: itminfo
        visible: true
        anchors.left: rectangle.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 30
        anchors.topMargin: 30
        anchors.leftMargin: 30
        anchors.bottom: parent.bottom

        ScrollView {
            id: scrollView
            visible: true
            anchors.fill: itminfo

            //contentWidth:  itminfo.width
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff
            contentHeight: column.height + 50

            ColumnLayout {
                id: column
                x: 0
                y: 0
                width: 1206
                spacing: 30
                visible: true
                clip: false
                Item {
                    id: item2
                    height: main.height - 50
                    visible: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                    Shape {
                        id: mainShape
                        width: 800
                        height: 700
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        ShapePath {

                            startX: 0
                            startY: mainShape.height
                            PathLine {
                                x: 525
                                y: mainShape.height
                            }
                            PathLine {
                                x: 850
                                y: 0
                            }
                            capStyle: ShapePath.SquareCap
                            joinStyle: ShapePath.RoundJoin
                            strokeWidth: 20 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            fillColor: "transparent"
                        }

                        Text {
                            y: 824
                            property string link: "https://onedrive.live.com/?authkey=%21ADgC7s1Z%2D4H%5FLY4&cid=187CCF51BB4995EC&id=187CCF51BB4995EC%2188753&parId=187CCF51BB4995EC%2187105&o=OneUp"
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            ///anchors.leftMargin: 236
                            anchors.bottomMargin: 10
                            anchors.rightMargin: 150
                            anchors.right: mainShape.right
                            text: "Задание: <a href='" + link + "'>useless_file.pdf</a>"
                            anchors.left: parent.left
                            anchors.bottom: parent.bottom
                            font.letterSpacing: 2
                            font.pixelSize: 30
                            font.styleName: "Black"
                            font.family: "Inter Light"
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    Qt.openUrlExternally(parent.link)
                                }
                            }
                        }
                    }

                    ColumnLayout {
                        y: 499
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenterOffset: -11
                        spacing: 5
                        Text {
                            id: title
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter

                            text: qsTr("Лабораторная работа №4")
                            font.pixelSize: 50
                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                        Text {
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Поиск пути.")
                            font.letterSpacing: 15
                            font.pixelSize: 30
                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                    }

                    ColumnLayout {
                        anchors.left: mainShape.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        layoutDirection: Qt.LeftToRight
                        anchors.leftMargin: -125
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        clip: false

                        MainButton {
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            scrollTo: info.y
                            width: 310
                            bttnText: "Визуализация"
                        }

                        MainDottedLine {
                            width: 400
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        }

                        MainButton {
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            scrollTo: real.y
                            width: 410
                            bttnText: "Реализация"
                        }
                        MainDottedLine {
                            width: 510
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        }
                        MainButton {
                            scrollTo: tests.y
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            width: 520
                            bttnText: "Тестирование"
                        }
                    }
                }
                ColumnLayout {
                    id: info
                    height: main.height - 50
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    spacing: 20
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Визуализация")
                        horizontalAlignment: Text.AlignHCenter
                        font.letterSpacing: 2
                        font.pointSize: 40
                        font.styleName: "Black"
                        font.family: "Inter Light"
                    }
                    Shape {
                        id: lineinfo
                        Layout.fillWidth: true
                        ShapePath {
                            startX: 0
                            startY: 0
                            PathLine {
                                x: lineinfo.width
                                y: 0
                            }
                            fillColor: "transparent"
                            capStyle: ShapePath.SquareCap
                            joinStyle: ShapePath.RoundJoin
                            strokeWidth: 2 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            strokeStyle: ShapePath.DashLine
                            //capStyle: ShapePath.RoundCap
                            dashPattern: [1, 3] // Set the dash pattern for a dotted line
                        }
                    }
                    PathFindingVis{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }

                }
                ColumnLayout {
                    id: real
                    height: main.height - 50
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    spacing: 20
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Реализация")
                        horizontalAlignment: Text.AlignHCenter
                        font.letterSpacing: 2
                        font.pointSize: 40
                        font.styleName: "Black"
                        font.family: "Inter Light"
                    }
                    Shape {
                        id: linereal
                        Layout.fillWidth: true
                        ShapePath {
                            startX: 0
                            startY: 0
                            PathLine {
                                x: linereal.width
                                y: 0
                            }
                            fillColor: "transparent"
                            capStyle: ShapePath.SquareCap
                            joinStyle: ShapePath.RoundJoin
                            strokeWidth: 2 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            strokeStyle: ShapePath.DashLine
                            //capStyle: ShapePath.RoundCap
                            dashPattern: [1, 3] // Set the dash pattern for a dotted line
                        }
                    }
                ColumnLayout {

                        visible: true
                        smooth: true
                        clip: false
                        spacing: 10
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        RowLayout {
                            visible: true
                            smooth: true
                            clip: false
                            spacing: 10
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignHCenter
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab4.png"
                                name: "<font color='#f97583'>Дейкстра<//font>"
                                className: ""
                                textCode: "<!-- HTML generated using hilite.me --><div style='background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span style='color: #333399; font-weight: bold'>void</span> <span style='color: #0066BB; font-weight: bold'>dijkstra</span>(<span style='color: #008800; font-weight: bold'>const</span> std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>int</span><span style='color: #333333'>&gt;&gt;&amp;</span> graph, <span style='color: #333399; font-weight: bold'>int</span> start, <span style='color: #333399; font-weight: bold'>int</span> end) {
        <span style='color: #333399; font-weight: bold'>int</span> n <span style='color: #333333'>=</span> graph.size();
        std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>int</span><span style='color: #333333'>&gt;</span> distance(n, std<span style='color: #333333'>::</span>numeric_limits<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>int</span><span style='color: #333333'>&gt;::</span>max());
        distance[start] <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>0</span>;

        std<span style='color: #333333'>::</span>set<span style='color: #333333'>&lt;</span>std<span style='color: #333333'>::</span>pair<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>int</span>, <span style='color: #333399; font-weight: bold'>int</span><span style='color: #333333'>&gt;&gt;</span> pq;  <span style='color: #888888'>// Priority queue using set</span>

        pq.insert({<span style='color: #0000DD; font-weight: bold'>0</span>, start});

        <span style='color: #008800; font-weight: bold'>while</span> (<span style='color: #333333'>!</span>pq.empty()) {
            <span style='color: #333399; font-weight: bold'>int</span> u <span style='color: #333333'>=</span> pq.begin()<span style='color: #333333'>-&gt;</span>second;
            pq.erase(pq.begin());

            <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> v <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>0</span>; v <span style='color: #333333'>&lt;</span> n; <span style='color: #333333'>++</span>v) {
                <span style='color: #008800; font-weight: bold'>if</span> (graph[u][v] <span style='color: #333333'>!=</span> <span style='color: #0000DD; font-weight: bold'>0</span> <span style='color: #333333'>&amp;&amp;</span> distance[u] <span style='color: #333333'>+</span> graph[u][v] <span style='color: #333333'>&lt;</span> distance[v]) {
                    pq.erase({distance[v], v});
                    distance[v] <span style='color: #333333'>=</span> distance[u] <span style='color: #333333'>+</span> graph[u][v];
                    pq.insert({distance[v], v});
                }
            }
        }
    }
</pre></div>
"
                            }
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab4.png"
                                name: "<font color='#f97583'>BFS<//font>"
                                className: ""
                                textCode: "<!-- HTML generated using hilite.me --><div style='background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span style='color: #333399; font-weight: bold'>void</span> <span style='color: #0066BB; font-weight: bold'>bfs</span>(<span style='color: #008800; font-weight: bold'>const</span> std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>int</span><span style='color: #333333'>&gt;&gt;&amp;</span> graph, <span style='color: #333399; font-weight: bold'>int</span> start, <span style='color: #333399; font-weight: bold'>int</span> end) {
        <span style='color: #333399; font-weight: bold'>int</span> n <span style='color: #333333'>=</span> graph.size();
        std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>bool</span><span style='color: #333333'>&gt;</span> visited(n, <span style='color: #007020'>false</span>);
        std<span style='color: #333333'>::</span>queue<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>int</span><span style='color: #333333'>&gt;</span> q;

        q.push(start);
        visited[start] <span style='color: #333333'>=</span> <span style='color: #007020'>true</span>;

        <span style='color: #008800; font-weight: bold'>while</span> (<span style='color: #333333'>!</span>q.empty()) {
            <span style='color: #333399; font-weight: bold'>int</span> current <span style='color: #333333'>=</span> q.front();
            q.pop();
            <span style='color: #008800; font-weight: bold'>if</span> (current <span style='color: #333333'>==</span> end) <span style='color: #008800; font-weight: bold'>return</span>;

            <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> neighbor <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>0</span>; neighbor <span style='color: #333333'>&lt;</span> n; <span style='color: #333333'>++</span>neighbor) {
                <span style='color: #008800; font-weight: bold'>if</span> (graph[current][neighbor] <span style='color: #333333'>==</span> <span style='color: #0000DD; font-weight: bold'>1</span> <span style='color: #333333'>&amp;&amp;</span> <span style='color: #333333'>!</span>visited[neighbor]) {
                    q.push(neighbor);
                    visited[neighbor] <span style='color: #333333'>=</span> <span style='color: #007020'>true</span>;
                }
            }
        }
    }
</pre></div>
"
                            }
                        }
                    }
                }

                ColumnLayout {
                    id: tests
                    height: main.height - 50
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    spacing: 20
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Тестирование")
                        horizontalAlignment: Text.AlignHCenter
                        font.letterSpacing: 2
                        font.pointSize: 40
                        font.styleName: "Black"
                        font.family: "Inter Light"
                    }
                    Shape {
                        id: linetests
                        Layout.fillWidth: true
                        ShapePath {
                            startX: 0
                            startY: 0
                            PathLine {
                                x: linetests.width
                                y: 0
                            }
                            fillColor: "transparent"
                            capStyle: ShapePath.SquareCap
                            joinStyle: ShapePath.RoundJoin
                            strokeWidth: 2 // Adjust the width of the separator as needed
                            strokeColor: "black"
                            strokeStyle: ShapePath.DashLine
                            //capStyle: ShapePath.RoundCap
                            dashPattern: [1, 3] // Set the dash pattern for a dotted line
                        }
                    }
                    Pane {
                        Layout.alignment: Qt.AlignHCenter
                        ColumnLayout {
                            ColumnLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "На случайном графе"
                                    font.styleName: "Bold"
                                    font.family: "Inner"
                                    font.pointSize: 30
                                }
                                RowLayout {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.fillWidth: true
                                    ChartView {
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"
                                        ValuesAxis {
                                            id: smartAxisXsmall
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: smartAxisYsmall
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: dijkstra
                                            name: "Дейкстра"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: smartAxisXsmall

                                            axisY: smartAxisYsmall
                                        }

                                        SplineSeries {
                                            id: bfs
                                            name: "BFS"
                                            axisX: smartAxisXsmall

                                            axisY: smartAxisYsmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }

                                        TestClassPaths {
                                            id: testingItem
                                            property int start: 1000
                                            property int finish: 5000
                                            property int step: 250
                                            onTestDijkstraResult: function (n, result) {
                                                dijkstra.append(
                                                            n, result)
                                                if (smartAxisXsmall.min > n)
                                                    smartAxisXsmall.min = n
                                                if (smartAxisYsmall.min > result)
                                                    smartAxisYsmall.min = result - 0.1
                                                if (smartAxisXsmall.max < n)
                                                    smartAxisXsmall.max = n
                                                if (smartAxisYsmall.max < result)
                                                    smartAxisYsmall.max = result + 0.1
                                                if (n < testingItem.finish) {
                                                    exit.enabled = false
                                                    testingItem.testDijkstra(
                                                                n + testingItem.step)
                                                } else {
                                                    exit.enabled = false
                                                    testingItem.testBFS(testingItem.start)

                                                }
                                            }
                                            onTestBFSResult: function (n, result) {
                                                bfs.append(
                                                            n, result)
                                                if (smartAxisXsmall.min > n)
                                                    smartAxisXsmall.min = n
                                                if (smartAxisYsmall.min > result)
                                                    smartAxisYsmall.min = result - 0.1
                                                if (smartAxisXsmall.max < n)
                                                    smartAxisXsmall.max = n
                                                if (smartAxisYsmall.max < result)
                                                    smartAxisYsmall.max = result + 0.1
                                                if (n < testingItem.finish) {
                                                    exit.enabled = false
                                                    testingItem.testBFS(
                                                                n + testingItem.step)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            testingItem.testDijkstra(
                                                        testingItem.start)
                                        }
                                    }



                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

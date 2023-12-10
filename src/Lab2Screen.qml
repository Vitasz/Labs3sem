import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtCharts

import "qrc:/Lab1"
import "qrc:/../images"

import qml.testclasssrts

Page {
    id: main
    //width: 1366
    //height: 768
    visible: true

    //color: "#ffffff"
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
            source: "qrc:/images/images/exit_icon.svg"
            anchors.topMargin: 30
            z: 1
            anchors.top: parent.top
            transformOrigin: Item.Top
            fillMode: Image.PreserveAspectFit
            visible: false

            MouseArea{
                id: exit
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                enabled: false
                onClicked: {
                    stackView.pop()
                }
                onEnabledChanged: {
                    if (enabled) timer.start();
                    else timer.stop()
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
                            property string link: "https://onedrive.live.com/?authkey=%21ADgC7s1Z%2D4H%5FLY4&cid=187CCF51BB4995EC&id=187CCF51BB4995EC%2188755&parId=187CCF51BB4995EC%2187105&o=OneUp"
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

                            text: qsTr("Лабораторная работа №2")
                            font.pixelSize: 50
                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                        Text {
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Сортировки.")
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
                    SortsVisualizer{
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
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
                    RowLayout {
                        visible: true
                        smooth: true
                        clip: false
                        spacing: 10
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        Lab1Card {
                            iconPath: "qrc:/images/images/lab2.png"
                            name: "<font color='#f97583'>Bubble<//font><font color='#B392F0'> sort<//font>"
                            className: ""
                            textCode: "<!-- HTML generated using hilite.me --><div style='background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span style='color: #008800; font-weight: bold'>template</span> <span style='color: #333333'>&lt;</span><span style='color: #008800; font-weight: bold'>typename</span> T, <span style='color: #008800; font-weight: bold'>typename</span> Comparator<span style='color: #333333'>&gt;</span>
<span style='color: #333399; font-weight: bold'>void</span> bubbleSort(std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>T<span style='color: #333333'>&gt;</span> <span style='color: #333333'>&amp;</span>arr, Comparator cmp) {
    <span style='color: #333399; font-weight: bold'>int</span> n <span style='color: #333333'>=</span> arr.size();
    <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> i <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>0</span>; i <span style='color: #333333'>&lt;</span> n <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span>; <span style='color: #333333'>++</span>i) {
        <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> j <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>0</span>; j <span style='color: #333333'>&lt;</span> n <span style='color: #333333'>-</span> i <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span>; <span style='color: #333333'>++</span>j) {
            <span style='color: #008800; font-weight: bold'>if</span> (cmp(arr[j], arr[j <span style='color: #333333'>+</span> <span style='color: #0000DD; font-weight: bold'>1</span>])) {
                std<span style='color: #333333'>::</span>swap(arr[j], arr[j <span style='color: #333333'>+</span> <span style='color: #0000DD; font-weight: bold'>1</span>]);
            }
        }
    }
}
</pre></div>
"
                        }
                        Lab1Card {
                            iconPath: "qrc:/images/images/lab2.png"
                            name: "<font color='#f97583'>Quick<//font><font color='#B392F0'> sort<//font>"
                            className: ""
                            textCode: "<!-- HTML generated using hilite.me --><div style='background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span style='color: #008800; font-weight: bold'>template</span> <span style='color: #333333'>&lt;</span><span style='color: #008800; font-weight: bold'>typename</span> T, <span style='color: #008800; font-weight: bold'>typename</span> Comparator<span style='color: #333333'>&gt;</span>
<span style='color: #333399; font-weight: bold'>int</span> partition(std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>T<span style='color: #333333'>&gt;&amp;</span> arr, <span style='color: #333399; font-weight: bold'>int</span> low, <span style='color: #333399; font-weight: bold'>int</span> high, Comparator cmp) {
    T pivot <span style='color: #333333'>=</span> arr[high];
    <span style='color: #333399; font-weight: bold'>int</span> i <span style='color: #333333'>=</span> low <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span>;

    <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> j <span style='color: #333333'>=</span> low; j <span style='color: #333333'>&lt;</span> high; <span style='color: #333333'>++</span>j) {
        <span style='color: #008800; font-weight: bold'>if</span> (cmp(arr[j], pivot)) {
            <span style='color: #333333'>++</span>i;
            std<span style='color: #333333'>::</span>swap(arr[i], arr[j]);
        }
    }

    std<span style='color: #333333'>::</span>swap(arr[i <span style='color: #333333'>+</span> <span style='color: #0000DD; font-weight: bold'>1</span>], arr[high]);
    <span style='color: #008800; font-weight: bold'>return</span> i <span style='color: #333333'>+</span> <span style='color: #0000DD; font-weight: bold'>1</span>;
}

<span style='color: #008800; font-weight: bold'>template</span> <span style='color: #333333'>&lt;</span><span style='color: #008800; font-weight: bold'>typename</span> T, <span style='color: #008800; font-weight: bold'>typename</span> Comparator<span style='color: #333333'>&gt;</span>
<span style='color: #333399; font-weight: bold'>void</span> quickSort(std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>T<span style='color: #333333'>&gt;&amp;</span> arr, Comparator cmp) {
    <span style='color: #333399; font-weight: bold'>int</span> size <span style='color: #333333'>=</span> arr.size();
    std<span style='color: #333333'>::</span>stack<span style='color: #333333'>&lt;</span>std<span style='color: #333333'>::</span>pair<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>int</span>, <span style='color: #333399; font-weight: bold'>int</span><span style='color: #333333'>&gt;&gt;</span> stack;

    stack.push({<span style='color: #0000DD; font-weight: bold'>0</span>, size <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span>});

    <span style='color: #008800; font-weight: bold'>while</span> (<span style='color: #333333'>!</span>stack.empty()) {
        <span style='color: #333399; font-weight: bold'>int</span> low <span style='color: #333333'>=</span> stack.top().first;
        <span style='color: #333399; font-weight: bold'>int</span> high <span style='color: #333333'>=</span> stack.top().second;
        stack.pop();

        <span style='color: #008800; font-weight: bold'>if</span> (low <span style='color: #333333'>&lt;</span> high) {
            <span style='color: #333399; font-weight: bold'>int</span> pivotIndex <span style='color: #333333'>=</span> partition(arr, low, high, cmp);

            <span style='color: #888888'>// Push the subarrays onto the stack</span>
            <span style='color: #008800; font-weight: bold'>if</span> (pivotIndex <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span> <span style='color: #333333'>&gt;</span> low) {
                stack.push({low, pivotIndex <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span>});
            }
            <span style='color: #008800; font-weight: bold'>if</span> (pivotIndex <span style='color: #333333'>+</span> <span style='color: #0000DD; font-weight: bold'>1</span> <span style='color: #333333'>&lt;</span> high) {
                stack.push({pivotIndex <span style='color: #333333'>+</span> <span style='color: #0000DD; font-weight: bold'>1</span>, high});
            }
        }
    }
}
</pre></div>
"
                        }
                        Lab1Card {
                            iconPath: "qrc:/images/images/lab2.png"
                            name: "<font color='#f97583'>Shell <//font><font color='#B392F0'> sort<//font>"
                            className: ""
                            textCode: "<!-- HTML generated using hilite.me --><div style='background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span style='color: #008800; font-weight: bold'>template</span> <span style='color: #333333'>&lt;</span><span style='color: #008800; font-weight: bold'>typename</span> T, <span style='color: #008800; font-weight: bold'>typename</span> Comparator<span style='color: #333333'>&gt;</span>
<span style='color: #333399; font-weight: bold'>void</span> shellSort(std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>T<span style='color: #333333'>&gt;</span> <span style='color: #333333'>&amp;</span>arr, Comparator cmp) {
    <span style='color: #333399; font-weight: bold'>int</span> n <span style='color: #333333'>=</span> arr.size();
    <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> gap <span style='color: #333333'>=</span> n <span style='color: #333333'>/</span> <span style='color: #0000DD; font-weight: bold'>2</span>; gap <span style='color: #333333'>&gt;</span> <span style='color: #0000DD; font-weight: bold'>0</span>; gap <span style='color: #333333'>/=</span> <span style='color: #0000DD; font-weight: bold'>2</span>) {
        <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> i <span style='color: #333333'>=</span> gap; i <span style='color: #333333'>&lt;</span> n; <span style='color: #333333'>++</span>i) {
            T temp <span style='color: #333333'>=</span> arr[i];
            <span style='color: #333399; font-weight: bold'>int</span> j;

            <span style='color: #008800; font-weight: bold'>for</span> (j <span style='color: #333333'>=</span> i; j <span style='color: #333333'>&gt;=</span> gap <span style='color: #333333'>&amp;&amp;</span> cmp(arr[j <span style='color: #333333'>-</span> gap], temp); j <span style='color: #333333'>-=</span> gap) {
                arr[j] <span style='color: #333333'>=</span> arr[j <span style='color: #333333'>-</span> gap];
            }

            arr[j] <span style='color: #333333'>=</span> temp;
        }
    }
}
</pre></div>
"
                        }
                        Lab1Card {
                            iconPath: "qrc:/images/images/lab2.png"
                            name: "<font color='#f97583'>Radix<//font><font color='#B392F0'> sort<//font>"
                            className: ""
                            textCode: "<!-- HTML generated using hilite.me --><div style='background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span style='color: #008800; font-weight: bold'>template</span> <span style='color: #333333'>&lt;</span><span style='color: #008800; font-weight: bold'>typename</span> T<span style='color: #333333'>&gt;</span>
<span style='color: #333399; font-weight: bold'>void</span> countSort(std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>T<span style='color: #333333'>&gt;</span> <span style='color: #333333'>&amp;</span>arr, <span style='color: #333399; font-weight: bold'>int</span> exp) {
    <span style='color: #008800; font-weight: bold'>const</span> <span style='color: #333399; font-weight: bold'>int</span> n <span style='color: #333333'>=</span> arr.size();
    std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>T<span style='color: #333333'>&gt;</span> output(n);
    std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>int</span><span style='color: #333333'>&gt;</span> count(<span style='color: #0000DD; font-weight: bold'>10</span>, <span style='color: #0000DD; font-weight: bold'>0</span>);

    <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> i <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>0</span>; i <span style='color: #333333'>&lt;</span> n; <span style='color: #333333'>++</span>i) {
        count[(arr[i] <span style='color: #333333'>/</span> exp) <span style='color: #333333'>%</span> <span style='color: #0000DD; font-weight: bold'>10</span>]<span style='color: #333333'>++</span>;
    }

    <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> i <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>1</span>; i <span style='color: #333333'>&lt;</span> <span style='color: #0000DD; font-weight: bold'>10</span>; <span style='color: #333333'>++</span>i) {
        count[i] <span style='color: #333333'>+=</span> count[i <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span>];
    }

    <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> i <span style='color: #333333'>=</span> n <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span>; i <span style='color: #333333'>&gt;=</span> <span style='color: #0000DD; font-weight: bold'>0</span>; <span style='color: #333333'>--</span>i) {
        output[count[(arr[i] <span style='color: #333333'>/</span> exp) <span style='color: #333333'>%</span> <span style='color: #0000DD; font-weight: bold'>10</span>] <span style='color: #333333'>-</span> <span style='color: #0000DD; font-weight: bold'>1</span>] <span style='color: #333333'>=</span> arr[i];
        count[(arr[i] <span style='color: #333333'>/</span> exp) <span style='color: #333333'>%</span> <span style='color: #0000DD; font-weight: bold'>10</span>]<span style='color: #333333'>--</span>;
    }

    <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> i <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>0</span>; i <span style='color: #333333'>&lt;</span> n; <span style='color: #333333'>++</span>i) {
        arr[i] <span style='color: #333333'>=</span> output[i];
    }
}

<span style='color: #008800; font-weight: bold'>template</span> <span style='color: #333333'>&lt;</span><span style='color: #008800; font-weight: bold'>typename</span> T<span style='color: #333333'>&gt;</span>
<span style='color: #333399; font-weight: bold'>void</span> radixSort(std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>T<span style='color: #333333'>&gt;</span> <span style='color: #333333'>&amp;</span>arr) {
    T maxElement <span style='color: #333333'>=</span> <span style='color: #333333'>*</span>std<span style='color: #333333'>::</span>max_element(arr.begin(), arr.end());

    <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #333399; font-weight: bold'>int</span> exp <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>1</span>; maxElement <span style='color: #333333'>/</span> exp <span style='color: #333333'>&gt;</span> <span style='color: #0000DD; font-weight: bold'>0</span>; exp <span style='color: #333333'>*=</span> <span style='color: #0000DD; font-weight: bold'>10</span>) {
        countSort(arr, exp);
    }
}
</pre></div>
"
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
                    function findMinValueX(series) {
                        var minValue = Number.MAX_VALUE;

                        for (var i = 0; i < series.count; ++i) {
                            var point = series.at(i);
                            if (point.x < minValue) {
                                minValue = point.x;
                            }
                        }

                        return minValue;
                    }
                    function findMinValueY(series) {
                        var minValue = Number.MAX_VALUE;

                        for (var i = 0; i < series.count; ++i) {
                            var point = series.at(i);
                            if (point.y < minValue) {
                                minValue = point.y;
                            }
                        }

                        return minValue;
                    }
                    function findMaxValueX(series) {
                        var minValue = Number.MIN_VALUE;

                        for (var i = 0; i < series.count; ++i) {
                            var point = series.at(i);
                            if (point.x > minValue) {
                                minValue = point.x;
                            }
                        }

                        return minValue;
                    }
                    function findMaxValueY(series) {
                        var minValue = Number.MIN_VALUE;

                        for (var i = 0; i < series.count; ++i) {
                            var point = series.at(i);
                            if (point.y > minValue) {
                                minValue = point.y;
                            }
                        }

                        return minValue;
                    }

                    Pane {
                        Layout.alignment: Qt.AlignHCenter
                        ColumnLayout {
                            ColumnLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "На случайном массиве"
                                    font.styleName: "Bold"
                                    font.family: "Inner"
                                    font.pointSize: 30
                                }
                                RowLayout {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.fillWidth: true
                                    ChartView {
                                        title: "На маленьких данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXRandomSmall
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYRandomSmall
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortRandomSmall
                                            name: "Bubble Sort"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: axisXRandomSmall

                                            axisY: axisYRandomSmall
                                        }

                                        SplineSeries {
                                            id: quickSortRandomSmall
                                            name: "Quick Sort"
                                            axisX: axisXRandomSmall

                                            axisY: axisYRandomSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortRandomSmall
                                            name: "Shell Sort"
                                            axisX: axisXRandomSmall

                                            axisY: axisYRandomSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortRandomSmall
                                            name: "Radix Sort"
                                            axisX: axisXRandomSmall

                                            axisY: axisYRandomSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestRandomSmall
                                            property int start: 1000
                                            property int finish: 10000
                                            property int step: 250
                                            onTestBubbleSortResult: function (n, result) {
                                                bubbleSortRandomSmall.append(
                                                            n, result)
                                                if (bubbleSortRandomSmall.visible){
                                                    if (axisXRandomSmall.min > n)
                                                        axisXRandomSmall.min = n
                                                    if (axisYRandomSmall.min > result)
                                                        axisYRandomSmall.min = result - 0.1
                                                    if (axisXRandomSmall.max < n)
                                                        axisXRandomSmall.max = n
                                                    if (axisYRandomSmall.max < result)
                                                        axisYRandomSmall.max = result + 0.1
                                                }
                                                if (n < sortTestRandomSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestRandomSmall.testBubbleSort(
                                                                n + sortTestRandomSmall.step, TestClassSorts.Random)
                                                }
                                                else{
                                                    exit.enabled = true
                                                }
                                            }
                                            onTestQuickSortResult: function (n, result){
                                                quickSortRandomSmall.append(
                                                            n, result)
                                                if (axisXRandomSmall.min > n)
                                                    axisXRandomSmall.min = n
                                                if (axisYRandomSmall.min > result)
                                                    axisYRandomSmall.min = result - 0.1
                                                if (axisXRandomSmall.max < n)
                                                    axisXRandomSmall.max = n
                                                if (axisYRandomSmall.max < result)
                                                    axisYRandomSmall.max = result + 0.1
                                                if (n < sortTestRandomSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestRandomSmall.testQuickSort(
                                                                n + sortTestRandomSmall.step, TestClassSorts.Random)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestRandomSmall.testShellSort(
                                                                sortTestRandomSmall.start, TestClassSorts.Random)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortRandomSmall.append(
                                                            n, result)
                                                if (axisXRandomSmall.min > n)
                                                    axisXRandomSmall.min = n
                                                if (axisYRandomSmall.min > result)
                                                    axisYRandomSmall.min = result - 0.1
                                                if (axisXRandomSmall.max < n)
                                                    axisXRandomSmall.max = n
                                                if (axisYRandomSmall.max < result)
                                                    axisYRandomSmall.max = result + 0.1
                                                if (n < sortTestRandomSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestRandomSmall.testShellSort(
                                                                n + sortTestRandomSmall.step, TestClassSorts.Random)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestRandomSmall.testRadixSort(
                                                                sortTestRandomSmall.start, TestClassSorts.Random)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortRandomSmall.append(
                                                            n, result)
                                                if (axisXRandomSmall.min > n)
                                                    axisXRandomSmall.min = n
                                                if (axisYRandomSmall.min > result)
                                                    axisYRandomSmall.min = result - 0.1
                                                if (axisXRandomSmall.max < n)
                                                    axisXRandomSmall.max = n
                                                if (axisYRandomSmall.max < result)
                                                    axisYRandomSmall.max = result + 0.1
                                                if (n < sortTestRandomSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestRandomSmall.testRadixSort(
                                                                n + sortTestRandomSmall.step, TestClassSorts.Random)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestRandomSmall.testBubbleSort(
                                                        sortTestRandomSmall.start, TestClassSorts.Random)
                                            sortTestRandomSmall.testQuickSort(
                                                        sortTestRandomSmall.start, TestClassSorts.Random)
                                        }

                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                bubbleSortRandomSmall.visible = !bubbleSortRandomSmall.visible
                                                if (bubbleSortRandomSmall.visible === true){
                                                    axisXRandomSmall.min = tests.findMinValueX(bubbleSortRandomSmall)
                                                    axisXRandomSmall.max = tests.findMaxValueX(bubbleSortRandomSmall)
                                                    axisYRandomSmall.min = tests.findMinValueY(bubbleSortRandomSmall)
                                                    axisYRandomSmall.max = tests.findMaxValueY(bubbleSortRandomSmall)
                                                }
                                                else{
                                                    axisXRandomSmall.min = tests.findMinValueX(quickSortRandomSmall)
                                                    axisXRandomSmall.max = tests.findMaxValueX(quickSortRandomSmall)
                                                    axisYRandomSmall.min = tests.findMinValueY(quickSortRandomSmall)
                                                    axisYRandomSmall.max = tests.findMaxValueY(quickSortRandomSmall)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                    ChartView {
                                        title: "На больших данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXRandomBig
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYRandomBig
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortRandomSma
                                            name: "Bubble Sort"
                                            axisX: axisXRandomBig

                                            axisY: axisYRandomBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            visible: false
                                        }
                                        SplineSeries {
                                            id: quickSortRandomBig
                                            name: "Quick Sort"
                                            axisX: axisXRandomBig

                                            axisY: axisYRandomBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortRandomBig

                                            name: "Shell Sort"
                                            axisX: axisXRandomBig

                                            axisY: axisYRandomBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortRandomBig
                                            name: "Radix Sort"
                                            axisX: axisXRandomBig

                                            axisY: axisYRandomBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestRandomBig
                                            property int start: 100000
                                            property int finish: 1000000
                                            property int step: 100000

                                            onTestQuickSortResult: function (n, result){
                                                quickSortRandomBig.append(
                                                            n, result)
                                                if (axisXRandomBig.min > n)
                                                    axisXRandomBig.min = n
                                                if (axisYRandomBig.min > result)
                                                    axisYRandomBig.min = result - 0.1
                                                if (axisXRandomBig.max < n)
                                                    axisXRandomBig.max = n
                                                if (axisYRandomBig.max < result)
                                                    axisYRandomBig.max = result + 0.1
                                                if (n < sortTestRandomBig.finish) {
                                                    exit.enabled = false
                                                    sortTestRandomBig.testQuickSort(
                                                                n + sortTestRandomBig.step, TestClassSorts.Random)
                                                }
                                                else{
                                                    exit.enabled = true
                                                    //sortTestRandomBig.testShellSort(
                                                     //           sortTestRandomBig.start, TestClassSorts.Random)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortRandomBig.append(
                                                            n, result)
                                                if (axisXRandomBig.min > n)
                                                    axisXRandomBig.min = n
                                                if (axisYRandomBig.min > result)
                                                    axisYRandomBig.min = result - 0.1
                                                if (axisXRandomBig.max < n)
                                                    axisXRandomBig.max = n
                                                if (axisYRandomBig.max < result)
                                                    axisYRandomBig.max = result + 0.1
                                                if (n < sortTestRandomBig.finish) {
                                                    exit.enabled = false
                                                    sortTestRandomBig.testShellSort(
                                                                n + sortTestRandomBig.step, TestClassSorts.Random)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestRandomBig.testRadixSort(
                                                                sortTestRandomBig.start, TestClassSorts.Random)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortRandomBig.append(
                                                            n, result)
                                                if (axisXRandomBig.min > n)
                                                    axisXRandomBig.min = n
                                                if (axisYRandomBig.min > result)
                                                    axisYRandomBig.min = result - 0.1
                                                if (axisXRandomBig.max < n)
                                                    axisXRandomBig.max = n
                                                if (axisYRandomBig.max < result)
                                                    axisYRandomBig.max = result + 0.1
                                                if (n < sortTestRandomBig.finish) {
                                                    exit.enabled = false
                                                    sortTestRandomBig.testRadixSort(
                                                                n + sortTestRandomBig.step, TestClassSorts.Random)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestRandomBig.testQuickSort(
                                                        sortTestRandomBig.start, TestClassSorts.Random)
                                            sortTestRandomBig.testShellSort(
                                                        sortTestRandomBig.start, TestClassSorts.Random)
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                quickSortRandomBig.visible = !quickSortRandomBig.visible
                                                if (quickSortRandomBig.visible === true){
                                                    axisXRandomBig.min = tests.findMinValueX(quickSortRandomBig)
                                                    axisXRandomBig.max = tests.findMaxValueX(quickSortRandomBig)
                                                    axisYRandomBig.min = tests.findMinValueY(quickSortRandomBig)
                                                    axisYRandomBig.max = tests.findMaxValueY(quickSortRandomBig)
                                                }
                                                else{
                                                    axisXRandomBig.min = tests.findMinValueX(shellSortRandomBig)
                                                    axisXRandomBig.max = tests.findMaxValueX(shellSortRandomBig)
                                                    axisYRandomBig.min = tests.findMinValueY(shellSortRandomBig)
                                                    axisYRandomBig.max = tests.findMaxValueY(shellSortRandomBig)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                }
                            }
                            ColumnLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "На массиве с отсортированным началом"
                                    font.styleName: "Bold"
                                    font.family: "Inner"
                                    font.pointSize: 30
                                }
                                RowLayout {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.fillWidth: true
                                    ChartView {
                                        title: "На маленьких данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXSortedBeginSmall
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYSortedBeginSmall
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortSortedBeginSmall
                                            name: "Bubble Sort"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: axisXSortedBeginSmall

                                            axisY: axisYSortedBeginSmall
                                        }

                                        SplineSeries {
                                            id: quickSortSortedBeginSmall
                                            name: "Quick Sort"
                                            axisX: axisXSortedBeginSmall

                                            axisY: axisYSortedBeginSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortSortedBeginSmall
                                            name: "Shell Sort"
                                            axisX: axisXSortedBeginSmall

                                            axisY: axisYSortedBeginSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortSortedBeginSmall
                                            name: "Radix Sort"
                                            axisX: axisXSortedBeginSmall

                                            axisY: axisYSortedBeginSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestSortedBeginSmall
                                            property int start: 1000
                                            property int finish: 10000
                                            property int step: 250
                                            onTestBubbleSortResult: function (n, result) {
                                                bubbleSortSortedBeginSmall.append(
                                                            n, result)
                                                if (bubbleSortSortedBeginSmall.visible){
                                                    if (axisXSortedBeginSmall.min > n)
                                                        axisXSortedBeginSmall.min = n
                                                    if (axisYSortedBeginSmall.min > result)
                                                        axisYSortedBeginSmall.min = result - 0.1
                                                    if (axisXSortedBeginSmall.max < n)
                                                        axisXSortedBeginSmall.max = n
                                                    if (axisYSortedBeginSmall.max < result)
                                                        axisYSortedBeginSmall.max = result + 0.1
                                                }
                                                if (n < sortTestSortedBeginSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBeginSmall.testBubbleSort(
                                                                n + sortTestSortedBeginSmall.step, TestClassSorts.SortedBegin)
                                                }
                                                else{
                                                    exit.enabled = true
                                                }
                                            }
                                            onTestQuickSortResult: function (n, result){
                                                quickSortSortedBeginSmall.append(
                                                            n, result)
                                                if (axisXSortedBeginSmall.min > n)
                                                    axisXSortedBeginSmall.min = n
                                                if (axisYSortedBeginSmall.min > result)
                                                    axisYSortedBeginSmall.min = result - 0.1
                                                if (axisXSortedBeginSmall.max < n)
                                                    axisXSortedBeginSmall.max = n
                                                if (axisYSortedBeginSmall.max < result)
                                                    axisYSortedBeginSmall.max = result + 0.1
                                                if (n < sortTestSortedBeginSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBeginSmall.testQuickSort(
                                                                n + sortTestSortedBeginSmall.step, TestClassSorts.SortedBegin)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedBeginSmall.testShellSort(
                                                                sortTestSortedBeginSmall.start, TestClassSorts.SortedBegin)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortSortedBeginSmall.append(
                                                            n, result)
                                                if (axisXSortedBeginSmall.min > n)
                                                    axisXSortedBeginSmall.min = n
                                                if (axisYSortedBeginSmall.min > result)
                                                    axisYSortedBeginSmall.min = result - 0.1
                                                if (axisXSortedBeginSmall.max < n)
                                                    axisXSortedBeginSmall.max = n
                                                if (axisYSortedBeginSmall.max < result)
                                                    axisYSortedBeginSmall.max = result + 0.1
                                                if (n < sortTestSortedBeginSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBeginSmall.testShellSort(
                                                                n + sortTestSortedBeginSmall.step, TestClassSorts.SortedBegin)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedBeginSmall.testRadixSort(
                                                                sortTestSortedBeginSmall.start, TestClassSorts.SortedBegin)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortSortedBeginSmall.append(
                                                            n, result)
                                                if (axisXSortedBeginSmall.min > n)
                                                    axisXSortedBeginSmall.min = n
                                                if (axisYSortedBeginSmall.min > result)
                                                    axisYSortedBeginSmall.min = result - 0.1
                                                if (axisXSortedBeginSmall.max < n)
                                                    axisXSortedBeginSmall.max = n
                                                if (axisYSortedBeginSmall.max < result)
                                                    axisYSortedBeginSmall.max = result + 0.1
                                                if (n < sortTestSortedBeginSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBeginSmall.testRadixSort(
                                                                n + sortTestSortedBeginSmall.step, TestClassSorts.SortedBegin)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestSortedBeginSmall.testBubbleSort(
                                                        sortTestSortedBeginSmall.start, TestClassSorts.SortedBegin)
                                            sortTestSortedBeginSmall.testQuickSort(
                                                        sortTestSortedBeginSmall.start, TestClassSorts.SortedBegin)
                                        }

                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                bubbleSortSortedBeginSmall.visible = !bubbleSortSortedBeginSmall.visible
                                                if (bubbleSortSortedBeginSmall.visible === true){
                                                    axisXSortedBeginSmall.min = tests.findMinValueX(bubbleSortSortedBeginSmall)
                                                    axisXSortedBeginSmall.max = tests.findMaxValueX(bubbleSortSortedBeginSmall)
                                                    axisYSortedBeginSmall.min = tests.findMinValueY(bubbleSortSortedBeginSmall)
                                                    axisYSortedBeginSmall.max = tests.findMaxValueY(bubbleSortSortedBeginSmall)
                                                }
                                                else{
                                                    axisXSortedBeginSmall.min = tests.findMinValueX(quickSortSortedBeginSmall)
                                                    axisXSortedBeginSmall.max = tests.findMaxValueX(quickSortSortedBeginSmall)
                                                    axisYSortedBeginSmall.min = tests.findMinValueY(quickSortSortedBeginSmall)
                                                    axisYSortedBeginSmall.max = tests.findMaxValueY(quickSortSortedBeginSmall)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                    ChartView {
                                        title: "На больших данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXSortedBeginBig
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYSortedBeginBig
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortSortedBeginSma
                                            name: "Bubble Sort"
                                            axisX: axisXSortedBeginBig

                                            axisY: axisYSortedBeginBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            visible: false
                                        }
                                        SplineSeries {
                                            id: quickSortSortedBeginBig
                                            name: "Quick Sort"
                                            axisX: axisXSortedBeginBig

                                            axisY: axisYSortedBeginBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortSortedBeginBig

                                            name: "Shell Sort"
                                            axisX: axisXSortedBeginBig

                                            axisY: axisYSortedBeginBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortSortedBeginBig
                                            name: "Radix Sort"
                                            axisX: axisXSortedBeginBig

                                            axisY: axisYSortedBeginBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestSortedBeginBig
                                            property int start: 100000
                                            property int finish: 1000000
                                            property int step: 100000

                                            onTestQuickSortResult: function (n, result){
                                                quickSortSortedBeginBig.append(
                                                            n, result)
                                                if (axisXSortedBeginBig.min > n)
                                                    axisXSortedBeginBig.min = n
                                                if (axisYSortedBeginBig.min > result)
                                                    axisYSortedBeginBig.min = result - 0.1
                                                if (axisXSortedBeginBig.max < n)
                                                    axisXSortedBeginBig.max = n
                                                if (axisYSortedBeginBig.max < result)
                                                    axisYSortedBeginBig.max = result + 0.1
                                                if (n < sortTestSortedBeginBig.finish/2) {
                                                    exit.enabled = false
                                                    sortTestSortedBeginBig.testQuickSort(
                                                                n + sortTestSortedBeginBig.step, TestClassSorts.SortedBegin)
                                                }
                                                else{
                                                    exit.enabled = true
                                                    //sortTestSortedBeginBig.testShellSort(
                                                     //           sortTestSortedBeginBig.start, TestClassSorts.SortedBegin)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortSortedBeginBig.append(
                                                            n, result)
                                                if (axisXSortedBeginBig.min > n)
                                                    axisXSortedBeginBig.min = n
                                                if (axisYSortedBeginBig.min > result)
                                                    axisYSortedBeginBig.min = result - 0.1
                                                if (axisXSortedBeginBig.max < n)
                                                    axisXSortedBeginBig.max = n
                                                if (axisYSortedBeginBig.max < result)
                                                    axisYSortedBeginBig.max = result + 0.1
                                                if (n < sortTestSortedBeginBig.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBeginBig.testShellSort(
                                                                n + sortTestSortedBeginBig.step, TestClassSorts.SortedBegin)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedBeginBig.testRadixSort(
                                                                sortTestSortedBeginBig.start, TestClassSorts.SortedBegin)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortSortedBeginBig.append(
                                                            n, result)
                                                if (axisXSortedBeginBig.min > n)
                                                    axisXSortedBeginBig.min = n
                                                if (axisYSortedBeginBig.min > result)
                                                    axisYSortedBeginBig.min = result - 0.1
                                                if (axisXSortedBeginBig.max < n)
                                                    axisXSortedBeginBig.max = n
                                                if (axisYSortedBeginBig.max < result)
                                                    axisYSortedBeginBig.max = result + 0.1
                                                if (n < sortTestSortedBeginBig.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBeginBig.testRadixSort(
                                                                n + sortTestSortedBeginBig.step, TestClassSorts.SortedBegin)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestSortedBeginBig.testQuickSort(
                                                        sortTestSortedBeginBig.start, TestClassSorts.SortedBegin)
                                            sortTestSortedBeginBig.testShellSort(
                                                        sortTestSortedBeginBig.start, TestClassSorts.SortedBegin)
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                quickSortSortedBeginBig.visible = !quickSortSortedBeginBig.visible
                                                if (quickSortSortedBeginBig.visible === true){
                                                    axisXSortedBeginBig.min = tests.findMinValueX(shellSortSortedBeginBig)
                                                    axisXSortedBeginBig.max = tests.findMaxValueX(shellSortSortedBeginBig)
                                                    axisYSortedBeginBig.min = tests.findMinValueY(quickSortSortedBeginBig)
                                                    axisYSortedBeginBig.max = tests.findMaxValueY(quickSortSortedBeginBig)
                                                }
                                                else{
                                                    axisXSortedBeginBig.min = tests.findMinValueX(shellSortSortedBeginBig)
                                                    axisXSortedBeginBig.max = tests.findMaxValueX(shellSortSortedBeginBig)
                                                    axisYSortedBeginBig.min = tests.findMinValueY(shellSortSortedBeginBig)
                                                    axisYSortedBeginBig.max = tests.findMaxValueY(shellSortSortedBeginBig)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                }
                            }
                            ColumnLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "На массиве с отсортированным концом"
                                    font.styleName: "Bold"
                                    font.family: "Inner"
                                    font.pointSize: 30
                                }
                                RowLayout {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.fillWidth: true
                                    ChartView {
                                        title: "На маленьких данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXSortedEndSmall
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYSortedEndSmall
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortSortedEndSmall
                                            name: "Bubble Sort"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: axisXSortedEndSmall

                                            axisY: axisYSortedEndSmall
                                        }

                                        SplineSeries {
                                            id: quickSortSortedEndSmall
                                            name: "Quick Sort"
                                            axisX: axisXSortedEndSmall

                                            axisY: axisYSortedEndSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortSortedEndSmall
                                            name: "Shell Sort"
                                            axisX: axisXSortedEndSmall

                                            axisY: axisYSortedEndSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortSortedEndSmall
                                            name: "Radix Sort"
                                            axisX: axisXSortedEndSmall

                                            axisY: axisYSortedEndSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestSortedEndSmall
                                            property int start: 1000
                                            property int finish: 10000
                                            property int step: 250
                                            onTestBubbleSortResult: function (n, result) {
                                                bubbleSortSortedEndSmall.append(
                                                            n, result)
                                                if (bubbleSortSortedEndSmall.visible){
                                                    if (axisXSortedEndSmall.min > n)
                                                        axisXSortedEndSmall.min = n
                                                    if (axisYSortedEndSmall.min > result)
                                                        axisYSortedEndSmall.min = result - 0.1
                                                    if (axisXSortedEndSmall.max < n)
                                                        axisXSortedEndSmall.max = n
                                                    if (axisYSortedEndSmall.max < result)
                                                        axisYSortedEndSmall.max = result + 0.1
                                                }
                                                if (n < sortTestSortedEndSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedEndSmall.testBubbleSort(
                                                                n + sortTestSortedEndSmall.step, TestClassSorts.SortedEnd)
                                                }
                                                else{
                                                    exit.enabled = true
                                                }
                                            }
                                            onTestQuickSortResult: function (n, result){
                                                quickSortSortedEndSmall.append(
                                                            n, result)
                                                if (axisXSortedEndSmall.min > n)
                                                    axisXSortedEndSmall.min = n
                                                if (axisYSortedEndSmall.min > result)
                                                    axisYSortedEndSmall.min = result - 0.1
                                                if (axisXSortedEndSmall.max < n)
                                                    axisXSortedEndSmall.max = n
                                                if (axisYSortedEndSmall.max < result)
                                                    axisYSortedEndSmall.max = result + 0.1
                                                if (n < sortTestSortedEndSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedEndSmall.testQuickSort(
                                                                n + sortTestSortedEndSmall.step, TestClassSorts.SortedEnd)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedEndSmall.testShellSort(
                                                                sortTestSortedEndSmall.start, TestClassSorts.SortedEnd)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortSortedEndSmall.append(
                                                            n, result)
                                                if (axisXSortedEndSmall.min > n)
                                                    axisXSortedEndSmall.min = n
                                                if (axisYSortedEndSmall.min > result)
                                                    axisYSortedEndSmall.min = result - 0.1
                                                if (axisXSortedEndSmall.max < n)
                                                    axisXSortedEndSmall.max = n
                                                if (axisYSortedEndSmall.max < result)
                                                    axisYSortedEndSmall.max = result + 0.1
                                                if (n < sortTestSortedEndSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedEndSmall.testShellSort(
                                                                n + sortTestSortedEndSmall.step, TestClassSorts.SortedEnd)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedEndSmall.testRadixSort(
                                                                sortTestSortedEndSmall.start, TestClassSorts.SortedEnd)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortSortedEndSmall.append(
                                                            n, result)
                                                if (axisXSortedEndSmall.min > n)
                                                    axisXSortedEndSmall.min = n
                                                if (axisYSortedEndSmall.min > result)
                                                    axisYSortedEndSmall.min = result - 0.1
                                                if (axisXSortedEndSmall.max < n)
                                                    axisXSortedEndSmall.max = n
                                                if (axisYSortedEndSmall.max < result)
                                                    axisYSortedEndSmall.max = result + 0.1
                                                if (n < sortTestSortedEndSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedEndSmall.testRadixSort(
                                                                n + sortTestSortedEndSmall.step, TestClassSorts.SortedEnd)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestSortedEndSmall.testBubbleSort(
                                                        sortTestSortedEndSmall.start, TestClassSorts.SortedEnd)
                                            sortTestSortedEndSmall.testQuickSort(
                                                        sortTestSortedEndSmall.start, TestClassSorts.SortedEnd)
                                        }

                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                bubbleSortSortedEndSmall.visible = !bubbleSortSortedEndSmall.visible
                                                if (bubbleSortSortedEndSmall.visible === true){
                                                    axisXSortedEndSmall.min = tests.findMinValueX(bubbleSortSortedEndSmall)
                                                    axisXSortedEndSmall.max = tests.findMaxValueX(bubbleSortSortedEndSmall)
                                                    axisYSortedEndSmall.min = tests.findMinValueY(bubbleSortSortedEndSmall)
                                                    axisYSortedEndSmall.max = tests.findMaxValueY(bubbleSortSortedEndSmall)
                                                }
                                                else{
                                                    axisXSortedEndSmall.min = tests.findMinValueX(quickSortSortedEndSmall)
                                                    axisXSortedEndSmall.max = tests.findMaxValueX(quickSortSortedEndSmall)
                                                    axisYSortedEndSmall.min = tests.findMinValueY(quickSortSortedEndSmall)
                                                    axisYSortedEndSmall.max = tests.findMaxValueY(quickSortSortedEndSmall)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                    ChartView {
                                        title: "На больших данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXSortedEndBig
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYSortedEndBig
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortSortedEndSma
                                            name: "Bubble Sort"
                                            axisX: axisXSortedEndBig

                                            axisY: axisYSortedEndBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            visible: false
                                        }
                                        SplineSeries {
                                            id: quickSortSortedEndBig
                                            name: "Quick Sort"
                                            axisX: axisXSortedEndBig

                                            axisY: axisYSortedEndBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortSortedEndBig

                                            name: "Shell Sort"
                                            axisX: axisXSortedEndBig

                                            axisY: axisYSortedEndBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortSortedEndBig
                                            name: "Radix Sort"
                                            axisX: axisXSortedEndBig

                                            axisY: axisYSortedEndBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestSortedEndBig
                                            property int start: 100000
                                            property int finish: 1000000
                                            property int step: 100000

                                            onTestQuickSortResult: function (n, result){
                                                quickSortSortedEndBig.append(
                                                            n, result)
                                                if (axisXSortedEndBig.min > n)
                                                    axisXSortedEndBig.min = n
                                                if (axisYSortedEndBig.min > result)
                                                    axisYSortedEndBig.min = result - 0.1
                                                if (axisXSortedEndBig.max < n)
                                                    axisXSortedEndBig.max = n
                                                if (axisYSortedEndBig.max < result)
                                                    axisYSortedEndBig.max = result + 0.1
                                                if (n < sortTestSortedEndBig.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedEndBig.testQuickSort(
                                                                n + sortTestSortedEndBig.step, TestClassSorts.SortedEnd)
                                                }
                                                else{
                                                    exit.enabled = true
                                                    //sortTestSortedEndBig.testShellSort(
                                                     //           sortTestSortedEndBig.start, TestClassSorts.SortedEnd)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortSortedEndBig.append(
                                                            n, result)
                                                if (axisXSortedEndBig.min > n)
                                                    axisXSortedEndBig.min = n
                                                if (axisYSortedEndBig.min > result)
                                                    axisYSortedEndBig.min = result - 0.1
                                                if (axisXSortedEndBig.max < n)
                                                    axisXSortedEndBig.max = n
                                                if (axisYSortedEndBig.max < result)
                                                    axisYSortedEndBig.max = result + 0.1
                                                if (n < sortTestSortedEndBig.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedEndBig.testShellSort(
                                                                n + sortTestSortedEndBig.step, TestClassSorts.SortedEnd)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedEndBig.testRadixSort(
                                                                sortTestSortedEndBig.start, TestClassSorts.SortedEnd)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortSortedEndBig.append(
                                                            n, result)
                                                if (axisXSortedEndBig.min > n)
                                                    axisXSortedEndBig.min = n
                                                if (axisYSortedEndBig.min > result)
                                                    axisYSortedEndBig.min = result - 0.1
                                                if (axisXSortedEndBig.max < n)
                                                    axisXSortedEndBig.max = n
                                                if (axisYSortedEndBig.max < result)
                                                    axisYSortedEndBig.max = result + 0.1
                                                if (n < sortTestSortedEndBig.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedEndBig.testRadixSort(
                                                                n + sortTestSortedEndBig.step, TestClassSorts.SortedEnd)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestSortedEndBig.testQuickSort(
                                                        sortTestSortedEndBig.start, TestClassSorts.SortedEnd)
                                            sortTestSortedEndBig.testShellSort(
                                                        sortTestSortedEndBig.start, TestClassSorts.SortedEnd)
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                quickSortSortedEndBig.visible = !quickSortSortedEndBig.visible
                                                if (quickSortSortedEndBig.visible === true){
                                                    axisXSortedEndBig.min = tests.findMinValueX(quickSortSortedEndBig)
                                                    axisXSortedEndBig.max = tests.findMaxValueX(quickSortSortedEndBig)
                                                    axisYSortedEndBig.min = tests.findMinValueY(quickSortSortedEndBig)
                                                    axisYSortedEndBig.max = tests.findMaxValueY(quickSortSortedEndBig)
                                                }
                                                else{
                                                    axisXSortedEndBig.min = tests.findMinValueX(shellSortSortedEndBig)
                                                    axisXSortedEndBig.max = tests.findMaxValueX(shellSortSortedEndBig)
                                                    axisYSortedEndBig.min = tests.findMinValueY(shellSortSortedEndBig)
                                                    axisYSortedEndBig.max = tests.findMaxValueY(shellSortSortedEndBig)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                }
                            }
                            ColumnLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "На отсортированном массиве"
                                    font.styleName: "Bold"
                                    font.family: "Inner"
                                    font.pointSize: 30
                                }
                                RowLayout {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.fillWidth: true
                                    ChartView {
                                        title: "На маленьких данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXSortedSmall
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYSortedSmall
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortSortedSmall
                                            name: "Bubble Sort"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: axisXSortedSmall

                                            axisY: axisYSortedSmall
                                        }

                                        SplineSeries {
                                            id: quickSortSortedSmall
                                            name: "Quick Sort"
                                            axisX: axisXSortedSmall

                                            axisY: axisYSortedSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortSortedSmall
                                            name: "Shell Sort"
                                            axisX: axisXSortedSmall

                                            axisY: axisYSortedSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortSortedSmall
                                            name: "Radix Sort"
                                            axisX: axisXSortedSmall

                                            axisY: axisYSortedSmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestSortedSmall
                                            property int start: 1000
                                            property int finish: 10000
                                            property int step: 250
                                            onTestBubbleSortResult: function (n, result) {
                                                bubbleSortSortedSmall.append(
                                                            n, result)
                                                if (bubbleSortSortedSmall.visible){
                                                    if (axisXSortedSmall.min > n)
                                                        axisXSortedSmall.min = n
                                                    if (axisYSortedSmall.min > result)
                                                        axisYSortedSmall.min = result - 0.1
                                                    if (axisXSortedSmall.max < n)
                                                        axisXSortedSmall.max = n
                                                    if (axisYSortedSmall.max < result)
                                                        axisYSortedSmall.max = result + 0.1
                                                }
                                                if (n < sortTestSortedSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedSmall.testBubbleSort(
                                                                n + sortTestSortedSmall.step, TestClassSorts.Sorted)
                                                }
                                                else{
                                                    exit.enabled = true
                                                }
                                            }
                                            onTestQuickSortResult: function (n, result){
                                                quickSortSortedSmall.append(
                                                            n, result)
                                                if (axisXSortedSmall.min > n)
                                                    axisXSortedSmall.min = n
                                                if (axisYSortedSmall.min > result)
                                                    axisYSortedSmall.min = result - 0.1
                                                if (axisXSortedSmall.max < n)
                                                    axisXSortedSmall.max = n
                                                if (axisYSortedSmall.max < result)
                                                    axisYSortedSmall.max = result + 0.1
                                                if (n < sortTestSortedSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedSmall.testQuickSort(
                                                                n + sortTestSortedSmall.step, TestClassSorts.Sorted)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedSmall.testShellSort(
                                                                sortTestSortedSmall.start, TestClassSorts.Sorted)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortSortedSmall.append(
                                                            n, result)
                                                if (axisXSortedSmall.min > n)
                                                    axisXSortedSmall.min = n
                                                if (axisYSortedSmall.min > result)
                                                    axisYSortedSmall.min = result - 0.1
                                                if (axisXSortedSmall.max < n)
                                                    axisXSortedSmall.max = n
                                                if (axisYSortedSmall.max < result)
                                                    axisYSortedSmall.max = result + 0.1
                                                if (n < sortTestSortedSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedSmall.testShellSort(
                                                                n + sortTestSortedSmall.step, TestClassSorts.Sorted)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedSmall.testRadixSort(
                                                                sortTestSortedSmall.start, TestClassSorts.Sorted)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortSortedSmall.append(
                                                            n, result)
                                                if (axisXSortedSmall.min > n)
                                                    axisXSortedSmall.min = n
                                                if (axisYSortedSmall.min > result)
                                                    axisYSortedSmall.min = result - 0.1
                                                if (axisXSortedSmall.max < n)
                                                    axisXSortedSmall.max = n
                                                if (axisYSortedSmall.max < result)
                                                    axisYSortedSmall.max = result + 0.1
                                                if (n < sortTestSortedSmall.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedSmall.testRadixSort(
                                                                n + sortTestSortedSmall.step, TestClassSorts.Sorted)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestSortedSmall.testBubbleSort(
                                                        sortTestSortedSmall.start, TestClassSorts.Sorted)
                                            sortTestSortedSmall.testQuickSort(
                                                        sortTestSortedSmall.start, TestClassSorts.Sorted)
                                        }

                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                bubbleSortSortedSmall.visible = !bubbleSortSortedSmall.visible
                                                if (bubbleSortSortedSmall.visible === true){
                                                    axisXSortedSmall.min = tests.findMinValueX(bubbleSortSortedSmall)
                                                    axisXSortedSmall.max = tests.findMaxValueX(bubbleSortSortedSmall)
                                                    axisYSortedSmall.min = tests.findMinValueY(bubbleSortSortedSmall)
                                                    axisYSortedSmall.max = tests.findMaxValueY(bubbleSortSortedSmall)
                                                }
                                                else{
                                                    axisXSortedSmall.min = tests.findMinValueX(quickSortSortedSmall)
                                                    axisXSortedSmall.max = tests.findMaxValueX(quickSortSortedSmall)
                                                    axisYSortedSmall.min = tests.findMinValueY(quickSortSortedSmall)
                                                    axisYSortedSmall.max = tests.findMaxValueY(quickSortSortedSmall)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                    ChartView {
                                        title: "На больших данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXSortedBig
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYSortedBig
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortSortedSma
                                            name: "Bubble Sort"
                                            axisX: axisXSortedBig

                                            axisY: axisYSortedBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            visible: false
                                        }
                                        SplineSeries {
                                            id: quickSortSortedBig
                                            name: "Quick Sort"
                                            axisX: axisXSortedBig

                                            axisY: axisYSortedBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortSortedBig

                                            name: "Shell Sort"
                                            axisX: axisXSortedBig

                                            axisY: axisYSortedBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortSortedBig
                                            name: "Radix Sort"
                                            axisX: axisXSortedBig

                                            axisY: axisYSortedBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestSortedBig
                                            property int start: 100000
                                            property int finish: 1000000
                                            property int step: 100000

                                            onTestQuickSortResult: function (n, result){
                                                quickSortSortedBig.append(
                                                            n, result)
                                                if (axisXSortedBig.min > n)
                                                    axisXSortedBig.min = n
                                                if (axisYSortedBig.min > result)
                                                    axisYSortedBig.min = result - 0.1
                                                if (axisXSortedBig.max < n)
                                                    axisXSortedBig.max = n
                                                if (axisYSortedBig.max < result)
                                                    axisYSortedBig.max = result + 0.1
                                                if (n < sortTestSortedBig.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBig.testQuickSort(
                                                                n + sortTestSortedBig.step, TestClassSorts.Sorted)
                                                }
                                                else{
                                                    exit.enabled = true
                                                    //sortTestSortedBig.testShellSort(
                                                     //           sortTestSortedBig.start, TestClassSorts.Sorted)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortSortedBig.append(
                                                            n, result)
                                                if (axisXSortedBig.min > n)
                                                    axisXSortedBig.min = n
                                                if (axisYSortedBig.min > result)
                                                    axisYSortedBig.min = result - 0.1
                                                if (axisXSortedBig.max < n)
                                                    axisXSortedBig.max = n
                                                if (axisYSortedBig.max < result)
                                                    axisYSortedBig.max = result + 0.1
                                                if (n < sortTestSortedBig.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBig.testShellSort(
                                                                n + sortTestSortedBig.step, TestClassSorts.Sorted)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestSortedBig.testRadixSort(
                                                                sortTestSortedBig.start, TestClassSorts.Sorted)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortSortedBig.append(
                                                            n, result)
                                                if (axisXSortedBig.min > n)
                                                    axisXSortedBig.min = n
                                                if (axisYSortedBig.min > result)
                                                    axisYSortedBig.min = result - 0.1
                                                if (axisXSortedBig.max < n)
                                                    axisXSortedBig.max = n
                                                if (axisYSortedBig.max < result)
                                                    axisYSortedBig.max = result + 0.1
                                                if (n < sortTestSortedBig.finish) {
                                                    exit.enabled = false
                                                    sortTestSortedBig.testRadixSort(
                                                                n + sortTestSortedBig.step, TestClassSorts.Sorted)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestSortedBig.testQuickSort(
                                                        sortTestSortedBig.start, TestClassSorts.Sorted)
                                            sortTestSortedBig.testShellSort(
                                                        sortTestSortedBig.start, TestClassSorts.Sorted)
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                quickSortSortedBig.visible = !quickSortSortedBig.visible
                                                if (quickSortSortedBig.visible === true){
                                                    axisXSortedBig.min = tests.findMinValueX(quickSortSortedBig)
                                                    axisXSortedBig.max = tests.findMaxValueX(quickSortSortedBig)
                                                    axisYSortedBig.min = tests.findMinValueY(quickSortSortedBig)
                                                    axisYSortedBig.max = tests.findMaxValueY(quickSortSortedBig)
                                                }
                                                else{
                                                    axisXSortedBig.min = tests.findMinValueX(shellSortSortedBig)
                                                    axisXSortedBig.max = tests.findMaxValueX(shellSortSortedBig)
                                                    axisYSortedBig.min = tests.findMinValueY(shellSortSortedBig)
                                                    axisYSortedBig.max = tests.findMaxValueY(shellSortSortedBig)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                }
                            }
                            ColumnLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "На массиве с большим числом повторов"
                                    font.styleName: "Bold"
                                    font.family: "Inner"
                                    font.pointSize: 30
                                }
                                RowLayout {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.fillWidth: true
                                    ChartView {
                                        title: "На маленьких данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXManyOrdinarySmall
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYManyOrdinarySmall
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortManyOrdinarySmall
                                            name: "Bubble Sort"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: axisXManyOrdinarySmall

                                            axisY: axisYManyOrdinarySmall
                                        }

                                        SplineSeries {
                                            id: quickSortManyOrdinarySmall
                                            name: "Quick Sort"
                                            axisX: axisXManyOrdinarySmall

                                            axisY: axisYManyOrdinarySmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortManyOrdinarySmall
                                            name: "Shell Sort"
                                            axisX: axisXManyOrdinarySmall

                                            axisY: axisYManyOrdinarySmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortManyOrdinarySmall
                                            name: "Radix Sort"
                                            axisX: axisXManyOrdinarySmall

                                            axisY: axisYManyOrdinarySmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestManyOrdinarySmall
                                            property int start: 1000
                                            property int finish: 10000
                                            property int step: 250
                                            onTestBubbleSortResult: function (n, result) {
                                                bubbleSortManyOrdinarySmall.append(
                                                            n, result)
                                                if (bubbleSortManyOrdinarySmall.visible){
                                                    if (axisXManyOrdinarySmall.min > n)
                                                        axisXManyOrdinarySmall.min = n
                                                    if (axisYManyOrdinarySmall.min > result)
                                                        axisYManyOrdinarySmall.min = result - 0.1
                                                    if (axisXManyOrdinarySmall.max < n)
                                                        axisXManyOrdinarySmall.max = n
                                                    if (axisYManyOrdinarySmall.max < result)
                                                        axisYManyOrdinarySmall.max = result + 0.1
                                                }
                                                if (n < sortTestManyOrdinarySmall.finish) {
                                                    exit.enabled = false
                                                    sortTestManyOrdinarySmall.testBubbleSort(
                                                                n + sortTestManyOrdinarySmall.step, TestClassSorts.ManyOrdinary)
                                                }
                                                else{
                                                    exit.enabled = true
                                                }
                                            }
                                            onTestQuickSortResult: function (n, result){
                                                quickSortManyOrdinarySmall.append(
                                                            n, result)
                                                if (axisXManyOrdinarySmall.min > n)
                                                    axisXManyOrdinarySmall.min = n
                                                if (axisYManyOrdinarySmall.min > result)
                                                    axisYManyOrdinarySmall.min = result - 0.1
                                                if (axisXManyOrdinarySmall.max < n)
                                                    axisXManyOrdinarySmall.max = n
                                                if (axisYManyOrdinarySmall.max < result)
                                                    axisYManyOrdinarySmall.max = result + 0.1
                                                if (n < sortTestManyOrdinarySmall.finish) {
                                                    exit.enabled = false
                                                    sortTestManyOrdinarySmall.testQuickSort(
                                                                n + sortTestManyOrdinarySmall.step, TestClassSorts.ManyOrdinary)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestManyOrdinarySmall.testShellSort(
                                                                sortTestManyOrdinarySmall.start, TestClassSorts.ManyOrdinary)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortManyOrdinarySmall.append(
                                                            n, result)
                                                if (axisXManyOrdinarySmall.min > n)
                                                    axisXManyOrdinarySmall.min = n
                                                if (axisYManyOrdinarySmall.min > result)
                                                    axisYManyOrdinarySmall.min = result - 0.1
                                                if (axisXManyOrdinarySmall.max < n)
                                                    axisXManyOrdinarySmall.max = n
                                                if (axisYManyOrdinarySmall.max < result)
                                                    axisYManyOrdinarySmall.max = result + 0.1
                                                if (n < sortTestManyOrdinarySmall.finish) {
                                                    exit.enabled = false
                                                    sortTestManyOrdinarySmall.testShellSort(
                                                                n + sortTestManyOrdinarySmall.step, TestClassSorts.ManyOrdinary)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestManyOrdinarySmall.testRadixSort(
                                                                sortTestManyOrdinarySmall.start, TestClassSorts.ManyOrdinary)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortManyOrdinarySmall.append(
                                                            n, result)
                                                if (axisXManyOrdinarySmall.min > n)
                                                    axisXManyOrdinarySmall.min = n
                                                if (axisYManyOrdinarySmall.min > result)
                                                    axisYManyOrdinarySmall.min = result - 0.1
                                                if (axisXManyOrdinarySmall.max < n)
                                                    axisXManyOrdinarySmall.max = n
                                                if (axisYManyOrdinarySmall.max < result)
                                                    axisYManyOrdinarySmall.max = result + 0.1
                                                if (n < sortTestManyOrdinarySmall.finish) {
                                                    exit.enabled = false
                                                    sortTestManyOrdinarySmall.testRadixSort(
                                                                n + sortTestManyOrdinarySmall.step, TestClassSorts.ManyOrdinary)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestManyOrdinarySmall.testBubbleSort(
                                                        sortTestManyOrdinarySmall.start, TestClassSorts.ManyOrdinary)
                                            sortTestManyOrdinarySmall.testQuickSort(
                                                        sortTestManyOrdinarySmall.start, TestClassSorts.ManyOrdinary)
                                        }

                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                bubbleSortManyOrdinarySmall.visible = !bubbleSortManyOrdinarySmall.visible
                                                if (bubbleSortManyOrdinarySmall.visible === true){
                                                    axisXManyOrdinarySmall.min = tests.findMinValueX(bubbleSortManyOrdinarySmall)
                                                    axisXManyOrdinarySmall.max = tests.findMaxValueX(bubbleSortManyOrdinarySmall)
                                                    axisYManyOrdinarySmall.min = tests.findMinValueY(bubbleSortManyOrdinarySmall)
                                                    axisYManyOrdinarySmall.max = tests.findMaxValueY(bubbleSortManyOrdinarySmall)
                                                }
                                                else{
                                                    axisXManyOrdinarySmall.min = tests.findMinValueX(quickSortManyOrdinarySmall)
                                                    axisXManyOrdinarySmall.max = tests.findMaxValueX(quickSortManyOrdinarySmall)
                                                    axisYManyOrdinarySmall.min = tests.findMinValueY(quickSortManyOrdinarySmall)
                                                    axisYManyOrdinarySmall.max = tests.findMaxValueY(quickSortManyOrdinarySmall)
                                                }
                                                parent.update()
                                            }
                                        }
                                    }

                                    ChartView {
                                        title: "На больших данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"

                                        ValuesAxis {
                                            id: axisXManyOrdinaryBig
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: axisYManyOrdinaryBig
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: bubbleSortManyOrdinarySma
                                            name: "Bubble Sort"
                                            axisX: axisXManyOrdinaryBig

                                            axisY: axisYManyOrdinaryBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            visible: false
                                        }
                                        SplineSeries {
                                            id: quickSortManyOrdinaryBig
                                            name: "Quick Sort"
                                            axisX: axisXManyOrdinaryBig

                                            axisY: axisYManyOrdinaryBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: shellSortManyOrdinaryBig

                                            name: "Shell Sort"
                                            axisX: axisXManyOrdinaryBig

                                            axisY: axisYManyOrdinaryBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: radixSortManyOrdinaryBig
                                            name: "Radix Sort"
                                            axisX: axisXManyOrdinaryBig

                                            axisY: axisYManyOrdinaryBig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSorts {
                                            id: sortTestManyOrdinaryBig
                                            property int start: 100000
                                            property int finish: 1000000
                                            property int step: 100000

                                            onTestQuickSortResult: function (n, result){
                                                quickSortManyOrdinaryBig.append(
                                                            n, result)
                                                if (axisXManyOrdinaryBig.min > n)
                                                    axisXManyOrdinaryBig.min = n
                                                if (axisYManyOrdinaryBig.min > result)
                                                    axisYManyOrdinaryBig.min = result - 0.1
                                                if (axisXManyOrdinaryBig.max < n)
                                                    axisXManyOrdinaryBig.max = n
                                                if (axisYManyOrdinaryBig.max < result)
                                                    axisYManyOrdinaryBig.max = result + 0.1
                                                if (n < sortTestManyOrdinaryBig.finish) {
                                                    exit.enabled = false
                                                    sortTestManyOrdinaryBig.testQuickSort(
                                                                n + sortTestManyOrdinaryBig.step, TestClassSorts.ManyOrdinary)
                                                }
                                                else{
                                                    exit.enabled = true
                                                    //sortTestManyOrdinaryBig.testShellSort(
                                                     //           sortTestManyOrdinaryBig.start, TestClassSorts.ManyOrdinary)
                                                }
                                            }
                                            onTestShellSortResult: function (n, result){
                                                shellSortManyOrdinaryBig.append(
                                                            n, result)
                                                if (axisXManyOrdinaryBig.min > n)
                                                    axisXManyOrdinaryBig.min = n
                                                if (axisYManyOrdinaryBig.min > result)
                                                    axisYManyOrdinaryBig.min = result - 0.1
                                                if (axisXManyOrdinaryBig.max < n)
                                                    axisXManyOrdinaryBig.max = n
                                                if (axisYManyOrdinaryBig.max < result)
                                                    axisYManyOrdinaryBig.max = result + 0.1
                                                if (n < sortTestManyOrdinaryBig.finish) {
                                                    exit.enabled = false
                                                    sortTestManyOrdinaryBig.testShellSort(
                                                                n + sortTestManyOrdinaryBig.step, TestClassSorts.ManyOrdinary)
                                                }
                                                else{
                                                    exit.enabled = false
                                                    sortTestManyOrdinaryBig.testRadixSort(
                                                                sortTestManyOrdinaryBig.start, TestClassSorts.ManyOrdinary)
                                                }
                                            }
                                            onTestRadixSortResult: function (n, result){
                                                radixSortManyOrdinaryBig.append(
                                                            n, result)
                                                if (axisXManyOrdinaryBig.min > n)
                                                    axisXManyOrdinaryBig.min = n
                                                if (axisYManyOrdinaryBig.min > result)
                                                    axisYManyOrdinaryBig.min = result - 0.1
                                                if (axisXManyOrdinaryBig.max < n)
                                                    axisXManyOrdinaryBig.max = n
                                                if (axisYManyOrdinaryBig.max < result)
                                                    axisYManyOrdinaryBig.max = result + 0.1
                                                if (n < sortTestManyOrdinaryBig.finish) {
                                                    exit.enabled = false
                                                    sortTestManyOrdinaryBig.testRadixSort(
                                                                n + sortTestManyOrdinaryBig.step, TestClassSorts.ManyOrdinary)
                                                }
                                                else exit.enabled = true
                                            }
                                        }
                                        Component.onCompleted: {
                                            sortTestManyOrdinaryBig.testQuickSort(
                                                        sortTestManyOrdinaryBig.start, TestClassSorts.ManyOrdinary)
                                            sortTestManyOrdinaryBig.testShellSort(
                                                        sortTestManyOrdinaryBig.start, TestClassSorts.ManyOrdinary)
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                quickSortManyOrdinaryBig.visible = !quickSortManyOrdinaryBig.visible
                                                if (quickSortManyOrdinaryBig.visible === true){
                                                    axisXManyOrdinaryBig.min = tests.findMinValueX(quickSortManyOrdinaryBig)
                                                    axisXManyOrdinaryBig.max = tests.findMaxValueX(quickSortManyOrdinaryBig)
                                                    axisYManyOrdinaryBig.min = tests.findMinValueY(quickSortManyOrdinaryBig)
                                                    axisYManyOrdinaryBig.max = tests.findMaxValueY(quickSortManyOrdinaryBig)
                                                }
                                                else{
                                                    axisXManyOrdinaryBig.min = tests.findMinValueX(shellSortManyOrdinaryBig)
                                                    axisXManyOrdinaryBig.max = tests.findMaxValueX(shellSortManyOrdinaryBig)
                                                    axisYManyOrdinaryBig.min = tests.findMinValueY(shellSortManyOrdinaryBig)
                                                    axisYManyOrdinaryBig.max = tests.findMaxValueY(shellSortManyOrdinaryBig)
                                                }
                                                parent.update()
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
}

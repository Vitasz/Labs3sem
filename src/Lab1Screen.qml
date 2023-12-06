import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtCharts

import qml.testclasssmrt
//import testquick
import "qrc:/../images"

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

        Image {
            id: menuicon
            x: 24
            width: 43
            height: 34
            source: "qrc:/images/images/Menu_icon.svg"
            anchors.topMargin: 30
            z: 1
            anchors.top: parent.top
            transformOrigin: Item.Top
            fillMode: Image.PreserveAspectFit
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
                            property string link: "https://onedrive.live.com/?authkey=%21ADgC7s1Z%2D4H%5FLY4&cid=187CCF51BB4995EC&id=187CCF51BB4995EC%2188756&parId=187CCF51BB4995EC%2187105&o=OneUp"
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            ///anchors.leftMargin: 236
                            anchors.bottomMargin: 10
                            anchors.rightMargin: 150
                            anchors.right: mainShape.right

                            text: "Задание: <a
href='" + link + "'>useless_file.pdf</a>"
                            anchors.left: parent.left
                            anchors.bottom: parent.bottom
                            onLinkActivated: Qt.openUrlExternally(link)
                            font.letterSpacing: 2
                            font.pixelSize: 30
                            font.styleName: "Black"
                            font.family: "Inter Light"
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

                            text: qsTr("Лабораторная работа №1")
                            font.pixelSize: 50
                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                        Text {
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Умные указатели.")
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
                            width: 300
                            bttnText: "Информация"
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
                        text: qsTr("Краткая информация")
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
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("В данной лабораторной работе была реализована концепция умных указателей.\n Для Smart, Unique, Shared были проведены нагрузочные тесты.\n MemorySpan и MSPtr покрыты Unit-тестами.")
                        horizontalAlignment: Text.AlignHCenter
                        width: Window.width
                        height: 10
                        font.letterSpacing: 0
                        font.pointSize: 20
                        font.styleName: "Black"
                        font.family: "Inter Light"
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
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "Smart Pointer"
                                className: "SmrtPtr"
                            }
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "Unique Pointer"
                                className: "UnqPtr"
                                textCode: "<!-- HTML generated using hilite.me --><div style='background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span style='color: #008080'>#pragma once</span>
<span style='color: #000080; font-weight: bold'>template</span>&lt;<span style='color: #000080; font-weight: bold'>class</span> T&gt;
<span style='color: #000080; font-weight: bold'>class</span> SharedPtr {
public:
<span style='color: #008800; font-style: italic'>// Constructor</span>
<span style='color: #000080; font-weight: bold'>explicit</span> SharedPtr(T* ptr = nullptr) : m_ptr(ptr), m_refCount(<span style='color: #000080; font-weight: bold'>new</span> <span style='color: #000080; font-weight: bold'>int</span>(<span style='color: #0000FF'>1</span>)) {}

<span style='color: #008800; font-style: italic'>// Copy constructor</span>
SharedPtr(<span style='color: #000080; font-weight: bold'>const</span> SharedPtr&amp; other) : m_ptr(other.m_ptr), m_refCount(other.m_refCount) {
(*m_refCount)++;
}

<span style='color: #008800; font-style: italic'>// Destructor</span>
~SharedPtr() {
release();
}

<span style='color: #008800; font-style: italic'>// Assignment operator</span>
SharedPtr&amp; <span style='color: #000080; font-weight: bold'>operator</span>=(<span style='color: #000080; font-weight: bold'>const</span> SharedPtr&amp; other) {
<span style='color: #000080; font-weight: bold'>if</span> (<span style='color: #000080; font-weight: bold'>this</span> != &amp;other) {
release();
m_ptr = other.m_ptr;
m_refCount = other.m_refCount;
(*m_refCount)++;
}
<span style='color: #000080; font-weight: bold'>return</span> *<span style='color: #000080; font-weight: bold'>this</span>;
}

<span style='color: #008800; font-style: italic'>// Dereference operator</span>
T&amp; <span style='color: #000080; font-weight: bold'>operator</span>*() <span style='color: #000080; font-weight: bold'>const</span> {
<span style='color: #000080; font-weight: bold'>return</span> *m_ptr;
}

<span style='color: #008800; font-style: italic'>// Arrow operator</span>
T* <span style='color: #000080; font-weight: bold'>operator</span>-&gt;() <span style='color: #000080; font-weight: bold'>const</span> {
<span style='color: #000080; font-weight: bold'>return</span> m_ptr;
}

private:
T* m_ptr;             <span style='color: #008800; font-style: italic'>// Pointer to the managed object</span>
<span style='color: #000080; font-weight: bold'>int</span>* m_refCount;      <span style='color: #008800; font-style: italic'>// Reference count</span>

<span style='color: #008800; font-style: italic'>// Release the managed object and decrement the reference count</span>
<span style='color: #000080; font-weight: bold'>void</span> release() {
(*m_refCount)--;
<span style='color: #000080; font-weight: bold'>if</span> (*m_refCount == <span style='color: #0000FF'>0</span>) {
<span style='color: #000080; font-weight: bold'>delete</span> m_ptr;
<span style='color: #000080; font-weight: bold'>delete</span> m_refCount;
}
}
};
</pre></div>
"
                            }
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "Shared Pointer"
                                className: "ShrdPtr"
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
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "Memory Span"
                                className: "MemorySpan"
                            }
                            Lab1Card {
                                iconPath: "qrc:/images/images/lab1.png"
                                name: "MS Pointer"
                                className: "MSPtr"
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
                                    text: "Smart Pointer"
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
                                            id: smartSplineSeriesTESTsmall
                                            name: "My Smart Pointer"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: smartAxisXsmall

                                            axisY: smartAxisYsmall
                                        }

                                        SplineSeries {
                                            id: smartSplineSeriesINTsmall
                                            name: "Sequence<int>"
                                            axisX: smartAxisXsmall

                                            axisY: smartAxisYsmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }

                                        TestClassSmartPointers {
                                            id: smartTestClasssmall
                                            property int start: 1000
                                            property int finish: 10000
                                            property int step: 250
                                            onTestSequenceResult: function (n, result) {
                                                smartSplineSeriesINTsmall.append(
                                                            n, result)
                                                if (smartSplineSeriesINTsmall.min > n)
                                                    smartAxisXsmall.min = n
                                                if (smartAxisYsmall.min > result)
                                                    smartAxisYsmall.min = result - 0.1
                                                if (smartAxisXsmall.max < n)
                                                    smartAxisXsmall.max = n
                                                if (smartAxisYsmall.max < result)
                                                    smartAxisYsmall.max = result + 0.1
                                                if (n < smartTestClasssmall.finish) {
                                                    smartTestClasssmall.testSequence(
                                                                n + smartTestClasssmall.step)
                                                } else {
                                                    smartTestClasssmall.testMySmartPointer(
                                                                smartTestClasssmall.start)
                                                }
                                            }
                                            onTestMySmartResult: function (n, result) {
                                                smartSplineSeriesTESTsmall.append(
                                                            n, result)
                                                if (smartAxisXsmall.min > n)
                                                    smartAxisXsmall.min = n
                                                if (smartAxisYsmall.min > result)
                                                    smartAxisYsmall.min = result - 0.1
                                                if (smartAxisXsmall.max < n)
                                                    smartAxisXsmall.max = n
                                                if (smartAxisYsmall.max < result)
                                                    smartAxisYsmall.max = result + 0.1
                                                if (n < smartTestClasssmall.finish) {
                                                    smartTestClasssmall.testMySmartPointer(
                                                                n + smartTestClasssmall.step)
                                                }
                                            }
                                        }
                                        Component.onCompleted: {
                                            smartTestClasssmall.testSequence(
                                                        smartTestClasssmall.start)
                                        }
                                    }

                                    ChartView {
                                        id: smartBig
                                        title: "На больших данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        backgroundColor: "transparent"
                                        ValuesAxis {
                                            id: smartAxisXbig
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: smartAxisYbig
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: smartSplineSeriesTESTbig
                                            name: "My Smart Pointer"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: smartAxisXbig

                                            axisY: smartAxisYbig
                                        }

                                        SplineSeries {
                                            id: smartSplineSeriesINTbig
                                            name: "Sequence<int>"
                                            axisX: smartAxisXbig

                                            axisY: smartAxisYbig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSmartPointers {
                                            id: smartTestClassbig
                                            property int start: 100000
                                            property int finish: 1000000
                                            property int step: 50000
                                            onTestSequenceResult: function (n, result) {
                                                smartSplineSeriesINTbig.append(
                                                            n, result)
                                                if (smartAxisXbig.min > n)
                                                    smartAxisXbig.min = n
                                                if (smartAxisYbig.min > result)
                                                    smartAxisYbig.min = result - 0.1
                                                if (smartAxisXbig.max < n)
                                                    smartAxisXbig.max = n
                                                if (smartAxisYbig.max < result)
                                                    smartAxisYbig.max = result + 0.1
                                                if (n < smartTestClassbig.finish) {
                                                    smartTestClassbig.testSequence(
                                                                n + smartTestClassbig.step)
                                                } else {
                                                    smartTestClassbig.testMySmartPointer(
                                                                smartTestClassbig.start)
                                                }
                                            }
                                            onTestMySmartResult: function (n, result) {
                                                smartSplineSeriesTESTbig.append(
                                                            n, result)
                                                if (smartAxisXbig.min > n)
                                                    smartAxisXbig.min = n
                                                if (smartAxisYbig.min > result)
                                                    smartAxisYbig.min = result - 0.1
                                                if (smartAxisXbig.max < n)
                                                    smartAxisXbig.max = n
                                                if (smartAxisYbig.max < result)
                                                    smartAxisYbig.max = result + 0.1
                                                if (n < smartTestClassbig.finish) {
                                                    smartTestClassbig.testMySmartPointer(
                                                                n + smartTestClassbig.step)
                                                }
                                            }
                                        }
                                        Component.onCompleted: {
                                            smartTestClassbig.testSequence(
                                                        smartTestClassbig.start)
                                        }
                                    }
                                }
                            }
                            ColumnLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "Unique Pointer"
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
                                            id: uniqueAxisXsmall
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: uniqueAxisYsmall
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: uniqueSplineSeriesTESTsmall
                                            name: "My Unique Pointer"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: uniqueAxisXsmall

                                            axisY: uniqueAxisYsmall
                                        }

                                        SplineSeries {
                                            id: uniqueSplineSeriesINTsmall
                                            name: "Sequence<int>"
                                            axisX: uniqueAxisXsmall

                                            axisY: uniqueAxisYsmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: uniqueSplineSeriesSTLsmall
                                            name: "STL Unique Pointer"
                                            axisX: uniqueAxisXsmall

                                            axisY: uniqueAxisYsmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }

                                        TestClassSmartPointers {
                                            id: uniqueTestClasssmall
                                            property int start: 1000
                                            property int finish: 10000
                                            property int step: 250
                                            onTestSequenceResult: function (n, result) {
                                                uniqueSplineSeriesINTsmall.append(
                                                            n, result)
                                                if (uniqueSplineSeriesINTsmall.min > n)
                                                    uniqueAxisXsmall.min = n
                                                if (uniqueAxisYsmall.min > result)
                                                    uniqueAxisYsmall.min = result - 0.1
                                                if (uniqueAxisXsmall.max < n)
                                                    uniqueAxisXsmall.max = n
                                                if (uniqueAxisYsmall.max < result)
                                                    uniqueAxisYsmall.max = result + 0.1
                                                if (n < uniqueTestClasssmall.finish) {
                                                    uniqueTestClasssmall.testSequence(
                                                                n + uniqueTestClasssmall.step)
                                                } else {
                                                    uniqueTestClasssmall.testMyUniquePointer(
                                                                uniqueTestClasssmall.start)
                                                }
                                            }
                                            onTestMyUniqueResult: function (n, result) {
                                                uniqueSplineSeriesTESTsmall.append(
                                                            n, result)
                                                if (uniqueAxisXsmall.min > n)
                                                    uniqueAxisXsmall.min = n
                                                if (uniqueAxisYsmall.min > result)
                                                    uniqueAxisYsmall.min = result - 0.1
                                                if (uniqueAxisXsmall.max < n)
                                                    uniqueAxisXsmall.max = n
                                                if (uniqueAxisYsmall.max < result)
                                                    uniqueAxisYsmall.max = result + 0.1
                                                if (n < uniqueTestClasssmall.finish) {
                                                    uniqueTestClasssmall.testMyUniquePointer(
                                                                n + uniqueTestClasssmall.step)
                                                } else {
                                                    uniqueTestClasssmall.testSTLUniquePointer(
                                                                uniqueTestClasssmall.start)
                                                }
                                            }
                                            onTestSTLUniqueResult: function (n, result) {
                                                uniqueSplineSeriesSTLsmall.append(
                                                            n, result)
                                                if (uniqueAxisXsmall.min > n)
                                                    uniqueAxisXsmall.min = n
                                                if (uniqueAxisYsmall.min > result)
                                                    uniqueAxisYsmall.min = result - 0.1
                                                if (uniqueAxisXsmall.max < n)
                                                    uniqueAxisXsmall.max = n
                                                if (uniqueAxisYsmall.max < result)
                                                    uniqueAxisYsmall.max = result + 0.1
                                                if (n < uniqueTestClasssmall.finish) {
                                                    uniqueTestClasssmall.testSTLUniquePointer(
                                                                n + uniqueTestClasssmall.step)
                                                }
                                            }
                                        }
                                        Component.onCompleted: {
                                            uniqueTestClasssmall.testSequence(
                                                        uniqueTestClasssmall.start)
                                        }
                                    }

                                    ChartView {
                                        id: uniqueBig
                                        title: "На больших данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true

                                        backgroundColor: "transparent"
                                        ValuesAxis {
                                            id: uniqueAxisXbig
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: uniqueAxisYbig
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: uniqueSplineSeriesTESTbig
                                            name: "My Unique Pointer"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: uniqueAxisXbig

                                            axisY: uniqueAxisYbig
                                        }

                                        SplineSeries {
                                            id: uniqueSplineSeriesINTbig
                                            name: "Sequence<int>"
                                            axisX: uniqueAxisXbig

                                            axisY: uniqueAxisYbig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: uniqueSplineSeriesSTLbig
                                            name: "STL Unique Pointer"
                                            axisX: uniqueAxisXbig

                                            axisY: uniqueAxisYbig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSmartPointers {
                                            id: uniqueTestClassbig
                                            property int start: 100000
                                            property int finish: 1000000
                                            property int step: 25000
                                            onTestSequenceResult: function (n, result) {
                                                uniqueSplineSeriesINTbig.append(
                                                            n, result)
                                                if (uniqueAxisXbig.min > n)
                                                    uniqueAxisXbig.min = n
                                                if (uniqueAxisYbig.min > result)
                                                    uniqueAxisYbig.min = result - 0.1
                                                if (uniqueAxisXbig.max < n)
                                                    uniqueAxisXbig.max = n
                                                if (uniqueAxisYbig.max < result)
                                                    uniqueAxisYbig.max = result + 0.1
                                                if (n < uniqueTestClassbig.finish) {
                                                    uniqueTestClassbig.testSequence(
                                                                n + uniqueTestClassbig.step)
                                                } else {
                                                    uniqueTestClassbig.testMyUniquePointer(
                                                                uniqueTestClassbig.start)
                                                }
                                            }
                                            onTestMyUniqueResult: function (n, result) {
                                                uniqueSplineSeriesTESTbig.append(
                                                            n, result)
                                                if (uniqueAxisXbig.min > n)
                                                    uniqueAxisXbig.min = n
                                                if (uniqueAxisYbig.min > result)
                                                    uniqueAxisYbig.min = result - 0.1
                                                if (uniqueAxisXbig.max < n)
                                                    uniqueAxisXbig.max = n
                                                if (uniqueAxisYbig.max < result)
                                                    uniqueAxisYbig.max = result + 0.1
                                                if (n < uniqueTestClassbig.finish) {
                                                    uniqueTestClassbig.testMyUniquePointer(
                                                                n + uniqueTestClassbig.step)
                                                } else {
                                                    uniqueTestClassbig.testSTLUniquePointer(
                                                                uniqueTestClassbig.start)
                                                }
                                            }
                                            onTestSTLUniqueResult: function (n, result) {
                                                uniqueSplineSeriesSTLbig.append(
                                                            n, result)
                                                if (uniqueAxisXbig.min > n)
                                                    uniqueAxisXbig.min = n
                                                if (uniqueAxisYbig.min > result)
                                                    uniqueAxisYbig.min = result - 0.1
                                                if (uniqueAxisXbig.max < n)
                                                    uniqueAxisXbig.max = n
                                                if (uniqueAxisYbig.max < result)
                                                    uniqueAxisYbig.max = result + 0.1
                                                if (n < uniqueTestClassbig.finish) {
                                                    uniqueTestClassbig.testSTLUniquePointer(
                                                                n + uniqueTestClassbig.step)
                                                }
                                            }
                                        }
                                        Component.onCompleted: {
                                            uniqueTestClassbig.testSequence(
                                                        uniqueTestClassbig.start)
                                        }
                                    }
                                }
                            }
                            ColumnLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    text: "Shared Pointer"
                                    font.styleName: "Bold"
                                    font.family: "Inner"
                                    font.pointSize: 30
                                }
                                RowLayout {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.fillWidth: true
                                    ChartView {
                                        title: "На маленьких данных"
                                        height: 500
                                        width: 500
                                        antialiasing: true
                                        titleFont.pointSize: 15
                                        backgroundColor: "transparent"
                                        ValuesAxis {
                                            id: sharedAxisXsmall
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: sharedAxisYsmall
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: sharedSplineSeriesTESTsmall
                                            name: "My Shared Pointer"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: sharedAxisXsmall

                                            axisY: sharedAxisYsmall
                                        }

                                        SplineSeries {
                                            id: sharedSplineSeriesINTsmall
                                            name: "Sequence<int>"
                                            axisX: sharedAxisXsmall

                                            axisY: sharedAxisYsmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: sharedSplineSeriesSTLsmall
                                            name: "STL Shared Pointer"
                                            axisX: sharedAxisXsmall

                                            axisY: sharedAxisYsmall
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }

                                        TestClassSmartPointers {
                                            id: sharedTestClasssmall
                                            property int start: 1000
                                            property int finish: 10000
                                            property int step: 250
                                            onTestSequenceResult: function (n, result) {
                                                sharedSplineSeriesINTsmall.append(
                                                            n, result)
                                                if (sharedSplineSeriesINTsmall.min > n)
                                                    sharedAxisXsmall.min = n
                                                if (sharedAxisYsmall.min > result)
                                                    sharedAxisYsmall.min = result - 0.1
                                                if (sharedAxisXsmall.max < n)
                                                    sharedAxisXsmall.max = n
                                                if (sharedAxisYsmall.max < result)
                                                    sharedAxisYsmall.max = result + 0.1
                                                if (n < sharedTestClasssmall.finish) {
                                                    sharedTestClasssmall.testSequence(
                                                                n + sharedTestClasssmall.step)
                                                } else {
                                                    sharedTestClasssmall.testMySharedPointer(
                                                                sharedTestClasssmall.start)
                                                }
                                            }
                                            onTestMySharedResult: function (n, result) {
                                                sharedSplineSeriesTESTsmall.append(
                                                            n, result)
                                                if (sharedAxisXsmall.min > n)
                                                    sharedAxisXsmall.min = n
                                                if (sharedAxisYsmall.min > result)
                                                    sharedAxisYsmall.min = result - 0.1
                                                if (sharedAxisXsmall.max < n)
                                                    sharedAxisXsmall.max = n
                                                if (sharedAxisYsmall.max < result)
                                                    sharedAxisYsmall.max = result + 0.1
                                                if (n < sharedTestClasssmall.finish) {
                                                    sharedTestClasssmall.testMySharedPointer(
                                                                n + sharedTestClasssmall.step)
                                                } else {
                                                    sharedTestClasssmall.testSTLSharedPointer(
                                                                sharedTestClasssmall.start)
                                                }
                                            }
                                            onTestSTLSharedResult: function (n, result) {
                                                sharedSplineSeriesSTLsmall.append(
                                                            n, result)
                                                if (sharedAxisXsmall.min > n)
                                                    sharedAxisXsmall.min = n
                                                if (sharedAxisYsmall.min > result)
                                                    sharedAxisYsmall.min = result - 0.1
                                                if (sharedAxisXsmall.max < n)
                                                    sharedAxisXsmall.max = n
                                                if (sharedAxisYsmall.max < result)
                                                    sharedAxisYsmall.max = result + 0.1
                                                if (n < sharedTestClasssmall.finish) {
                                                    sharedTestClasssmall.testSTLSharedPointer(
                                                                n + sharedTestClasssmall.step)
                                                }
                                            }
                                        }
                                        Component.onCompleted: {
                                            sharedTestClasssmall.testSequence(
                                                        sharedTestClasssmall.start)
                                        }
                                    }

                                    ChartView {
                                        id: sharedBig
                                        title: "На больших данных"
                                        titleFont.pointSize: 15
                                        height: 500
                                        width: 500
                                        antialiasing: true

                                        backgroundColor: "transparent"
                                        ValuesAxis {
                                            id: sharedAxisXbig
                                            min: 0
                                            max: 0
                                            titleText: "N"
                                            labelFormat: "%d"
                                        }
                                        ValuesAxis {
                                            id: sharedAxisYbig
                                            labelFormat: "%.1f"
                                            min: 0
                                            max: 0
                                            tickCount: 4
                                            minorTickCount: 4
                                            titleText: "time [mcs]"
                                        }
                                        SplineSeries {
                                            id: sharedSplineSeriesTESTbig
                                            name: "My Shared Pointer"
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                            axisX: sharedAxisXbig

                                            axisY: sharedAxisYbig
                                        }

                                        SplineSeries {
                                            id: sharedSplineSeriesINTbig
                                            name: "Sequence<int>"
                                            axisX: sharedAxisXbig

                                            axisY: sharedAxisYbig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        SplineSeries {
                                            id: sharedSplineSeriesSTLbig
                                            name: "STL Shared Pointer"
                                            axisX: sharedAxisXbig

                                            axisY: sharedAxisYbig
                                            XYPoint {
                                                x: 0
                                                y: 0
                                            }
                                        }
                                        TestClassSmartPointers {
                                            id: sharedTestClassbig
                                            property int start: 100000
                                            property int finish: 1000000
                                            property int step: 50000
                                            onTestSequenceResult: function (n, result) {
                                                sharedSplineSeriesINTbig.append(
                                                            n, result)
                                                if (sharedAxisXbig.min > n)
                                                    sharedAxisXbig.min = n
                                                if (sharedAxisYbig.min > result)
                                                    sharedAxisYbig.min = result - 0.1
                                                if (sharedAxisXbig.max < n)
                                                    sharedAxisXbig.max = n
                                                if (sharedAxisYbig.max < result)
                                                    sharedAxisYbig.max = result + 0.1
                                                if (n < sharedTestClassbig.finish) {
                                                    sharedTestClassbig.testSequence(
                                                                n + sharedTestClassbig.step)
                                                } else {
                                                    sharedTestClassbig.testMySharedPointer(
                                                                sharedTestClassbig.start)
                                                }
                                            }
                                            onTestMySharedResult: function (n, result) {
                                                sharedSplineSeriesTESTbig.append(
                                                            n, result)
                                                if (sharedAxisXbig.min > n)
                                                    sharedAxisXbig.min = n
                                                if (sharedAxisYbig.min > result)
                                                    sharedAxisYbig.min = result - 0.1
                                                if (sharedAxisXbig.max < n)
                                                    sharedAxisXbig.max = n
                                                if (sharedAxisYbig.max < result)
                                                    sharedAxisYbig.max = result + 0.1
                                                if (n < sharedTestClassbig.finish) {
                                                    sharedTestClassbig.testMySharedPointer(
                                                                n + sharedTestClassbig.step)
                                                } else {
                                                    sharedTestClassbig.testSTLSharedPointer(
                                                                sharedTestClassbig.start)
                                                }
                                            }
                                            onTestSTLSharedResult: function (n, result) {
                                                sharedSplineSeriesSTLbig.append(
                                                            n, result)
                                                if (sharedAxisXbig.min > n)
                                                    sharedAxisXbig.min = n
                                                if (sharedAxisYbig.min > result)
                                                    sharedAxisYbig.min = result - 0.1
                                                if (sharedAxisXbig.max < n)
                                                    sharedAxisXbig.max = n
                                                if (sharedAxisYbig.max < result)
                                                    sharedAxisYbig.max = result + 0.1
                                                if (n < sharedTestClassbig.finish) {
                                                    sharedTestClassbig.testSTLSharedPointer(
                                                                n + sharedTestClassbig.step)
                                                }
                                            }
                                        }
                                        Component.onCompleted: {
                                            sharedTestClassbig.testSequence(
                                                        sharedTestClassbig.start)
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

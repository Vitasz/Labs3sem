import QtQuick
import QtQuick.Window
import QtQuick.Controls.Imagine
import QtQuick.Layouts
import QtQuick.Shapes
import QtCharts
import "qrc:/Lab1"
import "qrc:/../images"
Page {
    id: main
    visible: true


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
                            property string link: "https://onedrive.live.com/?authkey=%21ADgC7s1Z%2D4H%5FLY4&cid=187CCF51BB4995EC&id=187CCF51BB4995EC%2188754&parId=187CCF51BB4995EC%2187105&o=OneUp"
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
                                onClicked:{
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

                            text: qsTr("Лабораторная работа №3")
                            font.pixelSize: 50
                            font.styleName: "Black"
                            font.family: "Inter Black"
                        }
                        Text {
                            Layout.alignment: Qt.AlignCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Поиск данных.")
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
                            bttnText: "Индексация"


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
                            bttnText: "Крестики-нолики"
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
                        text: qsTr("Индексация")
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
                    DynamicHashMapVis{

                        Layout.fillWidth: true;
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
                                iconPath: "qrc:/images/images/lab3.png"
                                name: "Dynamic Hash Map"
                                className: "HashMap"
                                textCode: "<!-- HTML generated using hilite.me --><div style='background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span style='color: #557799'>#include &lt;iostream&gt;</span>
<span style='color: #557799'>#include &lt;vector&gt;</span>
<span style='color: #557799'>#include &lt;string&gt;</span>
<span style='color: #557799'>#include &lt;algorithm&gt;</span>

<span style='color: #008800; font-weight: bold'>template</span><span style='color: #333333'>&lt;</span><span style='color: #008800; font-weight: bold'>typename</span> K, <span style='color: #008800; font-weight: bold'>typename</span> V<span style='color: #333333'>&gt;</span>
<span style='color: #008800; font-weight: bold'>struct</span> KeyValuePair {
    K key;
    V value;
};

<span style='color: #008800; font-weight: bold'>template</span><span style='color: #333333'>&lt;</span><span style='color: #008800; font-weight: bold'>typename</span> K, <span style='color: #008800; font-weight: bold'>typename</span> V<span style='color: #333333'>&gt;</span>
<span style='color: #008800; font-weight: bold'>class</span> <span style='color: #BB0066; font-weight: bold'>DynamicHashMap</span> {
<span style='color: #997700; font-weight: bold'>private:</span>
    <span style='color: #008800; font-weight: bold'>static</span> <span style='color: #008800; font-weight: bold'>const</span> <span style='color: #333399; font-weight: bold'>size_t</span> INITIAL_SIZE <span style='color: #333333'>=</span> <span style='color: #0000DD; font-weight: bold'>8</span>;
    <span style='color: #008800; font-weight: bold'>const</span> <span style='color: #333399; font-weight: bold'>double</span> LOAD_FACTOR_THRESHOLD <span style='color: #333333'>=</span> <span style='color: #6600EE; font-weight: bold'>0.1</span>;

    std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>KeyValuePair<span style='color: #333333'>&lt;</span>K, V<span style='color: #333333'>&gt;&gt;&gt;</span> table;
    <span style='color: #333399; font-weight: bold'>size_t</span> elementsCount;

<span style='color: #997700; font-weight: bold'>public:</span>
    DynamicHashMap() <span style='color: #333333'>:</span> table(INITIAL_SIZE), elementsCount(<span style='color: #0000DD; font-weight: bold'>0</span>) {}

    <span style='color: #333399; font-weight: bold'>void</span> insert(<span style='color: #008800; font-weight: bold'>const</span> K<span style='color: #333333'>&amp;</span> key, <span style='color: #008800; font-weight: bold'>const</span> V<span style='color: #333333'>&amp;</span> value) {
        <span style='color: #008800; font-weight: bold'>if</span> (loadFactor() <span style='color: #333333'>&gt;</span> LOAD_FACTOR_THRESHOLD) {
            resizeAndRehash();
        }

        <span style='color: #333399; font-weight: bold'>size_t</span> index <span style='color: #333333'>=</span> hash(key, table.size());
        <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> bucket <span style='color: #333333'>=</span> table[index];

        <span style='color: #008800; font-weight: bold'>auto</span> it <span style='color: #333333'>=</span> std<span style='color: #333333'>::</span>find_if(bucket.begin(), bucket.end(), [<span style='color: #333333'>&amp;</span>key](<span style='color: #008800; font-weight: bold'>const</span> <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> kvp) {
            <span style='color: #008800; font-weight: bold'>return</span> kvp.key <span style='color: #333333'>==</span> key;
        });

        <span style='color: #008800; font-weight: bold'>if</span> (it <span style='color: #333333'>!=</span> bucket.end()) {
            it<span style='color: #333333'>-&gt;</span>value <span style='color: #333333'>=</span> value;  <span style='color: #888888'>// Key already exists, update the value</span>
        } <span style='color: #008800; font-weight: bold'>else</span> {
            bucket.emplace_back(KeyValuePair<span style='color: #333333'>&lt;</span>K, V<span style='color: #333333'>&gt;</span>{key, value});
            <span style='color: #333333'>++</span>elementsCount;
        }
    }

    <span style='color: #333399; font-weight: bold'>bool</span> find(<span style='color: #008800; font-weight: bold'>const</span> K<span style='color: #333333'>&amp;</span> key, std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>V<span style='color: #333333'>&gt;&amp;</span> values) <span style='color: #008800; font-weight: bold'>const</span> {
        values.clear();
        <span style='color: #333399; font-weight: bold'>size_t</span> index <span style='color: #333333'>=</span> hash(key, table.size());
        <span style='color: #008800; font-weight: bold'>const</span> <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> bucket <span style='color: #333333'>=</span> table[index];

        <span style='color: #008800; font-weight: bold'>auto</span> it <span style='color: #333333'>=</span> std<span style='color: #333333'>::</span>find_if(bucket.begin(), bucket.end(), [<span style='color: #333333'>&amp;</span>key](<span style='color: #008800; font-weight: bold'>const</span> <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> kvp) {
            <span style='color: #008800; font-weight: bold'>return</span> kvp.key <span style='color: #333333'>==</span> key;
        });

        <span style='color: #008800; font-weight: bold'>if</span> (it <span style='color: #333333'>!=</span> bucket.end()) {
            <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #008800; font-weight: bold'>const</span> <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> kvp <span style='color: #333333'>:</span> bucket) {
                <span style='color: #008800; font-weight: bold'>if</span> (kvp.key <span style='color: #333333'>==</span> key) {
                    values.push_back(kvp.value);
                }
            }
            <span style='color: #008800; font-weight: bold'>return</span> <span style='color: #007020'>true</span>;
        }

        <span style='color: #008800; font-weight: bold'>return</span> <span style='color: #007020'>false</span>;
    }

    <span style='color: #333399; font-weight: bold'>void</span> remove(<span style='color: #008800; font-weight: bold'>const</span> K<span style='color: #333333'>&amp;</span> key) {
        <span style='color: #333399; font-weight: bold'>size_t</span> index <span style='color: #333333'>=</span> hash(key, table.size());
        <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> bucket <span style='color: #333333'>=</span> table[index];

        <span style='color: #008800; font-weight: bold'>auto</span> it <span style='color: #333333'>=</span> std<span style='color: #333333'>::</span>remove_if(bucket.begin(), bucket.end(), [<span style='color: #333333'>&amp;</span>key](<span style='color: #008800; font-weight: bold'>const</span> <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> kvp) {
            <span style='color: #008800; font-weight: bold'>return</span> kvp.key <span style='color: #333333'>==</span> key;
        });

        <span style='color: #008800; font-weight: bold'>if</span> (it <span style='color: #333333'>!=</span> bucket.end()) {
            bucket.erase(it, bucket.end());
            <span style='color: #333333'>--</span>elementsCount;
        }
    }

<span style='color: #997700; font-weight: bold'>private:</span>
    <span style='color: #333399; font-weight: bold'>double</span> loadFactor() <span style='color: #008800; font-weight: bold'>const</span> {
        <span style='color: #008800; font-weight: bold'>return</span> <span style='color: #008800; font-weight: bold'>static_cast</span><span style='color: #333333'>&lt;</span><span style='color: #333399; font-weight: bold'>double</span><span style='color: #333333'>&gt;</span>(elementsCount) <span style='color: #333333'>/</span> table.size();
    }

    <span style='color: #333399; font-weight: bold'>void</span> resizeAndRehash() {
        <span style='color: #333399; font-weight: bold'>size_t</span> newSize <span style='color: #333333'>=</span> table.size() <span style='color: #333333'>*</span> <span style='color: #0000DD; font-weight: bold'>2</span>;
        std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>std<span style='color: #333333'>::</span>vector<span style='color: #333333'>&lt;</span>KeyValuePair<span style='color: #333333'>&lt;</span>K, V<span style='color: #333333'>&gt;&gt;&gt;</span> newTable(newSize);

        <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #008800; font-weight: bold'>const</span> <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> bucket <span style='color: #333333'>:</span> table) {
            <span style='color: #008800; font-weight: bold'>for</span> (<span style='color: #008800; font-weight: bold'>const</span> <span style='color: #008800; font-weight: bold'>auto</span><span style='color: #333333'>&amp;</span> kvp <span style='color: #333333'>:</span> bucket) {
                <span style='color: #333399; font-weight: bold'>size_t</span> newIndex <span style='color: #333333'>=</span> hash(kvp.key, newSize);
                newTable[newIndex].emplace_back(kvp);
            }
        }

        table <span style='color: #333333'>=</span> std<span style='color: #333333'>::</span>move(newTable);
    }

    <span style='color: #333399; font-weight: bold'>size_t</span> hash(<span style='color: #008800; font-weight: bold'>const</span> K<span style='color: #333333'>&amp;</span> key, <span style='color: #333399; font-weight: bold'>size_t</span> tableSize) <span style='color: #008800; font-weight: bold'>const</span> {
        std<span style='color: #333333'>::</span>hash<span style='color: #333333'>&lt;</span>K<span style='color: #333333'>&gt;</span> hasher;
        <span style='color: #008800; font-weight: bold'>return</span> hasher(key) <span style='color: #333333'>%</span> tableSize;
    }
};
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
                        text: qsTr("Крестики-нолики")
                        horizontalAlignment: Text.AlignHCenter
                        font.letterSpacing: 2
                        font.pointSize: 40
                        font.styleName: "Black"
                        font.family: "Inter Light"
                    }
                    Shape {
                        id: testsinfo
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
                    TicTacToe{
                        Layout.alignment: Qt.AlignHCenter
                        width: 600
                    }

                }
            }
        }
    }
}

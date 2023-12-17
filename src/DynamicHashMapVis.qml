import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import HashMapWrapper

Item {
    visible: true
    width: 600
    height: 400

    //title: "Text Copy Example"
    DynamicHashMapWrapper{
        id: dynamicHashMap
    }
    id: main
    Item {
        width: parent.width
        height: parent.height

        // Layout for the text areas and button
        ColumnLayout {
            anchors.fill: parent
            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    TextArea {
                        id: leftTextArea
                        Layout.fillHeight: true
                        placeholderText: "Enter text"
                        wrapMode: Text.Wrap
                        implicitWidth: main.width * 0.5
                        background: Rectangle {
                            color: "white" // Set the background color to white
                            border.width: 1
                            border.color: "black"
                        }
                    }
                }

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    TextArea {
                        id: rightTextArea
                        readOnly: true
                        wrapMode: Text.Wrap
                        implicitWidth: main.width * 0.5
                        background: Rectangle {
                            color: "white" // Set the background color to white
                            border.width: 1
                            border.color: "black"
                        }
                    }
                }
            }

            RowLayout{
                Slider{
                    id: slider;
                    from: 5;
                    to: 100;
                    stepSize: 1;
                    onValueChanged: {
                        valueText.text = value
                    }
                    Text {
                        anchors.centerIn: parent
                        id: valueText

                    }
                }

                // Button to copy text
                Button {
                    text: "Индексировать"
                    Layout.fillWidth: true
                    onClicked: copyText()
                }
            }
        }
    }

    // Function to copy text
    function copyText() {

        var textArray = leftTextArea.text.replace(/[^\w\s]/g, '').split(' ');

        const linesPerPage = slider.value;

        //const fs = require('fs');
        //const input = fs.readFileSync('input.txt', 'utf8').split('\n');

        let lineNum = 1;
        let pageNum = 1;

        textArray.forEach((line) => {
            const words = line.trim().toLowerCase().split(/\s+/);

            words.forEach((word) => {
                if (word !== ""){
                    dynamicHashMap.insert(word, [pageNum, lineNum].toString())
                }
            });

            lineNum++;

            if ((lineNum - 1) % linesPerPage === 0) {
                pageNum++;
                lineNum = 1;
            }
        });

        const entries = dynamicHashMap.getTable();
        entries.sort((a,b) => a[0][0].localeCompare(b[0][0]))
        let outputTextArray = []
        entries.forEach(values => {
            outputTextArray.push(values[0][0].toString() + ": ")
            values.forEach(pair => {

                outputTextArray[outputTextArray.length -1] += "["+ pair[1].toString() + "]"
            });
        });
        rightTextArea.text = outputTextArray.join('\n');

        dynamicHashMap.clear();
    }
}

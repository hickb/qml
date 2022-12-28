import QtQuick 2.12
import QtQuick.Controls 2.12
import MyModel 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MyModel {
        id: myModel
    }

    ListView {
        anchors.fill: parent
        model: myModel
        delegate: Text { text: myModel.count() }
    }

    Row {
        anchors.bottom: parent.bottom
        spacing: 10

        TextField {
            id: inputField
            width: 200
        }

        Button {
            text: "Add Item"
            onClicked: {
                myModel.addItem(inputField.text)
                inputField.text = ""
            }
        }
    }

    Column {
        anchors.right: parent.right
        spacing: 10

        Text {
            id: dataText
            text: ""
        }

        Button {
            text: "Show Data"
            onClicked: {
                dataText.text = ""
                for (var i = 0; i < myModel.count; i++) {
                    dataText.text += myModel.get(i) + "\n"
                }
            }
        }
    }
}

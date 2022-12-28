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
        Component.onCompleted: console.log(myModel.get_elements())
        
    }

    Column {
        id: container
        spacing: 10

        Repeater {
            model: myModel
            delegate: Text { text: myModel.get_elements() }
        }
    }

    Rectangle {
        width: 180; height: 200

        Component {
            id: contactDelegate
            Item {
                width: 180; height: 40
                Column {
                    Text { text: '<b>Name:</b> ' + myModel.get(index) }
                    Text { text: '<b>Number:</b> ' + myModel.get_elements() }
                }
            }
        }

        ListView {
            anchors.fill: parent
            model: myModel
            delegate: contactDelegate
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
        }
    }


    // ListView {
    //     anchors.fill: parent
    //     height: 400
    //     model: myModel
    //     delegate: Text { 
    //         width: parent.width
    //         height: 30
    //         text: myModel.get(index) }
    // }

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

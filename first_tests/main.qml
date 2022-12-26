import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    color: "black"

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Text {
            text: qsTr("Hello World")
            font.pixelSize: 12
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }
        Rectangle {
            id: rect
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "white"
        }
        Rectangle {
            id: rect2
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "red"
        }
        

        GridLayout {
            id: gridLayout
            anchors.fill: parent
            anchors.margins: 10
            columns: 5
            rows: 5

            Text {
                text: qsTr("Hello World")
                font.pixelSize: 12
                font.bold: true
                Layout.alignment: Qt.AlignHCenter
            }
            Rectangle {
                id: rect3
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "blue"
            }
            Rectangle {
                id: rect24
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "green"
            }
        }
    }

    Text {
        id: text2
        anchors.centerIn: parent
        text: qsTr("Hello World")
    }

    Button {
        id: button4
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Click me")
        onClicked: text.text = qsTr("Hello World!")
    }

    Button {
        id: button5
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Click me")
        onClicked: new_window()
    }
    function new_window() {
        // Create a new window similar to the main window but with zero items
        var newWindow = Qt.createQmlObject('import QtQuick 2.15; import QtQuick.Controls 2.15; ApplicationWindow { x: 50; y: 50; visible: true; width: 640; height: 480; title: qsTr("Hello World"); Rectangle { id: rect2; anchors.fill: parent; gradient: Gradient { GradientStop { position: 0.0; color: "black" }  GradientStop { position: 0.1; color: "black" } GradientStop { position: 0.11; color: "grey" } GradientStop { position: 0.11; color: "white" } GradientStop { position: 1.0; color: "white" } }    }}', Qt.application, "newWindow")
    }

    // // Lets make a rectangle with a gradient
    // Rectangle {
    //     id: rect
    //     anchors.fill: columnLayout
    //     gradient: Gradient {
    //         GradientStop { position: 0.0; color: "black" }
    //         GradientStop { position: 0.1; color: "black" }
    //         GradientStop { position: 0.11; color: "grey" }
    //         GradientStop { position: 0.11; color: "white" }
    //         GradientStop { position: 1.0; color: "white" }
    //     }
    // }
    // convert the Rectangle above to inline code
    

}

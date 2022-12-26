import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    color: "#2f2f2f"    

    Button {
        id: button
        text: "Click me"

        onClicked: console.log("Button was clicked")
    }

    TextInput {
        id: textInput

        onTextChanged: console.log("Text has changed to: " + text)
    }

    QtObject {
        function connectSignals() {
            Qt.connect(button, SIGNAL(clicked()), textInput, SLOT(clear()))
        }
    }

    function new_window() {
        // Create a new window similar to the main window but with zero items
        var newWindow = Qt.createQmlObject('import QtQuick 2.15; import QtQuick.Controls 2.15; ApplicationWindow { x: 50; y: 50; visible: true; width: 640; height: 480; title: qsTr("Hello World"); Rectangle { id: rect2; anchors.fill: parent; gradient: Gradient { GradientStop { position: 0.0; color: "black" }  GradientStop { position: 0.1; color: "black" } GradientStop { position: 0.11; color: "grey" } GradientStop { position: 0.11; color: "white" } GradientStop { position: 1.0; color: "white" } }    }}', Qt.application, "newWindow")
    }   

}

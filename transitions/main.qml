import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        id: text
        anchors.centerIn: parent
        text: qsTr("Hello World")
    }

    Button {
        id: button
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Click me")
        onClicked: text.text = qsTr("Hello World!")
    }

    Button {
        id: button2
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Click me")
        onClicked: new_window()
    }
    function new_window() {
        // Create a new window similar to the main window but with zero items
        var newWindow = Qt.createQmlObject('import QtQuick 2.15; import QtQuick.Controls 2.15; ApplicationWindow { x: 50; y: 50; visible: true; width: 640; height: 480; title: qsTr("Hello World"); }', Qt.application, "newWindow")
    }
}

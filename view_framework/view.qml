import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Button {
            text: "Click Me"
            onClicked: helloWorldModel.buttonClicked()
        }

        Button {
            text: "Click Me"
            onClicked: helloWorldModel.secondButtonClicked()
        }
    }
    
}


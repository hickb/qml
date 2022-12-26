import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    width: 640
    height: 480
    visible: true

    ColumnLayout{ 
        anchors.fill: parent
        anchors.margins: 10
        width: 400
        spacing: 10
     
        Rectangle {
            height: 100
            color: "grey"
            Text {
                text: ' test ' // helloWorldViewModel.message
                font.pixelSize: 24
                anchors.centerIn: parent
                }
        }
        Button {
            text: "Click Me"
            onClicked: helloWorldViewModel.setMessage("Goodbye!")
        }
    
        Button {
            text: "Reset"
            onClicked: helloWorldViewModel.resetMessage()
        }
    }
}

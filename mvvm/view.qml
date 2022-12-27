import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Hello 1.0
import MessageModel 1.0

ApplicationWindow {
    width: 640
    id: root
    height: 480
    visible: true
    title: qsTr("Hi!")
    
    HelloWorldViewModel {
        id: my_helloWorldViewModel
        Component.onCompleted: console.log(my_helloWorldViewModel)
    }
    
    MessageModel {
        id: my_messageModel
        Component.onCompleted: console.log(my_messageModel.message2)
    }

    ColumnLayout{ 
        anchors.fill: parent
        anchors.margins: 10
        width: 400
        spacing: 10

        Rectangle {
            height: 30
            color: "black"
            Text {  
                text: 'custom_data'
                font.pixelSize: 16
            }
        }     
        Rectangle {
            height: 30
            color: "black"
            Text {
                text: 'Something else!'
                font.pixelSize: 16
            }
        }

        Button {
            id: button
            text: "Click Me"
            onClicked: helloWorldViewModel.setMessage("Goodbye!")
        }
    
        Button {
            id: resetButton
            text: "Reset"
            onClicked: helloWorldViewModel.resetMessage("Hello, World!")
        }
    }

    // Component.onCompleted: {
    //     console.log("helloWorldViewModel.message: " + helloWorldViewModel.message);
    // }
}

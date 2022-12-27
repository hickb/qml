import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Hello 1.0
import MessageModel 1.0
// import DataProvider (Debugging) 1.0
import Debugging 1.0

ApplicationWindow {
    width: 640
    id: root
    height: 480
    visible: true
    title: qsTr("Hi!")
    
    HelloWorldViewModelTest {
        id: myHelloWorld
        Component.onCompleted: console.log(' --> ' + myHelloWorld.message())
    }
    
    MessageModel {
        id: messageModel
        Component.onCompleted: console.log('messageModel.message2()')
    }

    // adding a data provider for debugging purposes
    DataProvider {
        id: dataProvider
    }   
    
    ColumnLayout{ 
        anchors.fill: parent
        anchors.margins: 10
        width: 400
        spacing: 10

        Button {
            text: "Get Data"
            onClicked: dataProvider.button_clicked()
        }

        Text {
            text: dataProvider.get_message()
            color: "black"
        }
        Text {
            text: dataProvider.second_data
            color: "black"
        }
        Rectangle {
            height: 20
            color: "black"
            Text {  
                text: myHelloWorld.message()
                font.pixelSize: 16
            }
        }     
        Rectangle {
            height: 20
            color: "black"
            Text {
                text: messageModel.message2()
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

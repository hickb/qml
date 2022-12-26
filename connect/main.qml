import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Extras 1.4
import QtQuick.Shapes 1.15

Window {
    id: window
    visible: true
    width: 380
    height: 480
    title: qsTr("Hello World")


    Rectangle {
        id: rect
        visible: true
        width: parent.width -20
        y: 0 + 1
        height: parent.height - 20
        // border radius 10
        radius: 10        
        color: "black"
        anchors.centerIn: parent
    }

    //
    ColumnLayout 
    {
        id: columnLayout
        anchors.centerIn: parent
        spacing: 10
        
        // custom fields 

        // custom text field
        MyTextField {
            id: name
            width: rect.width - 40
            height: 30
            fontSize: 16
            placeholderText: "Enter your name"
            visible: false
        }

        // button fill entire column equlal to rectangle
        Button {
            id: button1
            text: "Click me"
            width: rect.width
            height: rect.height
            visible: true
            onClicked: {
                popup.open()
            }
        }
        // button fill entire column equlal to rectangle
        Button {
            id: button2
            text: "Click me"
            width: rect.width
            visible: true
            height: rect.height
            onClicked: {
                popup.open()
            }
        }

        Popup {
            id: popup
            width: rect.width / 2
            height: rect.height / 2
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        }

    }

    // refactoring Connnections deprecated for new method 

    Component.onCompleted: {
        // where backend.init() is a function in the backend, in other
        // file
        backend.test()


    }

    function test() {
        console.log("test")
    }

}
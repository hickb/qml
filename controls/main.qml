import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Extras 1.4


ApplicationWindow {
    title: "Qt Quick Controls Example"
    width: 1280
    height: 720
    visible: true

    ColumnLayout {
        spacing: 10

        // Button
        Button {
            text: "Button"
            onClicked: console.log("Button clicked")
        }

        // ToggleButton
        ToggleButton {
            text: "ToggleButton"
            // onToggled: console.log("ToggleButton toggled:", checked)
        }

        // CheckBox
        CheckBox {
            text: "CheckBox"
            onToggled: console.log("CheckBox toggled:", checked)
        }

        // ComboBox
        ComboBox {
            model: ["Option 1", "Option 2", "Option 3"]
            onCurrentIndexChanged: console.log("ComboBox index changed:", currentIndex)
        }

        // Menu
        Menu {
            MenuItem {
                text: "Menu Item 1"
                onTriggered: console.log("Menu Item 1 clicked")
            }
            MenuItem {
                text: "Menu Item 2"
                onTriggered: console.log("Menu Item 2 clicked")
            }
        }

        // MenuBar
        MenuBar {
            Menu {
                title: "File"
                MenuItem {
                    text: "Open"
                    onTriggered: console.log("Open clicked")
                }
                MenuItem {
                    text: "Save"
                    onTriggered: console.log("Save clicked")
                }
            }
            Menu {
                title: "Edit"
                MenuItem {
                    text: "Copy"
                    onTriggered: console.log("Copy clicked")
                }
                MenuItem {
                    text: "Paste"
                    onTriggered: console.log("Paste clicked")
                }
            }
        }

        // ListView
        ListView {
            model: ["Item 1", "Item 2", "Item 3"]
            onCurrentIndexChanged: console.log("ListView index changed:", currentIndex)
        }

        // TextField
        TextField {
            placeholderText: "Enter text here"
            onTextChanged: console.log("TextField text changed:", text)
        }

        Label {
            text: "ProgressBar"
        }
        
        // SpinBox
        SpinBox {
            value: 50
            onValueChanged: console.log("SpinBox value changed:", value)
        }

        // Slider
        Slider {
            value: 50
            onValueChanged: console.log("Slider value changed:", value)
        }

        // Dial
        Dial {
            value: 50
            onValueChanged: console.log("Dial value changed:", value)
        }
    }
}

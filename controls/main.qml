import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Extras 1.4
import QtQuick.Dialogs 1.2


ApplicationWindow {
    title: "Qt Quick Controls Example"
    width: 1280
    height: 720
    visible: true
    // dark gray background
    color: "#eaeaea"

    ColumnLayout {
        x: 300
        width: 300
        spacing: 10


        TabBar {
            id: bar2
            width: parent.width
            TabButton {
                text: qsTr("Home")
            }
            TabButton {
                text: qsTr("Discover")
            }
            TabButton {
                text: qsTr("Activity")
            }
        }


        StackLayout {
            width: parent.width
            currentIndex: bar.currentIndex
            Item {
                id: homeTab
                Text {
                    text: "Home"
                }
            }
            Item {
                id: discoverTab
                Text {
                    text: "Discover"
                }
            }
            Item {
                id: activityTab
                Text {
                    text: "Activity"
                }
            }
        }

        // Action
        Action {
            text: "Open"
            onTriggered: console.log("Open action triggered")
        }

        // ButtonGroup
        ButtonGroup {
            buttons: column.children
        }

        Column {
            id: column

            RadioButton {
                checked: true
                text: qsTr("DAB")
                onToggled: console.log("Option DAB selected:", checked)

            }

            RadioButton {
                text: qsTr("FM")
                onToggled: console.log("Option FM selected:", checked)
            }

            RadioButton {
                text: qsTr("AM")
                onToggled: console.log("Option AM selected:", checked)
            }
        }

        Rectangle {
            width: parent.width + 200
            height: textArea.height
            color: "white"
            radius: 0
            border.color: "grey"
            border.width: 1
            TextArea {
                width: 200
                id: textArea
                height: 100
                placeholderText: "In this example, a TextArea control is created with\n
                a width of 200 and a height of 100. <b>The placeholderText<\b> property is \n
                used to specify a placeholder text that is displayed when the TextArea\n
                is empty. The onTextChanged signal is emitted when the text in the \n
                TextArea is changed by the user, and a console log message is\n
                printed to display the current text."
                onTextChanged: console.log("TextArea text changed:", text)
            }

        }
        // GroupBox
        GroupBox {
            title: "GroupBox"
            Column {
                CheckBox {
                    text: "Option 1"
                    onToggled: console.log("Option 1 selected:", checked)
                }
                CheckBox {
                    text: "Option 2"
                    onToggled: console.log("Option 2 selected:", checked)
                }
                CheckBox {
                    text: "Option 3"
                    onToggled: console.log("Option 3 selected:", checked)
                }
            }
        }

        TabBar {
            id: bar
            width: parent.width

            Repeater {
                model: ["First", "Second", "Third", "Fourth", "Fifth"]

                TabButton {
                    text: modelData
                    width: Math.max(100, bar.width / 5)
                }
            }
        }

    }
    
    ColumnLayout{
        width: 300
        x: 900
        spacing: 10

        ColumnLayout {

                    // Slider
                    Slider {
                        value: 50
                        onValueChanged: console.log("Slider value changed:", value)
                    }

                    // // StackView
                    // StackView {
                    //     id: stackView
                    //     initialItem: Page {
                    //         Column {
                    //             Button {
                    //                 text: "Next"
                    //                 onClicked: stackView.push(Page {
                    //                     Column {
                    //                         Button {
                    //                             text: "Back"
                    //                             onClicked: stackView.pop()
                    //                         }
                    //                     }
                    //                 })
                    //             }
                    //         }
                    //     }
                    // }

                    // SwipeView
                    SwipeView {
                        id: swipeView
                        currentIndex: 1
                        Page {
                            Column {
                                Button {
                                    text: "Next"
                                    onClicked: swipeView.next()
                                }
                            }
                        }
                        Page {
                            Column {
                                Button {
                                    text: "Previous"
                                    onClicked: swipeView.previous()
                                }
                            }
                        }
                    }

                    // TabBar
                    TabBar {
                        id: tabBar
                        TabButton {
                            text: "Tab 1"
                        }
                        TabButton {
                            text: "Tab 2"
                        }
                        TabButton {
                            text: "Tab 3"
                        }
                    }

                    // ToolBar
                    ToolBar {
                        Action {
                            icon: Icon.open
                            onTriggered: console.log("Open action triggered")
                        }
                        Action {
                            icon: Icon.save
                            onTriggered: console.log("Save action triggered")
                        }
                    }
                    // Progress
                    // ProgressBar
                    ProgressBar {
                        value: 50
                    }

                    // // TreeView
                    // TreeView {
                    //     model: ListModel {
                    //         ListElement {
                    //             text: "Item 1"
                    //             children: ListModel {
                    //                 ListElement { text: "Subitem 1" }
                    //                 ListElement { text: "Subitem 2" }
                    //             }
                    //         }
                    //         ListElement {
                    //             text: "Item 2"
                    //             children: ListModel {
                    //                 ListElement { text: "Subitem 3" }
                    //                 ListElement { text: "Subitem 4" }
                    //             }
                    //         }
                    //     }
                    //     onCurrentIndexChanged: console.log("TreeView index changed:", currentIndex)
                    // }    


                    // Label
                    Label {
                        text: "Label"
                    }
   

                    // ScrollView
                    ScrollView {
                        ScrollBar.vertical: ScrollBar { }
                        ScrollBar.horizontal: ScrollBar { }
                        Column {
                            spacing: 10
                            Button {
                                text: "Button 1"
                            }
                            Button {
                                text: "Button 2"
                            }
                            Button {
                                text: "Button 3"
                            }
                        }
                    }


        }
    

    }

    ColumnLayout {
        width: 300
        x: 30
        spacing: 10
        
        ColumnLayout {
            // Button
            Row {
                Button {
                    text: "Button"
                    onClicked: console.log("Button clicked")
                }
                Button {
                    text: "Button"
                    onClicked: console.log("Button clicked")
                }
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
}

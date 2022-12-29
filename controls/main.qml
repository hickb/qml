import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Extras 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Material 2.12


Window {
    title: "Qt Quick Controls Example"
    width: 1280
    height: 720
    visible: true
    // dark gray background
    color: "#bababa"

    ColumnLayout {
        x: 343
        y: 93
        width: 300
        spacing: 10

        MenuBar {
            id: menuBar

            Menu { title: qsTr("File") }
            Menu { title: qsTr("Edit") }
            Menu { title: qsTr("View") }
            Menu { title: qsTr("Help") }

            delegate: MenuBarItem {
                id: menuBarItem

                contentItem: Text {
                    text: menuBarItem.text
                    font: menuBarItem.font
                    opacity: enabled ? 1.0 : 0.3
                    // color: menuBarItem.highlighted ? "#ffffff" : "#21be2b"
                    color: menuBarItem.highlighted ? "#ffffff" : (menuBarItem.text == "Edit" ? "#ff0000" : "#21be2b")
                    // lets replace the color for some of the more redish colors

                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: 40
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: menuBarItem.highlighted ? "#21be2b" : "transparent"
                }
            }

            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                color: "#ffffff"

                Rectangle {
                    color: "#21be2b"
                    width: parent.width
                    height: 1
                    anchors.bottom: parent.bottom
                }
            }
        }

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
            width: 350
            height: textArea.height
            color: "white"
            radius: 0
            border.color: "grey"
            border.width: 1
            clip: true
            TextArea {
                width: 342
                id: textArea
                x: 0
                y: 0
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
            width: 400
            contentWidth: 400

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
        x: 804
        y: 100
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

                    Switch {
                        id: control
                        text: qsTr("Switch")

                        indicator: Rectangle {
                            implicitWidth: 48
                            implicitHeight: 26
                            x: control.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 13
                            color: control.checked ? "#17a81a" : "#ffffff"
                            border.color: control.checked ? "#17a81a" : "#cccccc"

                            Rectangle {
                                x: control.checked ? parent.width - width : 0
                                width: 26
                                height: 26
                                radius: 13
                                color: control.down ? "#cccccc" : "#ffffff"
                                border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
                            }
                        }

                        contentItem: Text {
                            text: control.text
                            font: control.font
                            opacity: enabled ? 1.0 : 0.3
                            color: control.down ? "#17a81a" : "#21be2b"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: control.indicator.width + control.spacing
                        }
                    }

                    ToolBar {
                        RowLayout {
                            anchors.fill: parent

                            ToolButton {
                                text: qsTr("Action 1")
                            }
                            ToolButton {
                                text: qsTr("Action 2")
                            }

                            ToolSeparator {
                                padding: vertical ? 10 : 2
                                topPadding: vertical ? 2 : 10
                                bottomPadding: vertical ? 2 : 10

                                contentItem: Rectangle {
                                    implicitWidth: parent.vertical ? 1 : 24
                                    implicitHeight: parent.vertical ? 24 : 1
                                    color: "#c3c3c3"
                                }
                            }

                            ToolButton {
                                text: qsTr("Action 3")
                            }
                            ToolButton {
                                text: qsTr("Action 4")
                            }

                            Item {
                                Layout.fillWidth: true
                            }
                        }
                    }

                    Slider {
                        value: 50
                        onValueChanged: console.log("Slider value changed:", value)
                    }



        }


    }

    ColumnLayout {
        width: 300
        x: 55
        y: 65
        spacing: 10

        ColumnLayout {
            visible: true
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
                onPressedChanged:  console.log("ToggleButton toggled:", checked)

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

            TextField {
                placeholderText: "Enter text here"
            }

        }
    }

    ToggleButton {
        x: 182
        y: 143
        width: 46
        height: 46
        text: "ToggleButton"
        onPressedChanged:  console.log("ToggleButton toggled:", checked)

    }

    ToggleButton {
        x: 182
        y: 195
        width: 46
        height: 46
        text: "ToggleButton"
        checked: true
        onPressedChanged:  console.log("ToggleButton toggled:", checked)

    }

    Dial {
        x: 234
        y: 135
        width: 62
        height: 62
        value: 50
        onValueChanged: console.log("Dial value changed:", value)

    }

    Dial {
        x: 234
        y: 195
        width: 62
        height: 62
        value: 50
        onValueChanged: console.log("Dial value changed:", value)

    }

    Dial {
        x: 234
        y: 258
        width: 62
        height: 62
        value: 50
        onValueChanged: console.log("Dial value changed:", value)

    }

    Slider {
        x: 508
        y: 206
        value: 0.5
        onValueChanged: console.log("Slider value changed:", value)
    }

    Slider {
        x: 508
        y: 245
        value: 50
        onValueChanged: console.log("Slider value changed:", value)
    }

    Slider {
        x: 508
        y: 280
        to: 1
        from: 0
        stepSize: 0.3
        value: 0.9
        onValueChanged: console.log("Slider value changed:", value)
    }
}

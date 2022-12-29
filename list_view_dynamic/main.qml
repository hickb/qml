import QtQuick 2.15
import QtQuick.Window 2.15
import MyListModel 1.0
import QtQml.Models 2.2

Window {
    id: window
    visible: true
    width: 1280
    height: 720
    title: qsTr("Hello World")
    // dark-grey background
    color: "#2d2d2d"

    Rectangle {
        width: 200; height: 100

        DelegateModel {
            id: visualModel
            model: ListModel {
                ListElement { name: "Apple" }
                ListElement { name: "Orange" }
            }
            delegate: Rectangle {
                height: 25
                width: 100
                Text { text: "Name: " + name}
            }
        }

        ListView {
            anchors.fill: parent
            model: visualModel
        }
    }
    
    // different examples inside the same file
    
    CustomListModel {
        id: listModelCustom
        Component.onCompleted: { console.log(listModelCustom.name); }
    }
    
    // different examples inside the same file

    Column {
        x: 230
        Repeater {
            model: ["apples", "oranges", "pears"]
            Text { text: "Data 2: " + modelData }
        }
    }

    Rectangle {
        width: 200; height: 100
        x: 330

        ListModel {
            id: fruitModel

            ListElement {
                name: "Apple"
                cost: 2.45
                attributes: [
                    ListElement { description: "Core" },
                    ListElement { description: "Deciduou dosd nononos" }
                ]
            }
            ListElement {
                name: "Orange"
                cost: 3.25
                attributes: [
                    ListElement { description: "Citrus" }
                ]
            }
            ListElement {
                name: "Banana"
                cost: 1.95
                attributes: [
                    ListElement { description: "Tropical" },
                    ListElement { description: "Seedless" }
                ]
            }
        }

        Component {
            id: fruitDelegate
            Item {
                width: 200; height: 50
                Text { id: nameField; text: name }
                Text { text: '$' + cost; anchors.left: nameField.right }
                Row {
                    anchors.top: nameField.bottom
                    spacing: 5
                    Text { text: "Attributes:" }
                    Repeater {
                        model: attributes
                        Text { text: description }
                    }
                }
                // Double the price when clicked.
                MouseArea {
                    anchors.fill: parent
                    onClicked: fruitModel.setProperty(index, "cost", cost * 2)
                }                
            }
        }

        ListView {
            anchors.fill: parent
            model: fruitModel
            delegate: fruitDelegate
        }
    }
    // different examples inside the same file
    Flickable {
        id: flickable
        x: 63
        y: 175
        width: 683
        height: 298
        visible: true
        clip: false
        GridView {
            id: gridView
            x: 0
            y: 30
            width: 700
            height: 273
            opacity: 1
            visible: true
            pixelAligned: false
            flickableDirection: Flickable.AutoFlickIfNeeded
            boundsBehavior: Flickable.DragOverBounds
            clip: false
            layer.enabled: true
            activeFocusOnTab: false
            contentHeight: 100
            rotation: 0
            layoutDirection: Qt.LeftToRight
            // property var listModel: ListModel {           
            model: ListModel {         
                id: listModelStatic 
                
                ListElement {
                    name: "Houdini 19.5"
                    imageSource: "Resources/houdini.png"
                    colorCode: "houdini"
                }

                ListElement {
                    name: "Blender 2.54"
                    imageSource: "Resources/template.png"
                    colorCode: "maya2018"

                }

                ListElement {
                    name: "Maya 2022"
                    imageSource: "Resources/maya.png"
                    colorCode: "maya2022"
                }
            }

            
            cellHeight: 160
            cellWidth: 97
            delegate: Item {
                x: 5
                height: 40
                
                Column

                    {
                        Rectangle{
                            id: rectangle3
                            x: 5
                            y: 5
                            width: 90
                            height: 90
                            radius: 10
                            color: "#303030"
                            border.color: "#5f5f5f"
                            border.width: 1

                            Image {
                                id: icon
                                width: 90
                                height: 90
                                source: imageSource
                                fillMode: Image.PreserveAspectFit
                                NumberAnimation on scale {
                                    id: imageScale
                                    duration: 50
                                    easing.type: Easing.OutQuad
                                }
                            }

                            Text {
                                id: text2
                                x: 5
                                y: icon.height + 7
                                width: 90
                                maximumLineCount: 2
                                text: name
                                wrapMode: Text.WordWrap
                                color: "#eaeaea"
                                font.pixelSize: 14
                            }

                            MouseArea {
                                id: mouseArea
                                x: 5  // position of the MouseArea
                                y: 5
                                anchors.fill: icon
                                width: 5
                                height: 5
                                hoverEnabled: true


                                onEntered: {
                                    // Change the color of the image and text elements to red
                                    imageScale.to = 1.1
                                    imageScale.start()
                                    rectangle3.color = "#5f5f5f"
                                }

                                onExited: {
                                    // Change the color of the image and text elements back to their original colors
                                    imageScale.to = 1
                                    imageScale.start()
                                    rectangle3.color = "#383838"
                                }
                            }


                        }


                    }

            }
        }

    }

}
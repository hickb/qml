import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQml 2.15
import QtQuick.Window 2.15

// NOTE: visual is a bit off, but the code is correct
// we need to find ways to input data into the model
// and then display it in the list view
// delegate is the item that is repeated in the list view
// model is the data that is repeated in the list view

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("List View")
    color: "grey"

    ListView {
        anchors.fill: parent
        clip: true
        model: nameModel
        delegate: nameDelegate
        highlight: Rectangle {
            width: parent.width
            color: "lightgray"
        }
    }

    // QtObject {
    //     id: personModel
    //     property string name: ""
    //     property string imageSource: ""
    //     property int age: 0
    // }
    ListModel {
        id: nameModel
        // ListElement { name: personModel.name; imageSource: personModel.imageSource; age: personModel.age }
        ListElement { name: "Bob"; imageSource: "Resources/qt-logo.png"; age: 30 }
        ListElement { name: "Jane"; imageSource: "Resources/qt-logo.png"; age: 35 }
        ListElement { name: "Harry"; imageSource: "Resources/qt-logo.png"; age: 40 }
        ListElement { name: "Wendy"; imageSource: "Resources/qt-logo.png"; age: 45 }
    }

    Component {
        id: nameDelegate
        Item {
            width: 200
            height: 100

            property bool hovered: false
            Rectangle {
                        anchors.fill: parent
                        color: hovered ? "lightgray" : "grey"
            }
            ColumnLayout {
                spacing: 10
                anchors.centerIn: parent

                Image {
                    source: imageSource
                    width: 10
                    height: 10
                }

                Text {
                    text: name
                    font.pointSize: 14
                    color: "white"
                }

                Text {
                    text: age
                    font.pointSize: 14
                    color: "white"
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
            }
            // MouseArea {
            //     anchors.fill: parent
            //     hoverEnabled: true
            //     onEntered: {
            //         parent.hovered = true
            //     }
            //     onExited: {
            //         parent.hovered = false
            //     }
            // }

        }
    }
}

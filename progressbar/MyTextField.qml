import QtQuick.Controls 2.15
import QtQuick 2.15

Rectangle {
    border.color: "green"
    color: "white"
    radius: 4
    smooth: true
    clip: true

    TextInput {
        id: input
        anchors.fill: parent
        font.pixelSize: 20
        text: "Enter text..."
        color: focus ? "black" : "gray"
        anchors.margins: 2
        focus: true
    }
}


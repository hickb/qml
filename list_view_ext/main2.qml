import QtQuick 2.6
import QtQuick.Controls 2.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Component.onCompleted: {
        console.log("Python model: " + pythonModel.data(1))
    }

    ListView {
        anchors.fill: parent
        model: pythonModel
        delegate: Text { text: name }
    }
}

import QtQuick 2.5
import QtQml 2.15
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
        delegate: Column { 
            Text { text: name }
            Text { text: age }
            Text { text: path_image }
            Text { text: city }
        }
    }
}

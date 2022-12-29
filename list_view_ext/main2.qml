import QtQuick 2.5
import QtQml 2.15
import QtQuick.Controls 2.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Component.onCompleted: {
        if (pythonModel) {
            console.log("Python model: " + pythonModel)
        } else {
            console.log("No python model found")
        }
    }

    ListView {
        anchors.fill: parent
        model: pythonModel
        delegate: Column { 
            Text { text: name ? name : "Name is undefined" }
            Text { text: age ? age : "Age is undefined" }
            Text { text: path_image ? path_image : "Path image is undefined" }
            Text { text: city ? city : "City is undefined" }
        }
    }
}

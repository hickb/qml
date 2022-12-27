import QtQuick 2.15
import QtQuick.Controls 2.15
import MyModule 1.0

ApplicationWindow {
    id: root
    visible: true

    DataProvider {
        id: dataProvider
    }

    Button {
        text: "Get Data"
        onClicked: console.log(dataProvider.getData())
    }
    Text {
        text: dataProvider.getData()
        color: "black"
    
    }
}

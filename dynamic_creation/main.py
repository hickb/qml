import os
import sys

from PySide2.QtCore import Qt, QUrl, QObject, Signal, Slot
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, QQmlComponent

# Create a QApplication (only required for running the example in a standalone application)
app = QGuiApplication(sys.argv)

# Create a QQmlApplicationEngine
engine = QQmlApplicationEngine()

# Load the QML code from a string
qml = """
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    visible: true
    width: 300
    height: 400
    title: qsTr("Hello World")
    color: "#2d2d2d"
    Error

}
"""

# Create a QQmlComponent and load the QML code
component = QQmlComponent(engine)
component.setData(qml.encode('utf-8'), QUrl())

# Wait until the component is ready
if component.status() == QQmlComponent.Ready:
    button = component.create()
else:
    # NOTE: must be better way to do this, it's not working for me
    def on_status_changed(status):
        if status == QQmlComponent.Ready:
            # Create an instance of the QML component
            button = component.create()
        elif status == QQmlComponent.Error:
            # Print the error message
            print(component.errorString())
            for error in component.errors():
                print(error.toString())
    component.statusChanged.connect(on_status_changed)


# Execute the application and cleanup
sys.exit(app.exec_())

# NOTE: this is the same as list_view_ext\main.py but with the model
# working properly there, the code is more compact and easier to read there.
# This module requires more work to get the model working properly.
# 

import sys
from PySide2.QtCore import Property, QObject, Signal, Slot, QTimer
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType


class ListElement(QObject):
    def __init__(self, name, image_source, color_code, parent=None):
        super().__init__(parent)
        self._name = name
        self._image_source = image_source
        self._color_code = color_code

    def name(self):
        return self._name

    def image_source(self):
        return self._image_source

    def color_code(self):
        return self._color_code

    name = Property(str, fget=name, constant=True)
    color_code = Property(str, fget=color_code, constant=True)
    image_source = Property(str, fget=image_source, constant=True)

class ListModel(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._list = []

    def count(self):
        return len(self._list)

    count = Property(int, fget=count, constant=True)

    def append(self, name, image_source, color_code):
        self._list.append(ListElement(name, image_source, color_code))
  
    def get(self, index):
        if index < 0 or index >= len(self._list):
            return None
        return self._list[index]


qmlRegisterType(ListModel, "MyListModel", 1, 0, "CustomListModel")
qmlRegisterType(ListElement, "MyListElement", 1, 0, "CustomListElement")


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Create an instance of the ListModel class and pass it to the QML engine
    list_model = ListModel()

    # Load the QML file
    engine.load("list_view_dynamic/main.qml")

    sys.exit(app.exec_())

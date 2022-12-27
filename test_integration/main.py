import sys
from PySide2.QtCore import QObject, Signal, Slot
from PySide2.QtQml import qmlRegisterType, QQmlApplicationEngine
from PySide2.QtGui import QGuiApplication

class DataProvider(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)

    @Slot(result=str)
    def getData(self):
        return "some data"

qmlRegisterType(DataProvider, "MyModule", 1, 0, "DataProvider")

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load("test_integration/main.qml")

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())

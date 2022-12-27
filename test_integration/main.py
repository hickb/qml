import sys
from PySide2.QtCore import QObject, Signal, Slot, Property
from PySide2.QtQml import qmlRegisterType, QQmlApplicationEngine
from PySide2.QtGui import QGuiApplication

class DataProvider(QObject):
    
    # we will need to emit the Signal when the data changes
    dataChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self._data = "the old data"

    # we need to use the Slot decorator to expose the method to QML
    @Slot(result=str) 
    def get_message(self):
        return "current data"

    def get_message_second_method(self):
        return self._data

    def set_data_generic(self, data):
        self._data = data

    # ths is the way to expose a property to QML
    # instead of using the @Property decorator, we can use the Property class
    second_data = Property(str, get_message_second_method, set_data_generic)
    
    # we can also use the notify parameter to emit the Signal when the data changes
    second_data = Property(str, get_message_second_method, set_data_generic, notify=dataChanged)
    
    @Slot() # really important
    def button_clicked(self):
        print('button clicked!!!')
    

qmlRegisterType(DataProvider, "MyModule", 1, 0, "DataProvider")

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load("test_integration/main.qml")

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())

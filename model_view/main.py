import sys
from PySide2.QtCore import QAbstractListModel, Qt, QObject, Property, Signal, Slot
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

class MyModel(QObject):
    itemsChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self._items = ['Item 1', 'Item 2', 'Item 3']

    def rowCount(self):
        return len(self._items)

    def data(self, index):
        return self._items[index]

    @Slot(str)
    def addItem(self, item):
        self._items.append(item)
        self.itemsChanged.emit()


    @Property(int, notify=itemsChanged)
    def count(self):
        return self.rowCount()

    @Slot(int, result=str)
    def get(self, index):
        return self.data(index)

    @Slot(result=str)
    def get_elements(self):
        # convert list to string
        items = [ str(item) for item in self._items ]
        return str(items)
        

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    qmlRegisterType(MyModel, 'MyModel', 1, 0, 'MyModel')
    engine.load('model_view/view.qml')
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())


from PySide2.QtCore import QObject, Slot, Signal, QAbstractListModel, Qt

class HelloWorldViewModel(QObject):
    changeMessage = Signal(str)

    def __init__(self, model, parent=None):
        super().__init__(parent)
        self._model = model
        self._model.dataChanged.connect(self.onDataChanged)

    @property
    def message(self):
        return self._model.data(self._model.index(0), Qt.DisplayRole)

    @Slot(str)
    def setMessage(self, value):
        print('test')
        self._model.setData(self._model.index(0), value, Qt.DisplayRole)

    @Slot(str)
    def resetMessage(self):
        print("Resetting message...")
        self._model.setData(self._model.index(0), "Hello, World!", Qt.DisplayRole)
        
    @Slot()
    def onDataChanged(self):
        self.changeMessage.emit(self._model.data(self._model.index(0), Qt.DisplayRole))
        
    @Slot(str)
    def onMessageChanged(self, message):
        print(message)


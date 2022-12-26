
from PySide2.QtCore import QObject, Slot, Signal, QAbstractListModel, Qt

class HelloWorldViewModel(QObject):
    changeMessage = Signal(str)

    def __init__(self, model, parent=None):
        super().__init__(parent)
        self._model = model
        self._model.dataChanged.connect(self.onDataChanged)
        print("Data changed")


    @property
    def message(self):
        print('message property called')
        return self._model.data(self._model.index(0), Qt.DisplayRole)

    @Slot(str)
    def setMessage(self, value):
        print("Setting message to " + value)
        self._model.setData(self._model.index(0), value, Qt.DisplayRole)

    @Slot(str)
    def resetMessage(self, message):
        print("Resetting message...")
        self._model.setData(self._model.index(0), message, Qt.DisplayRole)

    @Slot()
    def onDataChanged(self):
        message = self._model.data(self._model.index(0), Qt.DisplayRole)
        self.changeMessage.emit(message)
        print("onDataChanged: {}".format(message))
        
    @Slot(str)
    def onMessageChanged(self, message):
        print("onMessageChanged: {}".format(message))
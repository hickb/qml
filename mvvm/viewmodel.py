
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
        ''' The message property. 
        property that provides access to the message data in the model. 
        It allows the view to retrieve the message from the view model 
        and display it to the user.
        '''
        print('message property called')
        return self._model.data(self._model.index(0), Qt.DisplayRole)

    @Slot(str)
    def setMessage(self, value):
        ''' The setMessage method.
        method that allows the view to set the message in the model.
        '''    
        print("Setting message to " + value)
        self._model.setData(self._model.index(0), value, Qt.DisplayRole)

    @Slot(str)
    def resetMessage(self, message):
        print("Resetting message...")
        self._model.setData(self._model.index(0), message, Qt.DisplayRole)

    @Slot()
    def onDataChanged(self):
        print(f"onDataChanged: {self}")
        message = self._model.data(self._model.index(0), Qt.DisplayRole)
        self.changeMessage.emit(message)
        
    @Slot(str)
    def onMessageChanged(self, message):
        print("onMessageChanged: {}".format(message))

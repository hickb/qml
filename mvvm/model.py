# model.py
from PySide2.QtCore import QAbstractListModel, Qt

class MessageModel(QAbstractListModel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._messages = ["Hello, World!"]

    def rowCount(self, parent=None) -> int:
        ''' Returns the number of rows the model holds. 
        '''
        return len(self._messages)

    def data(self, index, role=Qt.DisplayRole):
        if not index.isValid() or index.row() >= len(self._messages):
            return None

        if role == Qt.DisplayRole:
            return self._messages[index.row()]

        return None

    def setData(self, index, value, role=Qt.EditRole):
        if not index.isValid() or index.row() >= len(self._messages) or role != Qt.EditRole:
            return False

        self._messages[index.row()] = value
        self.dataChanged.emit(index, index, [Qt.EditRole])
        return True

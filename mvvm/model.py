# model.py
from PySide2.QtCore import QAbstractListModel, Qt

class MessageModel(QAbstractListModel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._messages = ["Hello, World!"]

    def rowCount(self, parent=None) -> int:
        ''' Returns the number of rows the model holds. 
        '''
        print(f'rowCount: {len(self._messages)}')
        return len(self._messages)

    def data(self, index, role=Qt.DisplayRole):
        
        if not index.isValid() or index.row() >= len(self._messages):
            print("Not valid index or row index is greater than length of messages")
            return None

        if role == Qt.DisplayRole:
            print(f'data: {self._messages[index.row()]}')
            return self._messages[index.row()]

        return None

    def setData(self, index, value, role=Qt.EditRole):
        print("setData")
        if not index.isValid() or index.row() >= len(self._messages) or role != Qt.EditRole:
            return False
        print("setData: index is valid")
        self._messages[index.row()] = value
        print("setData: self._messages changed")
        self.dataChanged.emit(index, index, [Qt.EditRole])
        print("setData: dataChanged emitted")
        return True

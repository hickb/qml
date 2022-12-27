# model.py
from PySide2.QtCore import QAbstractListModel, Qt, Slot

class MessageModel(QAbstractListModel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._messages = ["Hello, World !", "Hi there!", "Goodbye!"]

    def rowCount(self, parent=None) -> int:
        ''' Returns the number of rows the model holds. 
        '''
        print(f'rowCount: {len(self._messages)}')
        return len(self._messages)

    @Slot(result=str) 
    def message2(self):
        ''' The message property.
        property that provides access to the message data in the model.
        It allows the view to retrieve the message from the view model
        and display it to the user.
        '''
        print('message property called')
        return "message 2 inside MessageModel class"
    
    def data(self, index, role=Qt.DisplayRole):
        ''' Returns the data stored under the given role for the item referred to by the index.
        '''
        print('data called...')
        
        if not index.isValid() or index.row() >= len(self._messages):
            print("Not valid index or row index is greater than length of messages")
            return None

        if role == Qt.DisplayRole:
            print(f'data: {self._messages[index.row()]}')
            return self._messages[index.row()]

        return None

    def setData(self, index, value, role=Qt.EditRole):
        print("index:", index)
        print("index.isValid():", index.isValid())
        print("index.row():", index.row())
        print('index.row() >= len(self._messages):', index.row() >= len(self._messages))
        print("role:", role)
        print("role != Qt.EditRole:", role != Qt.EditRole)
        print(f"setData: index: {index} value: {value} role: {role}")
        if not index.isValid() or index.row() >= len(self._messages) or role != Qt.ItemDataRole.DisplayRole:
            print("setData: index is NOT valid")
            return False
        print("setData: index is valid")
        self._messages[index.row()] = value
        print("setData: self._messages changed")
        self.dataChanged.emit(index, index, [Qt.EditRole])
        print("setData: dataChanged emitted")
        return True

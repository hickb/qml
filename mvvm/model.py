from PySide2.QtCore import QObject, Signal, QAbstractListModel, Qt

class MessageModel(QAbstractListModel):
    messageChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self._messages = ["Hello World!", "Goodbye!"]

    def rowCount(self, parent=None):
        return len(self._messages)

    def data(self, index, role=Qt.DisplayRole):
        if role == Qt.DisplayRole:
            return self._messages[index.row()]
        return None

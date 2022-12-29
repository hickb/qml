import sys
from PySide2.QtCore import QAbstractListModel, QModelIndex, Qt
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

# Define the data structure in Python
data = [
    {"name": "Bob", "age": 30},
    {"name": "Jane", "age": 35},
    {"name": "Harry", "age": 40},
    {"name": "Wendy", "age": 45},
]

# Create a Python model class that subclasses QAbstractListModel
class PythonModel(QAbstractListModel):
    def __init__(self, data):
        super().__init__()
        self._data = data
        # Define the role names
        self.role_names = {
            Qt.DisplayRole: b"name",
            Qt.UserRole: b"user_name",
        }
        
    def rowCount(self, parent=QModelIndex()):
        return len(self._data)

    def data(self, index, role=Qt.DisplayRole):
        print("data called")
        print(f'index: {index} role {role}')

        if role == Qt.DisplayRole:
            row = index.row()
            # return self._data[row]["name"]
            return f"{ self._data[row]['name']} {self._data[row]['age']}"

    # Provide the role names for the QML view
    def roleNames(self):
        return self.role_names

# Create the QML application
app = QGuiApplication(sys.argv)

# Create an instance of the Python model and pass it to the QML engine
engine = QQmlApplicationEngine()
python_model = PythonModel(data)

# we will replace te setContextProperty to use qmlRegisterType instead
engine.rootContext().setContextProperty("pythonModel", python_model)

print(python_model)

print(python_model.rowCount())

# Register the Python model with the qmlRegisterType
# NOTE: we can't use it because we need to pass the data to the model
# qmlRegisterType(PythonModel, "PythonModel", 1, 0, "PythonModel")

# Load the QML file and display the window
engine.load("list_view_ext/main2.qml")
app.exec_()

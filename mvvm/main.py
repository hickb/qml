# main.py
import sys
from PySide2.QtCore import QUrl, QAbstractListModel, Property, Slot, Signal, QObject
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

from model import MessageModel
from viewmodel import HelloWorldViewModel

# NOTE: This module requires a clean up, the HelloWorldViewModelTest class is not used
# and required for MVVM to work, also DataProvider is not used and required for MVVM to work either.add()
# but it is used in the test_integration\main.py and it was used here to test the integration with QML
# using MVVM pattern.

class HelloWorldViewModelTest(QObject):
    def __init__(self, parent=None):
        # self._datas = ['un', 'deux', 'trois']
        super().__init__(parent=parent)
        print(f"HelloWorldViewModelTest: {self}")

    @Slot(result=str) # really important
    def message(self):
        return "Test value"

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
        

qmlRegisterType(HelloWorldViewModelTest, "Hello", 1, 0, "HelloWorldViewModelTest")
qmlRegisterType(MessageModel, "MessageModel", 1, 0, "MessageModel")

# copying and pasting the code from the test_integration\main.py
qmlRegisterType(DataProvider, "Debugging", 1, 0, "DataProvider")

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    # Create the model
    model = MessageModel()

    # Create the view model
    viewmodel = HelloWorldViewModel(model)
    
    print(viewmodel)  # Print the value of the viewmodel object
    print(f"viewmodel.message: {viewmodel.message}")

    # Create the QML engine and set the view model as a context property
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("helloWorldViewModel", viewmodel)
    
    # print(f'--> {engine.rootContext().contextProperty("helloWorldViewModel")}')

    # Connect the view model's changeMessage signal to the onMessageChanged method
    viewmodel.changeMessage.connect(viewmodel.onMessageChanged)

    # Load the QML file
    engine.load(QUrl.fromLocalFile('mvvm/view.qml'))

    sys.exit(app.exec_())

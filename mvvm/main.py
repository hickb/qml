# main.py
import sys
from PySide2.QtCore import QUrl, QAbstractListModel, Property
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

from model import MessageModel
from viewmodel import HelloWorldViewModel


class HelloWorldViewModelTest(QAbstractListModel):
    def __init__(self, parent=None):
        self._datas = ['un', 'deux', 'trois']
        super().__init__(parent=parent)
        print(f"HelloWorldViewModelTest: {self}")
        self.message = "Hello, World!"

        @Property(str)
        def messsage(self):
            return "Test value"


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
    
    qmlRegisterType(HelloWorldViewModelTest, "Hello", 1, 0, "HelloWorldViewModel")
    qmlRegisterType(MessageModel, "MessageModel", 1, 0, "MessageModel")

    # print(f'--> {engine.rootContext().contextProperty("helloWorldViewModel")}')

    # Connect the view model's changeMessage signal to the onMessageChanged method
    viewmodel.changeMessage.connect(viewmodel.onMessageChanged)

    # Load the QML file
    engine.load(QUrl.fromLocalFile('mvvm/view.qml'))

    sys.exit(app.exec_())

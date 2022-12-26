# main.py
import sys
from PySide2.QtCore import QUrl
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

from model import MessageModel
from viewmodel import HelloWorldViewModel

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    # Create the model
    model = MessageModel()

    # Create the view model
    viewmodel = HelloWorldViewModel(model)

    # Create the QML engine and set the view model as a context property
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("helloWorldViewModel", viewmodel)

    # Connect the view model's changeMessage signal to the onMessageChanged method
    viewmodel.changeMessage.connect(viewmodel.onMessageChanged)

    # Load the QML file
    engine.load(QUrl.fromLocalFile('mvvm/view.qml'))

    sys.exit(app.exec_())

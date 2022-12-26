# main.py
import sys
from PySide2.QtCore import QUrl
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

from model import HelloWorldModel

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    # Create the model
    model = HelloWorldModel()

    # Connect the model's buttonClicked signal to the sayHello slot
    model.buttonClicked.connect(model.sayHello)
    model.secondButtonClicked.connect(model.sayGoodbye)

    # Create the QML engine and set the model as a context property
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("helloWorldModel", model)

    # Load the QML file
    engine.load(QUrl.fromLocalFile('view_framework/view.qml'))

    sys.exit(app.exec_())
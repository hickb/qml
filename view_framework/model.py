# model.py
from PySide2.QtCore import QObject, Signal, Slot

class HelloWorldModel(QObject):
    buttonClicked = Signal()
    secondButtonClicked = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)

    @Slot()
    def sayHello(self):
        print("Hello World!")

    @Slot()
    def sayGoodbye(self):
        print("Goodbye!")
        
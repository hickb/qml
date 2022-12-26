# main.py loads qml files and runs the application

import sys
from PySide2.QtCore import QUrl
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Signal, Slot

class MainWindow(QObject):
    '''
    The main window class.
    '''

    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        self.name = "World"

    setName = Signal(str)
    
    @Slot(str)
    def test(self):
        print("test")
        self.setName.emit("test")


app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

main =  MainWindow()

engine.rootContext().setContextProperty("backend", main)



engine.load(QUrl.fromLocalFile('connect/main.qml'))
if not engine.rootObjects():
    sys.exit(-1)
#else:
#    print(engine.rootObjects())    
sys.exit(app.exec_())
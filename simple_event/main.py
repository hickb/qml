# main.py loads qml files and runs the application

import sys
import os

import sys
from PySide2.QtCore import QUrl
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()
engine.load(QUrl.fromLocalFile('simple_event/main.qml'))
if not engine.rootObjects():
    sys.exit(-1)
#else:
#    print(engine.rootObjects())    
sys.exit(app.exec_())
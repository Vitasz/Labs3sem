QT += core qml widgets
QT += charts
CONFIG += c++2a

#LIBS += -L. -lQtCharts
HEADERS = $$files($$PWD/*.hpp)
SOURCES = $$files($$PWD/*.cpp)

RESOURCES += resources.qrc

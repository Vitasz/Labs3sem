QT += core qml quickwidgets concurrent testlib
QT += charts
CONFIG += c++2a

#LIBS += -L. -lQtCharts
HEADERS = $$files($$PWD/src/*.h) \ $$files($$PWD/src/Lab1/*.h)
SOURCES = $$files($$PWD/src/*.cpp)

#SOURCES += $$files($$PWD/test/*.cpp)
RESOURCES += src/resources.qrc


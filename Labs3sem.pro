QT += core qml quickwidgets concurrent testlib
QT += charts
CONFIG += c++2a

#LIBS += -L. -lQtCharts
HEADERS = $$files($$PWD/src/*.h) \ $$files($$PWD/src/Lab1/*.h) \
    src/Lab1/TestClassSmartPointers.h
SOURCES = $$files($$PWD/src/*.cpp)

#SOURCES += $$files($$PWD/test/*.cpp)
RESOURCES += src/resources.qrc


QT += core qml quickwidgets concurrent testlib
QT += charts
CONFIG += c++2a

#LIBS += -L. -lQtCharts
HEADERS = $$files($$PWD/src/*.h) \ $$files($$PWD/src/Lab1/*.h) \
    src/Lab1/TestClassSmartPointers.h \
    src/Lab2/QTSortingAlgorithms.h \
    src/Lab2/SortingAlgorithms.h \
    src/Lab2/TestClassSorts.h \
    src/Lab2/test.h
SOURCES = $$files($$PWD/src/*.cpp)

#SOURCES += $$files($$PWD/test/*.cpp)
RESOURCES += src/resources.qrc


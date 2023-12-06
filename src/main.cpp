#include <QQmlContext>
#include <QApplication>
#include <QQmlApplicationEngine>
#include "testclass.h"
#include "Lab1/TestClassSmartPointers.h"
#include "Lab1/Lab1.h"
#include <QDebug>
#include <iostream>
int main(int argc, char** argv){
    QApplication app(argc, argv); //Here etc..

    QQmlApplicationEngine engine(&app);
    QQmlContext* ctx = engine.rootContext();

    //ctx->setContextProperty("backend", new Backend());
    qmlRegisterType<BaseTestClass>("qml.testclass", 1, 0, "TestClass");
    qmlRegisterType<TestClassSmartPointers>("qml.testclasssmrt", 1, 0, "TestClassSmartPointers");

    //SmrtPtr<int> test = SmrtPtr<int>(new int(10));
    //qDebug() << *test<<'\n';
    engine.load("qrc:/MainWindow.qml");
    return app.exec();
}

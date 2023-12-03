#include <QQmlContext>
#include <QApplication>
#include <QQmlApplicationEngine>
#include "testclass.h"

int main(int argc, char** argv){
    QApplication app(argc, argv); //Here etc..

    QQmlApplicationEngine engine(&app);
    QQmlContext* ctx = engine.rootContext();

    //ctx->setContextProperty("backend", new Backend());
    qmlRegisterType<TestClass>("qml.testclass", 1, 0, "TestClass");
    engine.load("qrc:/MainWindow.qml");
    return app.exec();
}

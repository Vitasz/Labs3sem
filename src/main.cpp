#include <QQmlContext>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <Windows.h>

#include "Lab1/TestClassSmartPointers.h"
#include "Lab2/TestClassSorts.h"
#include "Lab3/DynamicHashMapWrapper.h"
#include "Lab4/TestClassPaths.h"
#include <QDebug>


#pragma comment(linker, "/SUBSYSTEM:windows /ENTRY:mainCRTStartup")
int main(int argc, char** argv){
    FreeConsole();

    QApplication app(argc, argv); //Here etc..

    QQmlApplicationEngine engine(&app);
    QQmlContext* ctx = engine.rootContext();

    //ctx->setContextProperty("backend", new Backend());
    //qmlRegisterType<BaseTestClass>("qml.testclass", 1, 0, "TestClass");
    qmlRegisterType<TestClassSmartPointers>("qml.testclasssmrt", 1, 0, "TestClassSmartPointers");
    qmlRegisterType<TestClassSorts>("qml.testclasssrts", 1, 0, "TestClassSorts");
    qmlRegisterType<DynamicHashMapWrapper>("HashMapWrapper", 1, 0, "DynamicHashMapWrapper");
    qmlRegisterType<TestClassPaths>("TestClassPaths", 1, 0, "TestClassPaths");

    const QUrl url(QStringLiteral("qrc:/MainWindow.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}

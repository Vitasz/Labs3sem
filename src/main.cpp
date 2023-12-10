#include <QQmlContext>
#include <QApplication>
#include <QQmlApplicationEngine>


#include "Lab1/TestClassSmartPointers.h"
#include "Lab2/TestClassSorts.h"
#include <QDebug>

int main(int argc, char** argv){
    QApplication app(argc, argv); //Here etc..

    QQmlApplicationEngine engine(&app);
    QQmlContext* ctx = engine.rootContext();

    //ctx->setContextProperty("backend", new Backend());
    //qmlRegisterType<BaseTestClass>("qml.testclass", 1, 0, "TestClass");
    qmlRegisterType<TestClassSmartPointers>("qml.testclasssmrt", 1, 0, "TestClassSmartPointers");
    qmlRegisterType<TestClassSorts>("qml.testclasssrts", 1, 0, "TestClassSorts");
    //qmlRegisterType<SortVisualizer>("SortVisualizer", 1, 0, "SortVisualizer");
    //SortingAlgorithm sortingAlgorithm;
    //engine.rootContext()->setContextProperty("sortingAlgorithm", &sortingAlgorithm);
    const QUrl url(QStringLiteral("qrc:/MainWindow.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}

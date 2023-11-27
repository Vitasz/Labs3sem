#include <QQmlContext>
#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char** argv){
    QApplication app(argc, argv); //Here etc..

    QQmlApplicationEngine engine(&app);
    QQmlContext* ctx = engine.rootContext();

    //ctx->setContextProperty("backend", new Backend());

    engine.load("qrc:/MainWindow.qml");

    return app.exec();
}

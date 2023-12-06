#include <QObject>
#include <QFuture>
#include <QtConcurrent>

class BaseTestClass : public QObject {
    Q_OBJECT
    Q_PROPERTY(int n READ N WRITE setN NOTIFY nChanged)
     Q_PROPERTY(double result READ getResult)
public:
    explicit BaseTestClass(QObject *parent = nullptr) : QObject(parent), m_N(0) {}

    int N() const { return m_N; }
    void setN(int n) {
        if (n != m_N) {
            m_N = n;
            emit this->nChanged();
        }
    }
    double getResult() const{
        return m_result;
    }
    Q_INVOKABLE void testFunction() {
        QtConcurrent::run([&](){
            // Replace this with your actual test function
            QThread::sleep(1); // Simulate a time-consuming task
            m_result = 1.0;
            emit this->testFinished();
            //return m_N * 2.0; // Simulate a result
        });
    }

signals:
    void testFinished();
    void nChanged();


private:
    int m_N;
    double m_result;
};

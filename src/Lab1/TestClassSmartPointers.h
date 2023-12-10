#include <QObject>
#include <QFuture>
#include <QtConcurrent>
#include <QTimer>

#include "Lab1.h"

class TestClassSmartPointers : public QObject {
    Q_OBJECT
    Q_PROPERTY(int n READ N WRITE setN NOTIFY nChanged)
    //Q_PROPERTY(double result READ getResult)
public:
    explicit TestClassSmartPointers(QObject *parent = nullptr) : QObject(parent), m_N(0) {}

    int N() const { return m_N; }
    void setN(int n) {
        if (n != m_N) {
            m_N = n;
            emit this->nChanged();
        }
    }
public slots:
    //SMART POINTERS
    QFuture<double> testMySmartPointer(int n) {
         return QtConcurrent::run([=]() {
            auto start = std::chrono::high_resolution_clock::now();

            std::vector<SmrtPtr<int>*> vec;
            for(int i =0;i < n; ++i){
                vec.push_back(new SmrtPtr<int>(new int(i)));
            }

            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            for(int i = 0; i < n; ++i){
                delete vec[i];
            }
            emit this->testMySmartResult(n, duration.count()/1000.0);

            return duration.count()/1000.0;
        });
    }
    QFuture<double> testSequence(int n) {
        return QtConcurrent::run([=]() {
            auto start = std::chrono::high_resolution_clock::now();

            int* arr = new int[n];
            for (int i = 0; i < n; ++i) {
                *(arr+i) = i;
            }
            delete[] arr;
            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);


            emit  this->testSequenceResult(n, duration.count()/1000.0);
            return duration.count() / 1000.0;
        });
    }

    //SHARED POINTERS
    QFuture<double> testMySharedPointer(int n) {
        return QtConcurrent::run([=]() {
            auto start = std::chrono::high_resolution_clock::now();

            std::vector<ShrdPtr<int>*> vec;
            for(int i =0;i < n; ++i){
                vec.push_back(new ShrdPtr<int>(new int(i)));
            }

            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            for(int i = 0; i < n; ++i){
                delete vec[i];
            }
            emit this->testMySharedResult(n, duration.count()/1000.0);
            return duration.count()/1000.0;
        });
    }
    QFuture<double> testSTLSharedPointer(int n) {
        return QtConcurrent::run([=]() {
            auto start = std::chrono::high_resolution_clock::now();

            std::vector<std::shared_ptr<int>> vec;
            for(int i =0;i < n; ++i){
                vec.push_back(std::make_shared<int>(i));
            }

            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            emit this->testSTLSharedResult(n, duration.count()/1000.0);
            return duration.count()/1000.0;
        });
    }

    //UNIQUE POINTERS
    QFuture<double> testMyUniquePointer(int n) {
        return QtConcurrent::run([=]() {
            auto start = std::chrono::high_resolution_clock::now();

            std::vector<UnqPtr<int>*> vec;
            for(int i =0;i < n; ++i){
                vec.push_back(new UnqPtr<int>(new int(i)));
            }

            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            for(int i = 0; i < n; ++i){
                delete vec[i];
            }
            emit this->testMyUniqueResult(n, duration.count()/1000.0);
            return duration.count()/1000.0;
        });
    }
    QFuture<double> testSTLUniquePointer(int n) {
        return QtConcurrent::run([=]() {
            auto start = std::chrono::high_resolution_clock::now();

            std::vector<std::unique_ptr<int>> vec;
            for(int i =0;i < n; ++i){
                vec.push_back(std::make_unique<int>(i));
            }

            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            emit this->testSTLUniqueResult(n, duration.count()/1000.0);
            return duration.count()/1000.0;
        });
    }

    //MEMORY SPAN
    QFuture<double> testMyMemoryspanPointer(int n) {
        return QtConcurrent::run([=]() {
            auto start = std::chrono::high_resolution_clock::now();

            MemorySpan<int> memorySpan(new int[n], n);
            MsPtr<int> index = memorySpan.locate(0);

            for(int i = 0; i < n-1; i++){
                *(index) = i;

                //std::cout<<*(index)<<'\n';
                index++;
            }
            delete[] memorySpan.getData();
            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            //std::cout<<duration<<'\n';
            emit this->testMyMemoryspanResult(n, duration.count()/1000.0);
            return duration.count()/1000.0;
        });
    }


signals:
    void testSequenceResult(int n, double result);
    void testMySmartResult(int n, double result);

    void testSTLSharedResult(int n, double result);
    void testMySharedResult(int n, double result);

    void testMyMemoryspanResult(int n, double result);

    void testSTLUniqueResult(int n, double result);
    void testMyUniqueResult(int n, double result);
    void nChanged();


private:
    int m_N;
    double m_result;
    QTimer *timer;
};

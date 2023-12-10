#ifndef TESTCLASSSORTS_H
#define TESTCLASSSORTS_H
#include <QObject>
#include <QFuture>
#include <QtConcurrent>
#include <QTimer>
#include <QQmlApplicationEngine>

#include <vector>
#include <random>
#include "SortingAlgorithms.h"



class TestClassSorts : public QObject {
    Q_OBJECT
    Q_PROPERTY(int n READ N WRITE setN NOTIFY nChanged)
    //Q_PROPERTY(double result READ getResult)
public:
    enum GenType {
        Random,
        SortedBegin,
        SortedEnd,
        Sorted,
        ManyOrdinary
    };

    //enum Valtype{
    //    Int,
    //    String
   // };

    Q_ENUM(GenType)
    explicit TestClassSorts(QObject *parent = nullptr) : QObject(parent), m_N(0) {}

    int N() const { return m_N; }
    void setN(int n) {
        if (n != m_N) {
            m_N = n;
            emit this->nChanged();
        }
    }
public slots:
    //SMART POINTERS
    QFuture<double> testBubbleSort(int n, GenType type) {
        return QtConcurrent::run([=]() {

            auto data = generate(n, type);
            auto start = std::chrono::high_resolution_clock::now();

            bubbleSort(data, std::greater<int>());


            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            emit this->testBubbleSortResult(n, duration.count()/1000.0);

            return duration.count()/1000.0;
        });
    }

    QFuture<double> testQuickSort(int n, GenType type) {
        return QtConcurrent::run([=]() {

            auto data = generate(n, type);
            auto start = std::chrono::high_resolution_clock::now();

            quickSort(data, std::greater<int>());


            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            emit this->testQuickSortResult(n, duration.count()/1000.0);

            return duration.count()/1000.0;
        });
    }
    QFuture<double> testShellSort(int n, GenType type) {
        return QtConcurrent::run([=]() {

            auto data = generate(n, type);
            auto start = std::chrono::high_resolution_clock::now();

            shellSort(data, std::greater<int>());


            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            emit this->testShellSortResult(n, duration.count()/1000.0);

            return duration.count()/1000.0;
        });
    }
    QFuture<double> testRadixSort(int n, GenType type) {
        return QtConcurrent::run([=]() {

            auto data = generate(n, type);
            auto start = std::chrono::high_resolution_clock::now();

            radixSort(data);


            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start);
            emit this->testRadixSortResult(n, duration.count()/1000.0);

            return duration.count()/1000.0;
        });
    }
signals:
    void testBubbleSortResult(int n, double result);
    void testQuickSortResult(int n, double result);

    void testShellSortResult(int n, double result);
    void testRadixSortResult(int n, double result);
    void nChanged();


private:
    int m_N;
    double m_result;
    QTimer *timer;

    std::vector<int> generate(int n, GenType type){
        std::vector<int> arr(n);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(1, n);

        switch (type){
            case Random:
                for(int i = 0;i <n ;i++){
                    arr[i] = distribution(gen);
                }
                break;
            case SortedBegin:
                for(int i = 0;i <n/2 ;i++){
                    arr[i] = i;
                }
                for(int i = n/2; i < n; i++){
                    arr[i] = distribution(gen)+n;
                }
                break;
            case SortedEnd:
                for(int i = 0;i <n/2 ;i++){
                    arr[i] = distribution(gen);
                }
                for(int i = n/2; i < n; i++){
                    arr[i] = i+n;
                }
            case Sorted:
                for(int i = 0;i < n;i++){
                    arr[i] = i;
                }
            case ManyOrdinary:
                std::uniform_int_distribution<int> ordinarydistribution(1, 100);
                for(int i = 0;i < n;i++){
                    arr[i] = distribution(gen);
                }
                break;
        }
        return arr;
    }
};

#endif // TESTCLASSSORTS_H

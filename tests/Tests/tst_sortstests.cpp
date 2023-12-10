#include <QtTest>
#include <vector>
#include <algorithm>
#include <functional>
#include "../../../Labs3sem/src/Lab2/SortingAlgorithms.h"
#include <string>
// add necessary includes here

class SortsTests : public QObject
{
    Q_OBJECT
    template <typename T, typename Comparator>
    bool isSorted(const std::vector<T>& arr, Comparator cmp) {
        for(int i = 0; i < arr.size() - 1; i++){
            if (cmp(arr[i], arr[i+1]) < 0) return false;
        }
        return true;
    }
    std::string generateRandomString(int length, std::mt19937 &gen) {
        static const char alphanum[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        std::uniform_int_distribution<int> distribution(0, sizeof(alphanum) - 2);

        std::string randomString;
        randomString.reserve(length);

        for (int i = 0; i < length; ++i) {
            randomString += alphanum[distribution(gen)];
        }

        return randomString;
    }
private slots:
    void testBubbleSortInt() {
        int n = 10000;
        std::vector<int> arr(n);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(1, n);
        for(int i = 0;i <n ;i++){
            arr[i] = distribution(gen);
        }
        bubbleSort(arr, std::greater<int>());
        QVERIFY(isSorted(arr, std::greater<int>()));
    }

    void testQuickSortInt() {
        int n = 10000;
        std::vector<int> arr(n);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(1, n);
        for(int i = 0;i <n ;i++){
            arr[i] = distribution(gen);
        }
        quickSort(arr, std::less<int>());
        QVERIFY(isSorted(arr, std::less<int>()));
    }

    void testShellSortInt() {
        int n = 10000;
        std::vector<int> arr(n);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(1, n);
        for(int i = 0;i <n ;i++){
            arr[i] = distribution(gen);
        }
        shellSort(arr, std::less<int>());
        QVERIFY(isSorted(arr, std::less<int>()));
    }

    void testRadixSortInt() {
        int n = 10000;
        std::vector<int> arr(n);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(1, n);
        for(int i = 0;i <n ;i++){
            arr[i] = distribution(gen);
        }
        radixSort(arr);
        QVERIFY(isSorted(arr, std::less<int>()));
    }
    void testBubbleSortString() {
        int n = 10000;
        std::vector<std::string> arr(n);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(1, n);

        for (int i = 0; i < n; i++) {
            // Generate random strings of length 5
            arr[i] = generateRandomString(5, gen);
        }

        bubbleSort(arr, std::greater<std::string>());
        QVERIFY(isSorted(arr, std::greater<std::string>()));
    }

    void testQuickSortString() {
        int n = 10000;
        std::vector<std::string> arr(n);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(1, n);

        for (int i = 0; i < n; i++) {
            // Generate random strings of length 5
            arr[i] = generateRandomString(5, gen);
        }

        quickSort(arr, std::less<std::string>());
        QVERIFY(isSorted(arr, std::less<std::string>()));
    }

    void testShellSortString() {
        int n = 10000;
        std::vector<std::string> arr(n);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(1, n);

        for (int i = 0; i < n; i++) {
            // Generate random strings of length 5
            arr[i] = generateRandomString(5, gen);
        }

        shellSort(arr, std::less<std::string>());
        QVERIFY(isSorted(arr, std::less<std::string>()));
    }


};

QTEST_APPLESS_MAIN(SortsTests)

#include "tst_sortstests.moc"

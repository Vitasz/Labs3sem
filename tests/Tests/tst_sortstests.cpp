#include <QtTest>
#include <vector>
#include <algorithm>
#include <functional>
#include <string>

#include "../../src/Lab2/SortingAlgorithms.h"
#include "../../src/Lab1/Lab1.h"

class SmartPointerTests : public QObject {
    Q_OBJECT

private slots:
    // Test case for Unique Pointer
    void testUniquePointer() {
        int* rawPointer = new int(42);

        // Test creation of Unique Pointer
        UnqPtr<int> uniquePtr(rawPointer);
        QVERIFY(uniquePtr.operator->() == rawPointer);
        QVERIFY(*uniquePtr == 42);

        // Test move constructor
        UnqPtr<int> movedPtr(std::move(uniquePtr));
        QVERIFY(uniquePtr.operator->() == nullptr); // Original pointer should be null
        QVERIFY(*movedPtr == 42);

        // Test move assignment
        UnqPtr<int> anotherUniquePtr= std::move(movedPtr);
        QVERIFY(movedPtr.operator->() == nullptr); // Original pointer should be null
        QVERIFY(*anotherUniquePtr == 42);
    }

    // Test case for Shared Pointer
    void testSharedPointer() {
        int* rawPointer = new int(42);

        // Test creation of Shared Pointer
        ShrdPtr<int> sharedPtr(rawPointer);
        QVERIFY(sharedPtr.operator->() == rawPointer);
        QVERIFY(*sharedPtr == 42);

        // Test copy constructor
        ShrdPtr<int> copiedPtr(sharedPtr);
        QVERIFY(sharedPtr.operator->() == rawPointer); // Original pointer should remain unchanged
        QVERIFY(*copiedPtr == 42);

        // Test copy assignment
        ShrdPtr<int> anotherSharedPtr= sharedPtr;
        QVERIFY(sharedPtr.operator->() == rawPointer); // Original pointer should remain unchanged
        QVERIFY(*anotherSharedPtr == 42);

        // Test move constructor
        ShrdPtr<int> movedPtr(std::move(sharedPtr));
        QVERIFY(sharedPtr.operator->() == nullptr); // Original pointer should be null
        QVERIFY(*movedPtr == 42);

        // Test move assignment
        ShrdPtr<int> yetAnotherSharedPtr = std::move(movedPtr);
        QVERIFY(movedPtr.operator->() == nullptr); // Original pointer should be null
        QVERIFY(*yetAnotherSharedPtr == 42);

        // Test reference counting
        int* rawPointer2 = new int(43);
        ShrdPtr<int> sharedPtr1(rawPointer2);
        ShrdPtr<int> sharedPtr2 = sharedPtr1;
        QVERIFY(*sharedPtr1 == 43);
        QVERIFY(*sharedPtr2 == 43);
    }

    void testMemorySpan() {
        int array[] = {1, 2, 3, 4, 5};
        size_t size = sizeof(array) / sizeof(array[0]);

        MemorySpan<int> memorySpan(array, size);

        QCOMPARE(memorySpan.getData(), array);
        QCOMPARE(memorySpan.getSize(), size);

        // Test get method
        UnqPtr<int> element = memorySpan.get(2);
        QCOMPARE(*element, 3);

        // Test locate method
        MsPtr<int> msPtr = memorySpan.locate(1);
        QCOMPARE(*msPtr, 2);

        // Test copy method
        ShrdPtr<int> copyPtr = memorySpan.copy(3);
        QCOMPARE(*copyPtr, 4);
    }

    // Test case for MsPtr
    void testMsPtr() {
        int array[] = {1, 2, 3, 4, 5};
        size_t size = sizeof(array) / sizeof(array[0]);

        MemorySpan<int> memorySpan(array, size);

        // Test MsPtr construction
        MsPtr<int> msPtr(memorySpan, 2);
        QCOMPARE(*msPtr, 3);

        // Test pointer arithmetic
        ++msPtr;
        QCOMPARE(*msPtr, 4);

        msPtr--;
        QCOMPARE(*msPtr, 3);

        // Test dereference operator
        QCOMPARE(*msPtr, 3);

        // Test arrow operator
        QCOMPARE(msPtr.operator->(), &array[2]);
    }

    // Test case for out of range exceptions
    void testOutOfRange() {
        int array[] = {1, 2, 3, 4, 5};
        size_t size = sizeof(array) / sizeof(array[0]);

        MemorySpan<int> memorySpan(array, size);

        QVERIFY_EXCEPTION_THROWN(memorySpan.get(10), std::out_of_range);
        QVERIFY_EXCEPTION_THROWN(memorySpan.locate(10), std::out_of_range);
        QVERIFY_EXCEPTION_THROWN(memorySpan.copy(10), std::out_of_range);

        QVERIFY_EXCEPTION_THROWN(MsPtr<int>(memorySpan, 10), std::out_of_range);
        QVERIFY_EXCEPTION_THROWN(++MsPtr<int>(memorySpan, size - 1), std::out_of_range);
        QVERIFY_EXCEPTION_THROWN(--MsPtr<int>(memorySpan, 0), std::out_of_range);
    }

};

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
            arr[i] = generateRandomString(5, gen);
        }

        shellSort(arr, std::less<std::string>());
        QVERIFY(isSorted(arr, std::less<std::string>()));
    }

};

QTEST_APPLESS_MAIN(SmartPointerTests)
//QTEST_APPLESS_MAIN(SortsTests)
#include "tst_sortstests.moc"

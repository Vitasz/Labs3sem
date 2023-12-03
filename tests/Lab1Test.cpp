
// memoryspantest.cpp

#include <QtTest/QtTest>
#include "../src/Lab1/MemorySpan.h" // Include your MemorySpan class header file

class MemorySpanTest : public QObject {
    Q_OBJECT

private slots:
    void testCopyFunction();
    //void testGetFunction();
    //void testLocateFunction();
};

void MemorySpanTest::testCopyFunction() {
    int array[5] = {1, 2, 3, 4, 5};
    MemorySpan<int> memorySpan(array, 5);

    ShrdPtr<int> copyPtr = memorySpan.copy(2);

    //QVERIFY(copyPtr != nullptr);
    QCOMPARE(*copyPtr, 0); // Assuming default-initialized elements
}
/*
void MemorySpanTest::testGetFunction() {
    MemorySpan<int> memorySpan(5);

    std::unique_ptr<int> uniquePtr = memorySpan.Get(3);

    QVERIFY(uniquePtr != nullptr);
    QCOMPARE(*uniquePtr, 0); // Assuming default-initialized elements
}

void MemorySpanTest::testLocateFunction() {
    MemorySpan<int> memorySpan(5);

    std::shared_ptr<int> locatePtr = memorySpan.Locate(4);

    QVERIFY(locatePtr != nullptr);
    QCOMPARE(*locatePtr, 0); // Assuming default-initialized elements
}
*/
QTEST_APPLESS_MAIN(MemorySpanTest)
#include "memoryspantest.moc"

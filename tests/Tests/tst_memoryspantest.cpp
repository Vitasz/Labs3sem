#include <QtTest>

#include "../../src/Lab1/MemorySpan.h"

class MemorySpanTest : public QObject
{
    Q_OBJECT

public:
    MemorySpanTest();
    ~MemorySpanTest();

private slots:
    void test_case1();
    void test_case2();
};

MemorySpanTest::MemorySpanTest()
{

}

MemorySpanTest::~MemorySpanTest()
{

}

void MemorySpanTest::test_case1()
{
    QCOMPARE(2, 2);
}
void MemorySpanTest::test_case2()
{
    QCOMPARE(2, 3);
}

QTEST_APPLESS_MAIN(MemorySpanTest)

#include "tst_memoryspantest.moc"

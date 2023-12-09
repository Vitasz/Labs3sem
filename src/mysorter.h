#ifndef SORTVISUALIZER_H
#define SORTVISUALIZER_H

#include <QObject>
#include <QVector>
#include <QTimer>
#include <QtCore/QCoreApplication>

class SortVisualizer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int length READ getLength)
public:
    explicit SortVisualizer(QObject *parent = nullptr){
        resetArray();
    }

signals:
    void arrayChanged(const QVector<int> &array);

public slots:
    void startSorting(){
        // Bubble Sort Algorithm
        int n = m_array.size();
        for (int i = 0; i < n-1; i++) {
            for (int j = 0; j < n-i-1; j++) {
                if (m_array[j] > m_array[j+1]) {
                    std::swap(m_array[j], m_array[j+1]);
                    emit arrayChanged(m_array);
                    QCoreApplication::processEvents();
                    QTimer::singleShot(100, this, &SortVisualizer::startSorting);
                    return;
                }
            }
        }
    }
    void resetArray(){
        m_array.clear();
        for (int i = 1; i <= 10; ++i) {
            m_array.append(i);
        }
        std::random_shuffle(m_array.begin(), m_array.end());
        emit arrayChanged(m_array);
    }
    int getLength(){
        return m_array.length();
    }

private:
    QVector<int> m_array;
};

#endif // SORTVISUALIZER_H

#ifndef SORTINGALGORITHMS_H
#define SORTINGALGORITHMS_H

#include <QVector>
#include <vector>
#include <stack>

template <typename T, typename Comparator>
void bubbleSort(std::vector<T> &arr, Comparator cmp) {
    int n = arr.size();
    for (int i = 0; i < n - 1; ++i) {
        for (int j = 0; j < n - i - 1; ++j) {
            if (cmp(arr[j], arr[j + 1])) {
                std::swap(arr[j], arr[j + 1]);
            }
        }
    }
}

template <typename T, typename Comparator>
int partition(std::vector<T>& arr, int low, int high, Comparator cmp) {
    T pivot = arr[high];
    int i = low - 1;

    for (int j = low; j < high; ++j) {
        if (cmp(arr[j], pivot)) {
            ++i;
            std::swap(arr[i], arr[j]);
        }
    }

    std::swap(arr[i + 1], arr[high]);
    return i + 1;
}

template <typename T, typename Comparator>
void quickSort(std::vector<T>& arr, Comparator cmp) {
    int size = arr.size();
    std::stack<std::pair<int, int>> stack;

    stack.push({0, size - 1});

    while (!stack.empty()) {
        int low = stack.top().first;
        int high = stack.top().second;
        stack.pop();

        if (low < high) {
            int pivotIndex = partition(arr, low, high, cmp);

            // Push the subarrays onto the stack
            if (pivotIndex - 1 > low) {
                stack.push({low, pivotIndex - 1});
            }
            if (pivotIndex + 1 < high) {
                stack.push({pivotIndex + 1, high});
            }
        }
    }
}


template <typename T, typename Comparator>
void shellSort(std::vector<T> &arr, Comparator cmp) {
    int n = arr.size();
    for (int gap = n / 2; gap > 0; gap /= 2) {
        for (int i = gap; i < n; ++i) {
            T temp = arr[i];
            int j;

            for (j = i; j >= gap && cmp(arr[j - gap], temp); j -= gap) {
                arr[j] = arr[j - gap];
            }

            arr[j] = temp;
        }
    }
}

template <typename T>
void countSort(std::vector<T> &arr, int exp) {
    const int n = arr.size();
    std::vector<T> output(n);
    std::vector<int> count(10, 0);

    for (int i = 0; i < n; ++i) {
        count[(arr[i] / exp) % 10]++;
    }

    for (int i = 1; i < 10; ++i) {
        count[i] += count[i - 1];
    }

    for (int i = n - 1; i >= 0; --i) {
        output[count[(arr[i] / exp) % 10] - 1] = arr[i];
        count[(arr[i] / exp) % 10]--;
    }

    for (int i = 0; i < n; ++i) {
        arr[i] = output[i];
    }
}

template <typename T>
void radixSort(std::vector<T> &arr) {
    T maxElement = *std::max_element(arr.begin(), arr.end());

    for (int exp = 1; maxElement / exp > 0; exp *= 10) {
        countSort(arr, exp);
    }
}

#endif // SORTINGALGORITHMS_H

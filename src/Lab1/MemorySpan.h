#pragma once

#include "UnqPtr.h"
#include "ShrdPtr.h"

#include <stdexcept>
#include <cstring>


template <typename T> class MsPtr;
// MemorySpan
template <typename T>
class MemorySpan {
public:
    MemorySpan(T* data, size_t size) : data(data), size(size) {}
    T* getData() const {
        return data;
    }
    size_t getSize() const {
        return size;
    }
    UnqPtr<T> get(size_t index) const {
        if (index < size) {
            return UnqPtr<T>(new T(data[index]));
        } else {
            throw std::out_of_range("Index out of range");
        }
    }

    MsPtr<T> locate(size_t index) const {
        if (index < size) {
            return MsPtr<T>(*this, index);
        } else {
            throw std::out_of_range("Index out of range");
        }
    }

    ShrdPtr<T> copy(size_t index) const {
        if (index < size) {
            return ShrdPtr<T>(new T(data[index]));
        } else {
            throw std::out_of_range("Index out of range");
        }
    }

private:
    T* data;
    size_t size;
};

// MsPtr
template <typename T>
class MsPtr {
public:
    MsPtr(const MemorySpan<T>& span, size_t index = 0) : span(span), index(index) {}
    T* getData() const {
        return span.getData() + index;
    }

    size_t getSize() const {
        return span.getSize() - index;
    }

    // Pointer arithmetic
    MsPtr<T>& operator++() {
        if (index == span.getSize()-1){
            throw std::out_of_range("index out of range");
        }
        ++index;
        return *this;
    }

    MsPtr<T> operator++(int) {
        MsPtr<T> temp = *this;
        ++(*this);
        return temp;
    }

    MsPtr<T>& operator--() {
        if (index==0){
            throw std::out_of_range("index out of range");
        }
        --index;
        return *this;
    }

    MsPtr<T> operator--(int) {
        MsPtr<T> temp = *this;
        --(*this);
        return temp;
    }

    T& operator*() const {
        return span.get(index);
    }

    T* operator->() const {
        return span.getData() + index;
    }

private:
    const MemorySpan<T>& span;
    size_t index;
};

#pragma once

#include "SmrtPtr.h"

template <typename T>
class UnqPtr : public SmrtPtr<T> {
public:
    UnqPtr(T* p) : SmrtPtr<T>(p) {}

    // Disable copy constructor and assignment
    UnqPtr(const UnqPtr&) = delete;
    UnqPtr& operator=(const UnqPtr&) = delete;

    // Move constructor
    UnqPtr(UnqPtr&& other) noexcept : SmrtPtr<T>(other.ptr) {
        other.ptr = nullptr;
    }

    // Move assignment
    UnqPtr& operator=(UnqPtr&& other) noexcept {
        if (this != &other) {
            this->ptr = other.ptr;
            other.ptr = nullptr;
        }
        return *this;
    }

    // Dereference operator
    T& operator*() const {
        return *this->ptr;
    }

    // Member access operator
    T* operator->() const {
        return this->ptr;
    }
};

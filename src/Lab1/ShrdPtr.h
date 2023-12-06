#pragma once

#include "SmrtPtr.h"


// Shared Pointer
template <typename T>
class ShrdPtr : public SmrtPtr<T> {
private:
    unsigned int* referenceCount;

public:
    ShrdPtr(T* p) : SmrtPtr<T>(p), referenceCount(new unsigned int(1)) {}

    // Copy constructor
    ShrdPtr(const ShrdPtr& other) : SmrtPtr<T>(other.ptr), referenceCount(other.referenceCount) {
        (*referenceCount)++;
    }

    // Copy assignment
    ShrdPtr& operator=(const ShrdPtr& other) {
        if (this != &other) {
            decrementReferenceCount();
            this->ptr = other.ptr;
            referenceCount = other.referenceCount;
            (*referenceCount)++;
        }
        return *this;
    }

    // Move constructor
    ShrdPtr(ShrdPtr&& other) noexcept : SmrtPtr<T>(other.ptr), referenceCount(other.referenceCount) {
        other.ptr = nullptr;
        other.referenceCount = nullptr;
    }

    // Move assignment
    ShrdPtr& operator=(ShrdPtr&& other) noexcept {
        if (this != &other) {
            decrementReferenceCount();
            this->ptr = other.ptr;
            referenceCount = other.referenceCount;
            other.ptr = nullptr;
            other.referenceCount = nullptr;
        }
        return *this;
    }

    // Destructor
    ~ShrdPtr() {
        decrementReferenceCount();
    }

    // Dereference operator
    T& operator*() const {
        return *this->ptr;
    }

    // Member access operator
    T* operator->() const {
        return this->ptr;
    }

private:
    void decrementReferenceCount() {
        if (referenceCount) {
            (*referenceCount)--;
            if (*referenceCount == 0) {
                delete referenceCount;
                if (this->ptr){
                    delete this->ptr;
                    this->ptr = nullptr;
                }
            }
        }
    }
};


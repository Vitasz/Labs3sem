#pragma once

// Smart Pointer Base Class
template <typename T>
class SmrtPtr {
protected:
    T* ptr;

public:
    SmrtPtr(T* p) : ptr(p) {}

    ~SmrtPtr() {
        if (ptr) {
            delete ptr;
        }
    }
};


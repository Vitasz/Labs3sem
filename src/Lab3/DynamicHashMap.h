#pragma once

#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

template<typename K, typename V>
struct KeyValuePair {
    K key;
    V value;
};

template<typename K, typename V>
class DynamicHashMap {
private:
    static const size_t INITIAL_SIZE = 8;
    const double LOAD_FACTOR_THRESHOLD = 0.8;

    std::vector<std::vector<KeyValuePair<K, V>>> table;
    size_t elementsCount;

public:
    DynamicHashMap() : table(INITIAL_SIZE), elementsCount(0) {}

    void insert(const K& key, const V& value) {
        if (loadFactor() > LOAD_FACTOR_THRESHOLD) {
            resizeAndRehash();
        }

        size_t index = hash(key, table.size());
        auto& bucket = table[index];

        bucket.emplace_back(KeyValuePair<K, V>{key, value});
        ++elementsCount;
    }

    bool find(const K& key, std::vector<V>& values) const {
        values.clear();
        size_t index = hash(key, table.size());
        const auto& bucket = table[index];

        auto it = std::find_if(bucket.begin(), bucket.end(), [&key](const auto& kvp) {
            return kvp.key == key;
        });

        if (it != bucket.end()) {
            for (const auto& kvp : bucket) {
                if (kvp.key == key) {
                    values.push_back(kvp.value);
                }
            }
            return true;
        }

        return false;
    }

    void remove(const K& key) {
        size_t index = hash(key, table.size());
        auto& bucket = table[index];

        auto it = std::remove_if(bucket.begin(), bucket.end(), [&key](const auto& kvp) {
            return kvp.key == key;
        });

        if (it != bucket.end()) {
            bucket.erase(it, bucket.end());
            --elementsCount;
        }
    }

    std::vector<std::vector<KeyValuePair<K, V>>> getTable(){
        return table;
    }
    void clear(){
        table.clear();
        elementsCount = 0;
        table.resize(INITIAL_SIZE);
    }
private:
    double loadFactor() const {
        return static_cast<double>(elementsCount) / table.size();
    }

    void resizeAndRehash() {
        size_t newSize = table.size() * 2;
        std::vector<std::vector<KeyValuePair<K, V>>> newTable(newSize);

        for (const auto& bucket : table) {
            for (const auto& kvp : bucket) {
                size_t newIndex = hash(kvp.key, newSize);
                newTable[newIndex].emplace_back(kvp);
            }
        }

        table = std::move(newTable);
    }

    size_t hash(const K& key, size_t tableSize) const {
        std::hash<K> hasher;
        return hasher(key) % tableSize;
    }
};

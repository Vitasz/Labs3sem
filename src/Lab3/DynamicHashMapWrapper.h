// dynamicmapqmlwrapper.h

#pragma once

#include <QObject>
#include <QVariantList>
#include "dynamichashmap.h"  // Include the original DynamicHashMap header

class DynamicHashMapWrapper : public QObject
{
    Q_OBJECT

public:
    explicit DynamicHashMapWrapper(QObject *parent = nullptr)    : QObject(parent)
    {
    }

    Q_INVOKABLE void insert(const QString &key, const QString &value){
        dynamicHashMap.insert(key, value);
    }
    Q_INVOKABLE QVariantList find(const QString &key){
        QVariantList result;
        std::vector<QString> values;

        if (dynamicHashMap.find(key, values)) {
            for (const auto &value : values) {
                result.append(value);
            }
        }

        return result;
    }
    Q_INVOKABLE void remove(const QString &key){
        dynamicHashMap.remove(key);
    }

    Q_INVOKABLE QVariantList getTable(){
        QVariantList result;
        std::vector<std::vector<KeyValuePair<QString, QString>>> table;
        table = dynamicHashMap.getTable();
        for(auto u: table){
            if (u.empty()) continue;
            QVariantList local;
            for(auto v: u){
                QVariantList x;
                x.push_back(v.key);
                x.push_back(v.value);
                local.push_back(x);
            }
            result.push_back(local);
        }
        return result;
    }

    Q_INVOKABLE void clear(){
        dynamicHashMap.clear();
    }

private:
    DynamicHashMap<QString, QString> dynamicHashMap;
};

#include <QObject>
#include <QFuture>
#include <QtConcurrent>
#include <QTimer>
#include <QQmlApplicationEngine>
#include <vector>
#include <random>
#include <chrono>
#include <queue>
#include <set>
#include <algorithm>
#include <iostream>
#include <limits>

class TestClassPaths : public QObject {
    Q_OBJECT
public:
    explicit TestClassPaths(QObject *parent = nullptr) : QObject(parent) {}

public slots:

    QFuture<double> testBFS(int n) {
        return QtConcurrent::run([=]() {

            // Assuming you have a BFS algorithm implementation
            auto graph = generateGraph(n);
            auto start = std::chrono::high_resolution_clock::now();

            // Call your BFS algorithm function
            bfs(graph, 0, n-1);

            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
            emit this->testBFSResult(n, duration.count() / 1000.0);

            return duration.count() / 1000.0;
        });
    }

    QFuture<double> testDijkstra(int n) {
        return QtConcurrent::run([=]() {

            // Assuming you have a Dijkstra algorithm implementation
            auto graph = generateGraph(n);
            auto start = std::chrono::high_resolution_clock::now();

            // Call your Dijkstra algorithm function
            dijkstra(graph, 0, n-1);

            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
            emit this->testDijkstraResult(n, duration.count() / 1000.0);

            return duration.count() / 1000.0;
        });
    }

signals:
    void testBFSResult(int n, double result);
    void testDijkstraResult(int n, double result);

private:

    std::vector<std::vector<int>> generateGraph(int n) {
        std::vector<std::vector<int>> graph(n, std::vector<int>(n, 0));

        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> distribution(0, 10);

        for (int i = 0; i < n; ++i) {
            for (int j = i + 1; j < n; ++j) {
                graph[i][j] = graph[j][i] = distribution(gen);
            }
        }
        return graph;
    }

    void bfs(const std::vector<std::vector<int>>& graph, int start, int end) {
        int n = graph.size();
        std::vector<bool> visited(n, false);
        std::queue<int> q;

        q.push(start);
        visited[start] = true;

        while (!q.empty()) {
            int current = q.front();
            q.pop();
            if (current == end) return;

            for (int neighbor = 0; neighbor < n; ++neighbor) {
                if (graph[current][neighbor] == 1 && !visited[neighbor]) {
                    q.push(neighbor);
                    visited[neighbor] = true;
                }
            }
        }
    }

    void dijkstra(const std::vector<std::vector<int>>& graph, int start, int end) {
        int n = graph.size();
        std::vector<int> distance(n, std::numeric_limits<int>::max());
        distance[start] = 0;

        std::set<std::pair<int, int>> pq;  // Priority queue using set

        pq.insert({0, start});

        while (!pq.empty()) {
            int u = pq.begin()->second;
            pq.erase(pq.begin());

            for (int v = 0; v < n; ++v) {
                if (graph[u][v] != 0 && distance[u] + graph[u][v] < distance[v]) {
                    pq.erase({distance[v], v});
                    distance[v] = distance[u] + graph[u][v];
                    pq.insert({distance[v], v});
                }
            }
        }
    }
};

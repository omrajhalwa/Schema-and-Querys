
#include <iostream>
#include <thread>
#include <vector>
#include <mutex>
using namespace std;

const int N = 2; // Number of threads
std::mutex mtx;
int turn = 0; // Shared variable

void producer() {
    cout << "Producer thread started." << endl;
    int val = 1000000;
    while (val--) {
        // std::lock_guard<std::mutex> lock(mtx); // Automatically locks and unlocks
        mtx.lock();
        turn++;
        mtx.unlock();
    }
}

void consumer() {
    cout << "Consumer thread started." << endl;
    int val = 1000000;
    while (val--) {
        // std::lock_guard<std::mutex> lock(mtx); // Automatically locks and unlocks
        mtx.lock();
        turn--;
        mtx.unlock();
    }
}

int main() {
    // Create producer and consumer threads
    std::thread producerThread(producer);
    std::thread consumerThread(consumer);

    // Wait for both threads to finish
    producerThread.join();
    consumerThread.join();

    cout << "Final value of turn: " << turn << endl;
    return 0;
}


#include<bits/stdc++.h>

using namespace std;

class semaphore{
    public:

    int value;
    queue<int>blocked_process;

    semaphore(int n){
        this->value = n;
    }
};

void down(semaphore s){

    s.value = s.value - 1;
    if(s.value < 0){
        //put process pcb into queue 
        //sleep();
    }else{
        return;
    }
}

void up (semaphore s){
    s.value = s.value +1;

    if(s.value<=0){
        //take process from queue and wakeup it
        //wakeup();
    }
}

int main(){

}
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
    if(s.value == 1){
        s.value = 0;
    }else{
       //put process pcb into queue 
        //sleep();
    }
}

void up (semaphore s){
    s.value = s.value + 1;

    if(s.blocked_process.empty()){
        s.value = 1;
        
    }else{
        //take process from queue and wakeup it means put in ready queue
        //wakeup();
    }
}

int main(){

}
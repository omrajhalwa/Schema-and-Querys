

#include<bits/stdc++.h>
using namespace std;

vector<int> Z_Algorithm(string pattern, string text) {
//concanate the pattern and the text
string patternText = pattern + text;

// the length of the string
int n = patternText.size();

vector<int>zTable(n+2,0);
// left pointer
int left = 0;
// right pointer
int right = 0;

// consider the letters of the s one by one..

for(int k = 1; k < n;k++ ) {
  
  // we have to use the naive z calculation (case 1)
  if(k > right){
    int matchCounter = 0;

    while( k + matchCounter < n && patternText[matchCounter] == patternText[k+matchCounter]){
        matchCounter++;
    }

    zTable[k] = matchCounter;
    //update left and right indexes
    // we just update the z box indexes if the matchCounter is greater than 0
    if(matchCounter > 0){
    left = k;
    right = k + matchCounter-1;
    }
  }else {
    // k is within a Z box (pair index in prefix)
    int p = k - left;
    //case 2 we can copry the value (no need to recalculate it again)
    if(zTable[p] < right- k + 1) {
        zTable[k] = zTable[p];
    }else {
        // but to use naive approach
        //this is the first item we have to consider (outside the z box)

        int i = right + 1;

        while(i<n && patternText[i] == patternText[i-k]){
            i++;
        }
        zTable[k] = i-k;
        //we have found another z box
        left = k;
        right = i-1;
    }

  }
}

return zTable;
}

int main(){


}
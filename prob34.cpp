#include <iostream>
#include <sstream>
#include <string>
using namespace std;

const int MAX_VAL = 2540160;

int main()
{
    int factorials[10] = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};
    
    int p, len;
    string str;
    stringstream ss;
    for (int val = 10; val < MAX_VAL; ++val) {
        ss << val;
        ss >> str;
        ss.clear();
        
        p = 0;
        len = str.length();
        for (int i = 0; i < len; ++i) {
            p += factorials[str[i] - '0'];
        }
        
        if (p == val) {
            cout << "Found one: " << p << endl;
        }
    }

    return 0;
}

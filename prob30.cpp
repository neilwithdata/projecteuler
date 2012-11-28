#include <iostream>
#include <cmath>
#include <deque>
#include <vector>
using namespace std;

int main()
{
    // Perform some pre-calculations
    vector<int> pows;
    for (int i = 0; i <= 9; ++i) {
        pows.push_back(pow(i, 5));
    }
    
    vector<int> ten_pows;
    for (int i = 0; i <= 6; ++i) {
        ten_pows.push_back(pow(10, i));
    }

    deque<int> num;
    num.push_back(2);
    int num_digits = 1;
    
    bool advance;
    int num_val, pow_val;
    int inc_indx = 0;
    int sum = 0;
    while (num_val < 354294) {
        num_val = 0;
        pow_val = 0;
        
        // Calculate the true & power value
        for (int i = 0; i < num_digits; ++i) {
            pow_val += pows[num[i]];
            num_val += num[i] * ten_pows[num_digits - i - 1];
        }
        
        advance = false;
        
        if (num_val == pow_val) {
            sum += num_val;
        } else if (pow_val > num_val) {
            advance = true;
        }

        if (num[inc_indx] == 9 || advance) {
            // go to an earlier col not at value 9
            while (--inc_indx >= 0) {
                if (num[inc_indx] < 9) break;
            }
            
            if (inc_indx < 0) { // add a new column to the front
                num.push_front(1);
                num_digits++;
                for (int i = 1; i < num_digits; ++i) num[i] = 0;
            } else {
                ++num[inc_indx];
                for (int i = inc_indx + 1; i < num_digits; ++i) num[i] = 0;
            }
            
            inc_indx = num_digits - 1;
        } else {
            ++num[inc_indx];
        }
    }
    
    cout << sum << endl;

    return 0;
}

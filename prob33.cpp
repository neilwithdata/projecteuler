#include <iostream>
using namespace std;

inline int gcd(int a, int b)
{
    if (a == 0) return b;
    while (b != 0) {
        if (a > b) a -= b;
        else b -= a;
    }
    return a;
}

inline int reduce(int &num, int &den)
{
    int hcf = gcd(num, den);
    num /= hcf;
    den /= hcf;
}

bool CanCancelFraction(int numerator, int denominator)
{
    int num_a = numerator / 10;
    int num_b = numerator % 10;
    
    int den_a = denominator / 10;
    int den_b = denominator % 10;

    int n, d;
    if (num_a == den_a) {
        n = num_b;
        d = den_b;
    } else if (num_a == den_b) {
        n = num_b;
        d = den_a;
    } else if (num_b == den_a) {
        n = num_a;
        d = den_b;
    } else if (num_b == den_b) {
        n = num_a;
        d = den_a;
    } else {
        return false;
    }
    
    reduce(numerator, denominator);
    reduce(n, d);
    
    return ((numerator == n) && (denominator == d));
}

int main()
{
    for (int i = 10; i <= 99; ++i) {
        for (int j = i + 1; j <= 99; ++j) {
            if (CanCancelFraction(i, j)) {
                cout << i << "/" << j << endl;
            }
        }
    }
    
    return 0;
}

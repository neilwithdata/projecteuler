#include <iostream>
#include <bitset>
using namespace std;

const int MAX_COEFF = 1000;
const int MAX_BOUND = 100000;

// sieve of eratosthenes
bitset<MAX_BOUND> *CalculatePrimes()
{
    bitset<MAX_BOUND> *primes = new bitset<MAX_BOUND>;

    primes->set();
    (*primes)[0] = (*primes)[1] = 0;
    
    int composite;
    for (int p = 2; p < MAX_BOUND; ++p) {
        if ((*primes)[p]) {
            composite = p << 1;
            while (composite < MAX_BOUND) {
                (*primes)[composite] = 0;
                composite += p;
            }
        }
    }
    
    return primes;
}

int main()
{
    bitset<MAX_BOUND> *primes = CalculatePrimes();
    int max = 0;
    
    for (int a = -63; a <= 63; ++a) {
        for (int b = (a*a / 4) + 1; b < MAX_COEFF; ++b) {
            if ((*primes)[b]) {
                int n = 0;
                while (true) {
                    int p = n*n + a*n + b;
                    if ((*primes)[p] == false) break;
                    n++;
                }
                
                if (n > max) {
                    cout << "a: " << a << ", b: " << b << "(n = " << n << ")" << endl;
                    max = n;
                }
            }
        }
    }
    
    return 0;
}
    
#include <iostream>
#include <algorithm>
#include <bitset>
#include <cstdio>
#include <cstring>
using namespace std;

const int MAX_BOUND = 1000000;

// sieve of eratosthenes
bitset<MAX_BOUND> *CalculatePrimes()
{
    bitset<MAX_BOUND> *primes = new bitset<MAX_BOUND>;

    primes->set();
    (*primes)[0] = (*primes)[1] = 0;
    
    int c;
    for (int p = 2; p < MAX_BOUND; ++p) {
        if ((*primes)[p]) {
            c = p << 1;
            while (c < MAX_BOUND) {
                (*primes)[c] = 0;
                c += p;
            }
        }
    }
    
    return primes;
}

int main()
{
    bitset<MAX_BOUND> *primes = CalculatePrimes();
    char pstr[8], rot[8];
    bool circular;
    int numCircular = 4;
    int nrot;
    
    for (int i = 11; i < MAX_BOUND; ++i) {
        if ((*primes)[i]) {
            sprintf(pstr, "%d", i);
            strcpy(rot, pstr);
            
            (*primes)[i] = 0;
            circular = true;
            
            while (true) {
                rotate(rot, rot + 1, rot + strlen(rot));
                if (strcmp(pstr, rot) == 0)
                    break;
                
                nrot = atoi(rot);
                if (!(*primes)[nrot])
                    circular = false;
                
                (*primes)[nrot] = 0;
            }
            
            if (circular) {
                numCircular += strlen(pstr);
                cout << i << endl;
            }
        }
    }
    
    cout << numCircular - 1 << endl;

    return 0;
}

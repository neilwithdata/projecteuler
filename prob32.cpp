#include <cmath>
#include <set>
#include <numeric>
#include <iostream>
#include <algorithm>
using namespace std;

int nums[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

template <class InputIterator>
inline int calc_val(InputIterator first, InputIterator last)
{
    int res = 0;
    while (first != last) {
        res += *first * pow(10, distance(first, last) - 1);
        first++;
    }
    return res;
}

inline int IsProduct(int digA, int digB)
{
    int multiplicand = calc_val(nums, nums + digA);
    int multiplier = calc_val(nums + digA, nums + digA + digB);
    int prod_expected = calc_val(nums + digA + digB, nums + 9);
    
    return (prod_expected == multiplicand * multiplier) ? prod_expected : 0;
}

int main()
{
    set<int> products;
    int res;

    do {
        if (res = IsProduct(4, 1)) products.insert(res);
    } while (next_permutation(nums, nums + 9));
    
    sort(nums, nums + 9);
    
    do {
        if (res = IsProduct(3, 2)) products.insert(res);
    } while (next_permutation(nums, nums + 9));
    
    cout << accumulate(products.begin(), products.end(), 0) << endl;
    
    return 0;
}

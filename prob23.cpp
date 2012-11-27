#include <iostream>
#include <vector>
#include <algorithm>
#include <iterator>
#include <numeric>
#include <list>
#include <set>
#include <cmath>
using namespace std;

const int NUM_MAX = 28123;

// find proper divisors and sum -- simple brute force method
bool IsAbundant(int num)
{
	if (num < 2) return false;

	int num_sqrt = static_cast<int>(sqrt(static_cast<double>(num)));
	set<int> unique_factors;
	
	int j;
	for (int i = 2; i <= num_sqrt; ++i) {
		if (!(num % i)) {
			unique_factors.insert(i);
			unique_factors.insert(num / i);
		}
	}
	
	int sum = accumulate(unique_factors.begin(), unique_factors.end(), 1);
	
	return (sum > num);
}

bool SumOfAbundants(int num, vector<int> &abundants)
{
	int sum, size = abundants.size();
	for (int i = 0; i < size; ++i) {
		for (int j = 0; j < size; ++j) {
			sum = abundants[i] + abundants[j];
			if (sum == num) return true;
			if (sum > num) break;
		}
	}
	
	return false;
}

int main()
{
	// Capture all the abundants in the range
	vector<int> abundants;
	for (int i = 1; i <= NUM_MAX; ++i) {
		if (IsAbundant(i)) {
			abundants.push_back(i);
		}
	}
	
	int sum = 0;
	for (int i = 1; i <= NUM_MAX; ++i) {
		if (!SumOfAbundants(i, abundants)) sum += i;
	}
	
	cout << sum << endl;
	
	return 0;
}

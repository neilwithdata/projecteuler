using System;

class Problem24
{
    // Solution involves sequentially building up the digits of the answer by
    // considering the lower factorial multiples needed to reach the millionth permutation. This
    // is made possible by the lexicographic ordering.
    static void Main(string[] args)
    {
        bool[] digitPool = new bool[10];
        int[] digits = new int[10];
        int permutationsLeft = 999999;

        for (int digit = 0; digit < 9; digit++)
        {
            int lowerFactorial = factorial(9 - digit);
            int n = (permutationsLeft / lowerFactorial) + 1;

            // grab the n'th available digit from the digit pool
            digits[digit] = getNth(digitPool, n);

            Console.Write(digits[digit]);

            permutationsLeft = permutationsLeft % lowerFactorial;
        }

        digits[9] = getNth(digitPool, permutationsLeft + 1);
        Console.Write(digits[9]);
    }

    static int getNth(bool[] digitPool, int n)
    {
        int k = 0;
        for (int i = 0; i < digitPool.Length; i++)
        {
            if (!digitPool[i])
            {
                if (++k == n)
                {
                    digitPool[i] = true;
                    return i;
                }
            }
        }

        return -1;
    }

    static int factorial(int n)
    {
        int val = 1;
        for (int i = 2; i <= n; i++)
            val *= i;

        return val;
    }
}
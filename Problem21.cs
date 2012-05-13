using System;

class Problem21
{
    const int N = 10000;

    static void Main(string[] args)
    {
        int totalSum = 0;
        int[] sums = new int[N];

        for (int i = 4; i < N; i++)
        {
            if (sums[i] == 0)
                sums[i] = SumOfDivisors(i);

            if (sums[i] < N)
            {
                if (sums[sums[i]] == 0)
                    sums[sums[i]] = SumOfDivisors(sums[i]);

                if (sums[sums[i]] == i && i != sums[i])
                    totalSum += i;
            }
        }

        Console.WriteLine(totalSum);
    }

    static int SumOfDivisors(int n)
    {
        int sum = 1;
        int sqrt = (int) Math.Sqrt(n);

        for (int i = 2; i <= sqrt; i++)
        {
            if (n % i == 0)
            {
                sum += i;
                sum += (n / i);
            }
        }

        return sum;
    }
}

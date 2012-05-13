using System;

class Problem48
{
    static void Main(string[] args)
    {
        long sum = 0;

        // last K digits of N = N % 10^K
        long m = (long) Math.Pow(10, 10);

        for (int i = 1; i <= 1000; i++)
        {
            long last10Digits = ModPow(i, i, m);
            sum += last10Digits;
        }

        Console.WriteLine(sum);
    }

    /// <summary>
    /// Returns the modular exponent [b^e % m]
    /// </summary>
    static long ModPow(long b, long e, long m)
    {
        long c = 1;
        for (long k = 0; k < e; k++)
        {
            c = (b * c) % m;
        }

        return c;
    }
}
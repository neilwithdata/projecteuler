using System;

/// <summary>
/// Brute force approach (mostly)
/// </summary>
class Problem12
{
    static void Main(string[] args)
    {
        int inc = 2;
        int n = 1;

        while (true)
        {
            n += inc++;
            if (GetNumDivisors(n) > 500) break;
        }

        Console.WriteLine(n);
    }

    static int GetNumDivisors(int n)
    {
        int sqrt = (int) Math.Sqrt(n);
        int numDivisors = 0;

        for (int i = 1; i <= sqrt; i++)
        {
            if (n % i == 0)
                numDivisors += 2;
        }

        return numDivisors;
    }
}

using System;
using System.Numerics;

class Problem25
{
    static void Main(string[] args)
    {
        BigInteger[] previous = new BigInteger[] { 1, 1 };
        int termNo = 2;
        BigInteger next;

        while (true)
        {
            next = previous[0] + previous[1];
            termNo++;

            if (next.ToString().Length >= 1000)
                break;
            else
            {
                previous[0] = previous[1];
                previous[1] = next;
            }
        }

        Console.WriteLine(termNo);
    }
}
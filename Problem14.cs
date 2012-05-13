using System;
using System.Numerics;
using System.Diagnostics;

class Problem14
{
    const int MAXNUM = 1000000;

    static void Main(string[] args)
    {
        int largestChainLength = 0;
        int largestChainLengthVal = 0;

        for (int i = 3; i < MAXNUM; i++)
        {
            long val = i;
            int sequenceLength = 1;

            while (val > 1)
            {
                // Calculate the next sequence value
                if (val % 2 == 0)
                    val = val / 2;
                else
                    val = (3 * val) + 1;

                sequenceLength++;
            }

            if (sequenceLength > largestChainLength)
            {
                largestChainLength = sequenceLength;
                largestChainLengthVal = i;
            }
        }

        Console.WriteLine(largestChainLengthVal);
    }
}
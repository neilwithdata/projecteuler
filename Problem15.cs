using System;
using System.Numerics;

class Problem15
{
    const int N = 20;

    static void Main(string[] args)
    {
        BigInteger[,] edges = new BigInteger[N + 1, N + 1];

        // initialize the grid so that every outer edge has a value of 1
        for (int i = 1; i <= N; i++)
        {
            edges[0, i] = 1;
            edges[i, 0] = 1;
        }

        // left-right, top-bottom, calculate unique paths at each edge in grid
        for (int i = 1; i <= N; i++)
        {
            for (int j = 1; j <= N; j++)
            {
                edges[j,i] = edges[j,i - 1] + edges[j - 1,i];
            }
        }

        Console.WriteLine(edges[N, N]);
    }
}
using System;
using System.IO;

class Problem67
{
    static void Main(string[] args)
    {
        // read in the triangle data from file and parse in to jagged array structure
        string[] lines = System.IO.File.ReadAllLines("problem67_data.txt");

        int[][] triangle = new int[lines.Length][];
        for (int i = 0; i < lines.Length; i++)
        {
            string[] values = lines[i].Split(' ');
            triangle[i] = new int[values.Length];

            for (int j = 0; j < values.Length; j++)
            {
                triangle[i][j] = int.Parse(values[j]);
            }
        }

        // Starting from the bottom of the tree move up adding sequentially
        for (int i = triangle.Length - 1; i > 0; i--)
        {
            for (int j = 0; j < triangle[i].Length - 1; j++)
            {
                triangle[i - 1][j] += Math.Max(triangle[i][j], triangle[i][j + 1]);
            }
        }

        Console.WriteLine(triangle[0][0]);
        Console.ReadLine();
    }
}
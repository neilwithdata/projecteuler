using System;

class Problem28
{
    static void Main(string[] args)
    {
        long forslashSum = 1;
        long backslashSum = 0;
        long curr = 1;
        bool backslash = true;

        for (long dim = 3; dim <= 1001; dim += 2)
        {
            for (long i = 0; i < 4; i++)
            {
                curr += (dim - 1);

                if (backslash)
                    backslashSum += curr;
                else
                    forslashSum += curr;

                backslash = !backslash;
            }
        }

        Console.WriteLine(forslashSum + backslashSum);
        Console.ReadLine();
    }
}
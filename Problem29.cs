using System;

class Problem29
{
    static void Main(string[] args)
    {
        // Maximum sequence length
        int sequenceLength = 99 * 99;

        // for each a^b, look for higher base representations
        // We can dramatically simply this search knowing that if there are other y^z representations of a^b,
        // they must satisfy
        //      b = log_a(y^z)
        //      b = z.log_a(y), where y and z are integers

        for (int a = 2; a <= 10; a++)
        {
            for (int b = 2; b <= 100; b++)
            {
                // Begin the search for any higher base representations of a^b
                // for each power of the base <= 100
                int pow = 2;
                int y = (int) Math.Pow(a, pow);
                while (y <= 100)
                {
                    if (b % pow == 0)
                    {
                        int z = b / pow;
                        if (z >= 2 && z <= 100)
                        {
                            Console.WriteLine("{0}^{1} == {2}^{3}", a, b, y, z);
                            // evenly divides...we have our y and z
                            sequenceLength--;
                        }
                    }

                    y = (int) Math.Pow(a, ++pow);
                }

            }
        }

        Console.WriteLine("Sequence Length: {0}", sequenceLength);
        Console.ReadLine();
    }
}

using System;

class Problem17
{
    static int GetOnes(int ones)
    {
        switch (ones)
        {
            case 0: return 0; // ""
            case 1: return 3; // "one"
            case 2: return 3; // "two"
            case 3: return 5; // "three"
            case 4: return 4; // "four"
            case 5: return 4; // "five"
            case 6: return 3; // "six"
            case 7: return 5; // "seven"
            case 8: return 5; // "eight"
            case 9: return 4; // "nine"

            default: return 0; // ""
        }
    }

    static int GetTens(int tens)
    {
        switch (tens)
        {
            case 0: return 0; // ""
            case 1: return 0; // ""
            case 2: return 6; // "twenty"
            case 3: return 6; // "thirty"
            case 4: return 5; // "forty"
            case 5: return 5; // "fifty"
            case 6: return 5; // "sixty"
            case 7: return 7; // "seventy"
            case 8: return 6; // "eighty"
            case 9: return 6; // "ninety"

            default: return 0; // ""
        }
    }

    static int GetTeens(int tens)
    {
        switch (tens)
        {
            case 0: return 3; // "ten"
            case 1: return 6; // "eleven"
            case 2: return 6; // "twelve"
            case 3: return 8; // "thirteen"
            case 4: return 8; // "fourteen"
            case 5: return 7; // "fifteen"
            case 6: return 7; // "sixteen"
            case 7: return 9; // "seventeen"
            case 8: return 8; // "eighteen"
            case 9: return 8; // "nineteen"

            default: return 0; // ""
        }
    }

    static void Main(string[] args)
    {
        string[] numbers = new string[1000];

        int count = 0;
        for (int i = 1; i <= 1000; i++)
        {
            char[] strArr = i.ToString().ToCharArray();

            if (i >= 1000) // 1000 ->
            {
                count += 11; // "one thousand"
            }
            else if (i >= 100) // 100 - 999
            {
                int val = i;
                int hundreds = (int)val / 100; val = val % 100;
                int tens = val / 10;
                int ones = val % 10;

                count += GetOnes(hundreds); // "x"
                count += 7; // "hundred";

                if (!(tens == 0 && ones == 0))
                {
                    count += 3; // "and"
                    if (val >= 10 && val <= 19)
                        count += GetTeens(ones);
                    else
                    {
                        count += GetTens(tens);
                        count += GetOnes(ones);
                    }
                }
            }
            else if (i >= 10) // 10 - 99
            {
                int tens = (int) i / 10;
                int ones = i % 10;

                if (i >= 10 && i <= 19)
                    count += GetTeens(ones);
                else
                {
                    count += GetTens(tens);
                    count += GetOnes(ones);
                }
            }
            else // 1 - 9
            {
                count += GetOnes(i);
            }
        }

        Console.WriteLine(count);
    }
}
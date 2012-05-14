using System;

class Problem22
{
    static void Main(string[] args)
    {
        string fileText = System.IO.File.ReadAllText("problem22_data.txt");
        string[] names = fileText.Split(new char[] { '"', ',' },
            StringSplitOptions.RemoveEmptyEntries);

        Array.Sort(names);

        int totalScore = 0;
        for (int i = 0; i < names.Length; i++)
        {
            int nameValue = 0;
            char[] nameArray = names[i].ToCharArray();
            
            for (int j = 0; j < nameArray.Length; j++)
                nameValue += (int)nameArray[j] - 64;

            nameValue *= (i + 1);
            totalScore += nameValue;
        }

        Console.WriteLine(totalScore);
    }
}
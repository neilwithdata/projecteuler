import java.io.*;
import java.util.*;

public class Problem13 {
	private static final int NUMS = 100;
	private static final int NUM_LEN = 50;
	private static final int LEADING = 2;

	public static void main(String[] args) {
		new Problem13().start();
	}
	
	public void start() {
		String[] numbers = readNums();
		int[] result = new int[NUM_LEN + LEADING];
		
		int sum = 0;
		int carry100, carry10, base;

		for (int j = NUM_LEN - 1; j >= 0; j--) {
			sum = 0;
			for (int i = 0; i < NUMS; i++) {
				sum += Character.getNumericValue(numbers[i].charAt(j));
			}
			
			sum += result[j + LEADING];
			
			carry100 = sum / 100;
			sum %= 100;
			carry10 = sum / 10;
			sum %= 10;
			base = sum;
			
			result[j + LEADING] = base;
			result[j + 1] += carry10;
			result[j] += carry100;
		}
		
		for (int i = 0; i < NUM_LEN+LEADING; i++) {
			System.out.print(result[i]);
		}
	}
	
	private String[] readNums() {
		Scanner scanner = null;
		String[] numbers = new String[NUMS];
	
		try {
			scanner = new Scanner(new File("prob13_data.txt"));
			
			int i = 0;
			while (scanner.hasNext()) {
				numbers[i++] = scanner.next();
			}
		} catch (FileNotFoundException fnfe) {
			System.err.println("Could not open data file");
			return null;
		} finally {
			if (scanner != null) {
				scanner.close();
			}
		}
		
		return numbers;
	}
}
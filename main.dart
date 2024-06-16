import 'dart:io';

class Solution {
  int romanToInt(String romanChars) {
    final Map<String, int> mapRoman = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };

    int total = 0;
    int previousValue = 0;

    //  solve roman from right to left
    for (int i = romanChars.length - 1; i >= 0; i--) {
      //  get current character
      String currentChar = romanChars[i];

      //  get integer value
      int currentValue = mapRoman[currentChar] ?? 0;

      if (currentValue < previousValue) {
        total -= currentValue;
      } else {
        total += currentValue;
      }
      previousValue = currentValue;
    }
    return total;
  }
}

void main() {
  Solution solution = Solution();
  print('Enter roman character: ');

  // Get user input
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    // Convert to uppercase
    int result = solution.romanToInt(input.toUpperCase());
    print('Integer value is: $result');
  } else {
    print('No input provided.');
  }
}

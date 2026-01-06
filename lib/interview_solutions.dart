void main() {
  // 1. Check if number is Even
  print('--- 1. Check if number is Even ---');
  int number = 10;
  if (isEven(number)) {
    print('$number is Even');
  } else {
    print('$number is Odd');
  }

  // 2. Recursive Fibonacci nth term
  print('\n--- 2. Recursive Fibonacci nth term ---');
  int n = 7;
  int fibResult = fibonacci(n);
  print('The $n-th term of Fibonacci series is: $fibResult');

  // 3. Star Pattern
  print('\n--- 3. Star Pattern ---');
  printStarPattern(3);

  // 4. Sort array without library functions
  print('\n--- 4. Sort Array (Bubble Sort) ---');
  List<int> array = [64, 34, 25, 12, 22, 11, 90];
  print('Original array: $array');
  List<int> sortedArray = sortArray(array);
  print('Sorted array: $sortedArray');

  // 5. Candy Logic Problem
  print('\n--- 5. Candy Logic Problem ---');
  int initialCandies = 10;
  int totalEaten = calculateMaxCandies(initialCandies);
  print('With $initialCandies candies, you can eat a total of: $totalEaten');
}

// 1. Function to check if number is even
bool isEven(int num) {
  return num % 2 == 0;
}

// 2. Recursive function for nth Fibonacci term
int fibonacci(int n) {
  if (n <= 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// 3. Function to display star pattern
// Pattern:
// *
// ***
// *****
void printStarPattern(int rows) {
  for (int i = 1; i <= rows; i++) {
    // Calculate number of stars for current row: 1, 3, 5...
    int numberOfStars = (2 * i) - 1;
    String line = '';
    for (int j = 0; j < numberOfStars; j++) {
      line += '*';
    }
    print(line);
  }
}

// 4. Function to sort array (Bubble Sort)
List<int> sortArray(List<int> arr) {
  int n = arr.length;
  // Outer loop for number of passes
  for (int i = 0; i < n - 1; i++) {
    // Inner loop for comparison
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        // Swap elements
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

// 5. Function to calculate max candies
int calculateMaxCandies(int initial) {
  int eaten = initial;
  int wrappers = initial;

  while (wrappers >= 3) {
    int newCandies = wrappers ~/ 3; // Integer division
    int remainingWrappers = wrappers % 3;
    
    eaten += newCandies;
    wrappers = newCandies + remainingWrappers;
  }
  
  return eaten;
}

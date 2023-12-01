List<int> findTwoNumbersWithSum(List<int> numbers, int target) {
  
  Map<int, int> indices = {};

  for (int i = 0; i < numbers.length; i++) {
    int number = numbers[i];
    int complement = target - number;

    if (indices.containsKey(complement)) {
      return [indices[complement]!, i];
    }
    indices[number] = i;
  }

  // If there is no solution, return an empty list instead
  return [];
}

void main() {

  List<int> numbers = [2, 7, 11, 15 , 20];
  int target = 18;
  List<int> result = findTwoNumbersWithSum(numbers, target);
  print(result);
}

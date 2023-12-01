int getSmallestInteger(List<int> myList) {
  int smallest = myList[0];
  for (int i = 1; i < myList.length; i++) {
    if (myList[i] < smallest) {
      smallest = myList[i];
    }
  }
  return smallest;
}

void main() {
  
  List<int> numbers = [5, 2, 8, 1, 7];
  int smallestNumber = getSmallestInteger(numbers);
  print('The smallest number: $smallestNumber');
}

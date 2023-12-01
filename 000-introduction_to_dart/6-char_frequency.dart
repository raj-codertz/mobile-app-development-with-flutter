Map<String, int> characterFrequency(String userInput) {

  Map<String, int> frequency = {};

  for (int i = 0; i < userInput.length; i++) {
    String character = userInput[i];

    if (RegExp(r'[a-zA-Z]').hasMatch(character)) {
      frequency[character] = (frequency[character] ?? 0) + 1;
    }
  }
  return frequency;
}

void main() {
  // Example usage:
  String userInput = "Hello Group 3!";
  Map<String, int> frequencyResult = characterFrequency(userInput);

  print('Character frequency: $frequencyResult');
}

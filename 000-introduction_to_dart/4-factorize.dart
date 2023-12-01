List<int> factorizeToPrimeNumbers(int number) {

  List<int> factors = [];

  for (int i = 2; i <= number; i++) {
    while (number % i == 0) {
      factors.add(i);
      number = number ~/ i;
    }
  }
  return factors;
}

void main() {

  int inputNumber = 40;
  List<int> primeFactors = factorizeToPrimeNumbers(inputNumber);

  print('Prime factors of $inputNumber are : $primeFactors');
}

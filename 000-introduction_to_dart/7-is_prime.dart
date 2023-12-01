bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }

  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}
void main() {
  int number = 18;
  bool result = isPrime(number);

  if (result) {
    print('$number a prime number');
  } else {
    print('$number not a prime number');
  }
}

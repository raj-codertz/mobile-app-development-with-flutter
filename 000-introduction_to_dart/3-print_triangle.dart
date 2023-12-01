void printRightAngleTriangle(int height) {
  for (int i = 1; i <= height; i++) {
    for (int j = 1; j <= i; j++) {
      
      // Print asterisk for each column in the current row
      print('*');
    }
    print('');
  }
}

void main() {
  
  int triangleHeight = 5;
  printRightAngleTriangle(triangleHeight);
}

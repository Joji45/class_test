// Write a program to print the following pattern
// *
// * *
// * * *
// * * * *
// * * * * *
// * * * *
// * * *
// * *
// *

import 'dart:io';

void main() {
  int n = 5;
  for (int i = 0; i <= n; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write(" *");
    }
    print("");
  }
  for (int i = n - 1; i >= 1; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write(" *");
    }
    print("");
  }
}

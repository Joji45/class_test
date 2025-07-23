// Write a Dart program that accepts integers into a list until 0 is entered.
//  Generate separate lists for odd and even numbers from that list and Print the
//  greatest number in
//  the main list. Enter a number (0 to stop): 10

// Enter a number (0 to stop): 5

// Enter a number (0 to stop): 8

// Enter a number (0 to stop): 3

// Enter a number (0 to stop): 12

// Enter a number (0 to stop): 0

// Main list: [10, 5, 8, 3, 12]

// Even numbers: [10, 8, 12]

// Odd numbers: [5, 3]

// Greatest number: 12

import 'dart:io';

void main() {
  List<int> mylist = [];

  for (;;) {
    stdout.write('Enter a number (0 to stop): ');
    int input = int.parse(stdin.readLineSync()!);
    if (input == 0) {
      break;
    }
    mylist.add(input);
  }

  List<int> even = [];
  List<int> odd = [];

  for (var number in mylist) {
    if (number % 2 == 0) {
      even.add(number);
    } else {
      odd.add(number);
    }
  }

  int greatest = mylist.isNotEmpty ? mylist[0] : 0;

  for (int i = 1; i < mylist.length; i++) {
    if (mylist[i] > greatest) {
      greatest = mylist[i];
    }
  }

  print('Main list: $mylist');
  print('Even numbers: $even');
  print('Odd numbers: $odd');
  print('Greatest number: $greatest');
}

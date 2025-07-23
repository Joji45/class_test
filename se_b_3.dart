// Create a console-based Banking Management System in Dart with the following functionalities:
//  Create a new account, Deposit money into the account, Withdraw money from the account, View current
//  account details
//  Welcome to the Banking Management System!
//  Choose an option:
//  1. Create Account
//  2. Deposit Money
//  3. Withdraw Money
//  4. View Account Details
//  Enter your choice (1–4): 1
//  Enter account holder name: Alice
//  Enter initial deposit amount: 1000
//  Account created successfully!
//  Do you want to continue? (yes/no): yes
//  Choose an option:
//  1. Create Account
//  2. Deposit Money
//  3. Withdraw Money
//  4. View Account Details
//  Enter your choice (1–4): 2
//  Enter deposit amount: 500
//  Deposit successful. New balance: 1500
//  Do you want to continue? (yes/no): yes
//  Choose an option:
//  1. Create Account
//  2. Deposit Money
//  3. Withdraw Money
//  4. View Account Details
//  Enter your choice (1–4): 3
//  Enter withdrawal amount: 300
//  Withdrawal successful. New balance: 1200
//  Do you want to continue? (yes/no): yes
//  Choose an option:
//  1. Create Account
//  2. Deposit Money
//  3. Withdraw Money
//  4. View Account Details
//  Enter your choice (1–4): 4--- Account Details--
// Name: Alice
//  Balance: 1200
//  Do you want to continue? (yes/no): no
//  Thank you for using the Banking Management System. Goodbye!

import 'dart:io';

class Account {
  String accountHolder;
  num balance;

  Account({required this.accountHolder, required this.balance});

  void deposit(num amount) {
    balance += amount;
    print('Deposit successful. New balance: $balance');
  }

  void withdraw(num amount) {
    if (amount > balance) {
      print('Insufficient balance.');
    } else {
      balance -= amount;
      print('Withdrawal successful. New balance: $balance');
    }
  }

  void displayDetails() {
    print('--- Account Details ---');
    print('Name: $accountHolder');
    print('Balance: $balance');
  }
}

void main() {
  Account? account;

  print('Welcome to the Banking Management System!');

  while (true) {
    print('\nChoose an option:');
    print('1. Create Account');
    print('2. Deposit Money');
    print('3. Withdraw Money');
    print('4. View Account Details');
    stdout.write('Enter your choice (1–4): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter account holder name: ');
        String? name = stdin.readLineSync();
        stdout.write('Enter initial deposit amount: ');
        num? initialAmount = num.tryParse(stdin.readLineSync()!);
        if (name != null && initialAmount != null && initialAmount >= 0) {
          account = Account(accountHolder: name, balance: initialAmount);
          print('Account created successfully!');
        } else {
          print('Invalid input. Try again.');
        }
        break;

      case '2':
        if (account == null) {
          print('No account exists.');
          break;
        }
        stdout.write('Enter deposit amount: ');
        num? depositAmount = num.tryParse(stdin.readLineSync()!);
        if (depositAmount != null && depositAmount > 0) {
          account.deposit(depositAmount);
        } else {
          print('Invalid amount.');
        }
        break;

      case '3':
        if (account == null) {
          print('No account exists. Please create an account first.');
          break;
        }
        stdout.write('Enter withdrawal amount: ');
        num? withdrawAmount = num.tryParse(stdin.readLineSync()!);
        if (withdrawAmount != null && withdrawAmount > 0) {
          account.withdraw(withdrawAmount);
        } else {
          print('Invalid amount.');
        }
        break;

      case '4':
        if (account != null) {
          account.displayDetails();
        } else {
          print('No account exists.');
        }
        break;

      default:
        print('Invalid choice.');
    }

    stdout.write('Do you want to continue? (yes/no): ');
    String? continueChoice = stdin.readLineSync()?.toLowerCase();
    if (continueChoice != 'yes') {
      print('Thank you for using the Banking Management System. Goodbye!');
      break;
    }
  }
}

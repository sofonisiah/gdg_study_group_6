import 'dart:io';
import 'dart:async';
Future<void> printWithDelay(String message) async {
  await Future.delayed(const Duration(seconds: 5));
  print(message);
}
void main() async {
  var firstNumber, secondNumber;
  String operation;
  while (true) {
    try {
      print("enter the first number: ");
      firstNumber = double.parse(stdin.readLineSync()!);
      break;
    } on FormatException {
      print("enter a valid number again");
    }
  }
  while (true) {
    try {
      print("enter the second number: ");
      secondNumber = double.parse(stdin.readLineSync()!);
      break;
    } on FormatException {
      print("enter a valid number again");
    }
  }
  while (true) {
    print("valid operations: + - * / : ");
    operation = stdin.readLineSync()!;
    if (operation == "+" ||
        operation == "-" ||
        operation == "*" ||
        operation == "/") {
      break;
    } else {
      print("wrong operation inserted");
    }
  }
  switch (operation) {
    case "+":
      {
        var sum = firstNumber + secondNumber;
        print("starting...");
        await printWithDelay("$firstNumber + $secondNumber = $sum");
      }
      break;
    case "-":
      {
        var subtraction = firstNumber - secondNumber;
        print("starting...");
        await printWithDelay("$firstNumber - $secondNumber = $subtraction");
        break;
      }
    case "*":
      {
        var product = firstNumber * secondNumber;
        print("starting...");
        await printWithDelay("$firstNumber * $secondNumber = $product");
        break;
      }
    case "/":
      {
        if (secondNumber != 0) {
          var division = firstNumber / secondNumber;
          print("starting...");
          await printWithDelay("$firstNumber / $secondNumber =  $division");
        } else {
          print("cant divide, second number is zero");
        }
        break;
      }
    default:
      print("Error");
      return;
  }
}

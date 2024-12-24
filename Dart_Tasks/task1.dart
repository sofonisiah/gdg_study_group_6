import 'dart.io';
class calculator{
  int? num1,num2;
  int addition(this.num1,this.num2){
    return(num1 + num2);
  }
  int subtraction(this.num1,this.num2){
    return(num1 - num2);
  }
  int multplication(this.num1,this.num2){
    return(num1 * num2);
  }
  int division(this.num1,this.num2){
    return(num1 / num2);
  }
  int reminder(this.num1,this.num2){
    return(num1 % num2);
  }
}
void main(){
  print('enter the first number: ');
  int? num1 = int.parse(stdin.readLineSync(!));
  print('enter the operator: ');
  Char? operator = stdin.readLineSync(!);
  print('enter the second number: ');
  int? num2 = int.parse(stdin.readLineSync(!));
  int? solution = new calculator;
  try{
    if(operator == '+'){
      print(solution.addition(num1,num2));
    }
    else if(operator == '-'){
      print(solution.subtraction(num1,num2));
    }
    else if(operator == '*'){
      print(solution.multiplication(num1,num2));
    }
    else if(operator == '/'){
      print(solution.division(num1,num2));
    }
    else if(operator == '%'){
      print(solution.reminder(num1,num2));
    }
    else{
      print('invalid operator');
    }
    }catch(e){
      print('$e is invalid input');
  }
}

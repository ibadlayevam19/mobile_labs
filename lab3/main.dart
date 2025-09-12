import 'dart:math';
void showGreeting(){
  print("Welcome to our program!");
}
/*
Malika Ibadlayeva, 12 September, this is my first time writing in dart language and multiline comment.
 */
void sayHello() {
  print('Hello from a function!');
  }

void main(){
  print("Malika Ibadlayeva");
  print("Welcome to Dart Programming.");
  print("Let's start coding.");
  print("""1 Amir Temur Avenue
  Tshkent, Uzbekistan
  100000""");
  int year=DateTime.now().year;
  print("The current year is $year");
  print("Welcome, students of New Uzbekistan University!");
  String favoriteCity="Xiva";
  print("My favorite city is $favoriteCity");
  double bookPrice=15.99;
  print("THe price of the book is $bookPrice USD");
  bool isLearningDart=true;
  print("Am I learning Dart? The answer is $isLearningDart");
  String weather='Sunny';
  int temperature=32;
  print("Today's weather is $weather and the temperature is $temperature degrees Celcius.");
  var numberOfApples=10;
  print(numberOfApples);
  numberOfApples=12;
  print(numberOfApples);
  int number=15;
  if(number>10){
    print("Number is greater than 10.");
  }
  else{
    print("Number is not greater than 10.");
  }
  int studentScore=75;
  if(studentScore>60){
    print("Pass");
  }
  else{
    print("Fail");
  }
  int hour=14;
  if(hour<12){
    print("Good morning");
  }
  else if(12<=hour && hour<=18){
    print("Good afternoon");
  }
  else{
    print("Good evening");
  }
  for(int i=1; i<=10; i++){
    print(i);
  }
  for(int i=5; i>=1; i--){}
  print("Liftoff!");
  for(int i=1; i<=20; i++){
    if(i%3==0){
      print(i);
    }
  }
  showGreeting();
  greetByName('Malika');
  print(multiply(7,6));
  print(isPositive(7));
  print(isPositive(-4));
  print(calculateAverage(10.5, 20.5));
  print(multiplyArrow(5,4));

  //planet stores the reference to 'Earth', but it feels like it is storing the value itself, because it is immutable
  String planet = 'Earth';
  print('We live on planet $planet.');

  //print('This message should not appear.');
  print('This message should appear.');
   /* This variable stores a very important universal constant.
   this variable below stores the reference to given speed in which light travels, but it feels like immutable.*/
 int speedOfLight = 299792458; // in meters per second
 print(speedOfLight);
}
/// this function calculates the area of circle with the given radius
double calculateCircleArea(double radius) {
  return pi * radius * radius;
 }
void greetByName(String name){
  print("Hello, $name!");
}
int multiply(int a, int b){
  return a*b;
}
bool isPositive(int number){
  if(number>0){
    return true;
  }
  else{
    return false;
  }
}
double calculateAverage(double num1, double num2){
  return (num1+num2)/2;
}
int multiplyArrow(int a, int b) => a*b;

 

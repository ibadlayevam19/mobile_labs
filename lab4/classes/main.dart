class Car{
  String make;
  String model;
  int year;
  Car(this.make, this.model, this.year);
  void displayInfo(){
    print("Car information: $year $make $model");
  }
}
class Book{
  String title;
  String author;
  int numberOfPages;
  Book(this.title, this.author, this.numberOfPages);
  
}
class Student{
  String name;
  int age;
  List<double>grades=[];
  Student(this.name, this.age, this.grades);
  double calculateAverageGrade(){
    double sum=this.grades.reduce((a,b)=>a+b);
    return sum/this.grades.length;
  }
}
class BankAccount{
  String accountNumber;
  String accountHolderName;
  double balance;
  BankAccount(this.accountNumber, this.accountHolderName, this.balance);
  void deposit(double amount){
    this.balance+=amount;
  }
  void withdraw(double amount){
    if(this.balance-amount<0){
      print("Not enough money to withdraw!");
    }
    else{
      this.balance-=amount;
      print('Withdrawn successfully.');
    }
  }
}
class Rectangle{
  double width;
  double height;
  Rectangle(this.width, this.height);
  double get area => this.width*this.height;
  double get perimeter => (this.width+this.height)*2;
}
void main(){
  //Task1
  var myCar=Car('Toyota', 'Corolla', 2022);
  myCar.displayInfo();

  //Task2
  var book=Book('Hell yeah or no', 'Derek Sivers', 132);
  print("Book properties: ");
  print(book.title);
  print(book.author);
  print(book.numberOfPages);

  //Task3
  var student=Student('Malika', 19, [90, 85, 80]);
  print(student.calculateAverageGrade());

  //Task4
  var bankAccount=BankAccount('AD0901734', 'Malika', 756);
  bankAccount.deposit(542);
  bankAccount.withdraw(1000);
  bankAccount.withdraw(500);

  //Task5
  var rectangle=Rectangle(10,30.5);
  print(rectangle.area);
  print(rectangle.perimeter);

}
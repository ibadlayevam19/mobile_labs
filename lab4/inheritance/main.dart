//Task1
class Vehicle{
  String make;
  String model;
  Vehicle(this.make, this.model);
  void display(){
    print("Vehicle: $make $model");
  }
}
class Car extends Vehicle{
  int numberOfDoors;
  Car(String make, String model, this.numberOfDoors): super(make, model);
  @override
  void display(){
    super.display();
    print('Doors: $numberOfDoors');
  }
}

//Task2
class Animal{
  void makeSound(){
    print('Some animal sound');
  }
}
class Dog extends Animal{
  @override
  void makeSound(){
    print('Woof!');
  }
}
class Cat extends Animal{
  @override
  void makeSound(){
    print('Meow!');
  }
}

//Task3
class Shape{
  String color;
  Shape(this.color);
}
class Circle extends Shape{
  double radius;
  Circle(this.radius, String color): super(color);
}
class Square extends Shape{
  double sideLength;
  Square(this.sideLength, String color): super(color);
}

//Task4
class Employee{
  String name;
  double baseSalary;
  Employee(this.name, this.baseSalary);
  double calculateSalary(){
    return baseSalary;
  }
}
class Manager extends Employee{
  double bonus;
  Manager(String name, double baseSalary, this.bonus):super(name, baseSalary);
  @override
  double calculateSalary(){
    return baseSalary+bonus;
  }
}

//Task5
class LibraryItem{
  String title;
  String id;
  LibraryItem(this.title, this.id);
  String getDetails(){
    return "Title: $title, ID: $id";
  }
}
class Book extends LibraryItem{
  String author;
  Book(String id, String title, this.author):super(title, id);
  @override
  String getDetails(){
    return "Book - Title: $title, ID: $id, Author: $author";
  }
}
class DVD extends LibraryItem{
  String director;
  DVD( id,  title, this.director):super(id, title);
  @override
  String getDetails(){
    return "DVD - Title: $title, ID: $id, Director: $director";
  }
}
void main(){
  //task1
  var myCar=Car('Honda', 'Civis', 4);
  myCar.display();

  //task2
  var cat=Cat();
  cat.makeSound();

  //task3
  var circle=Circle(13.2, 'red');
  print('circle with color ${circle.color} and radius ${circle.radius}');

  //task4
  var employee=Employee('Mike', 827.5);
  print(employee.calculateSalary());
  var manager=Manager('Malika', 827, 500);
  print(manager.calculateSalary());

  //task5
  var book=Book('182', 'Hell yeah', 'Derek');
  print(book.getDetails());
}
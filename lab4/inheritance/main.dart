//Task 2
class Animal {
  void makeSound() {
    print("Some animal sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!");
  }
}

//Task 3
class Shape {
  String color;
  Shape(this.color);
}

class Circle extends Shape {
  double radius;
  Circle(String color, this.radius) : super(color);
}

class Square extends Shape {
  double sideLength;
  Square(String color, this.sideLength) : super(color);
}

//Task 4
class Employee {
  String name;
  double baseSalary;

  Employee(this.name, this.baseSalary);

  double calculateSalary() {
    return baseSalary;
  }
}

class Manager extends Employee {
  double bonus;

  Manager(String name, double baseSalary, this.bonus)
      : super(name, baseSalary);

  @override
  double calculateSalary() {
    return baseSalary + bonus;
  }
}

//Task 5
class LibraryItem {
  String title;
  int id;

  LibraryItem(this.title, this.id);

  String getDetails() {
    return "Title: $title, ID: $id";
  }
}

class Book extends LibraryItem {
  String author;

  Book(String title, int id, this.author) : super(title, id);

  @override
  String getDetails() {
    return "Book - Title: $title, ID: $id, Author: $author";
  }
}

class DVD extends LibraryItem {
  String director;

  DVD(String title, int id, this.director) : super(title, id);

  @override
  String getDetails() {
    return "DVD - Title: $title, ID: $id, Director: $director";
  }
}

void main() {
  //Task2 
  Dog dog = Dog();
  Cat cat = Cat();
  dog.makeSound();
  cat.makeSound();

  //Task3
  Circle circle = Circle("Red", 5.0);
  Square square = Square("Blue", 4.0);
  print("Circle color: ${circle.color}, radius: ${circle.radius}");
  print("Square color: ${square.color}, side length: ${square.sideLength}");

  //Task4
  Employee emp = Employee("Alice", 3000);
  Manager mgr = Manager("Bob", 4000, 1500);
  print("${emp.name}'s salary: ${emp.calculateSalary()}");
  print("${mgr.name}'s salary: ${mgr.calculateSalary()}");

  //Task5
  Book book = Book("The Alchemist", 1, "Paulo Coelho");
  DVD dvd = DVD("Inception", 2, "Christopher Nolan");
  print(book.getDetails());
  print(dvd.getDetails());
}

//Task1
mixin Swimmer{
  void swim(){
    print("Moving through the water...");
  }
}
class Human with Swimmer{
  String name;
  Human(this.name);
}
class Fish with Swimmer{
  String species;
  Fish(this.species);
}

//Task2
mixin Flyer{
  void fly(){
    print('Taking off!');
  }
}
class Bird with Flyer{}
class Plane with Flyer{}

//Task3
mixin Logger{
  void log(String message){
    print('[LOG] $message');
  }
}
class DataService with Logger{
  void fetchData(){
    log('Fetching data');
  }
}

//Task4
mixin Validator{
  bool isEmailValid(String email){
    return email.contains('@')&&email.contains('.');
  }
  bool isPasswordStrong(String password){
    return password.length>8;
  }
}
class UserSignup with Validator{
  void validate(String email, String password){
    print('Email valid: ${isEmailValid(email)}');
    print('Password strong: ${isPasswordStrong(password)}');
  }
}

//Task5
mixin Performer{
  void perform(){
    print('Performs.');
  }
}
mixin Musician{
  void playInstrument(){
    print('Plays instrument.');
  }
}
class Artist{
  void calm(){
    print('Calms down!');
  }
}
class Dancer extends Artist with Performer{}
class Guitarist extends Artist with Performer, Musician{}
void main(){
  //Task1
  var person=Human('Alice');
  var fish=Fish('Tuna');
  person.swim();
  fish.swim();

  //Task2
  Bird bird=Bird();
  var plane=Plane();
  bird.fly();
  plane.fly();

  //Task3
  DataService service=DataService();
  service.fetchData();

  //Task4
  UserSignup user=UserSignup();
  user.validate('m.ibadlayeva@newuu.uz', '123345');

  //Task5
  Dancer dancer=Dancer();
  dancer.perform();
  dancer.calm();
  Guitarist guitarist=Guitarist();
  guitarist.calm();
  guitarist.perform();
  guitarist.playInstrument();
}

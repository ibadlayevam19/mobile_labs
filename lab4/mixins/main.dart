//Task 2
mixin Flyer {
  void fly() {
    print("Taking off!");
  }
}

class Bird with Flyer {}

class Plane with Flyer {}

//Task 3
mixin Logger {
  void log(String message) {
    print("[LOG] $message");
  }
}

class DataService with Logger {
  void fetchData() {
    log("Fetching data");
  }
}

//Task 4
mixin Validator {
  bool isEmailValid(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool isPasswordStrong(String password) {
    return password.length > 8;
  }
}

class UserSignup with Validator {
  void validate(String email, String password) {
    print("Email valid: ${isEmailValid(email)}");
    print("Password strong: ${isPasswordStrong(password)}");
  }
}

//Task 5
mixin Performer {
  void perform() {
    print("Performing on stage!");
  }
}

mixin Musician {
  void playInstrument() {
    print("Playing an instrument!");
  }
}

class Artist {}

class Dancer extends Artist with Performer {}

class Guitarist extends Artist with Performer, Musician {}

void main() {
  //Task2
  Bird bird = Bird();
  Plane plane = Plane();
  bird.fly();
  plane.fly();

  //Task3
  DataService service = DataService();
  service.fetchData();

  //Task4
  UserSignup signup = UserSignup();
  signup.validate("malika@example.com", "mypassword123");

  //Task5
  Dancer dancer = Dancer();
  dancer.perform();

  Guitarist guitarist = Guitarist();
  guitarist.perform();
  guitarist.playInstrument();
}

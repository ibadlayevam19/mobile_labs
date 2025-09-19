enum DaysOfWeek{
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}
void checkDay(DaysOfWeek day){
  switch (day){
    case DaysOfWeek.saturday:
    case DaysOfWeek.sunday:
      print("${day.name} is on the weekend!");
      break;
    default:
      print("${day.name} is a weekday.");
  }
}
enum OrderStatus{
  pending,
  processing,
  shipped,
  delivered,
  cancelled
}
enum TrafficLight{
  red, yellow, green;
  int get durationInSeconds{
    switch(this){
      case TrafficLight.red:
        return 30;
      case TrafficLight.yellow:
        return 5;
      case TrafficLight.green:
        return 45;
    }

  }
}
void instruction(TrafficLight color){
  switch(color){
    case TrafficLight.red:
      print("Stop");
    case TrafficLight.yellow:
      print("Caution");
    case TrafficLight.green:
      print("Go");
  }
}
enum UserRole{admin, editor, guest}
class User{
  String name;
  UserRole role;
  User(this.name, this.role);
  bool hasEditPermission(){
    if(this.role==UserRole.editor || this.role==UserRole.admin){
      return true;
    }
    else{
      return false;
    }
  }
}
void main(){
  //Task1
  checkDay(DaysOfWeek.friday);
  checkDay(DaysOfWeek.sunday);

  //Task2
  OrderStatus status=OrderStatus.processing;
  print(status);
  print(status.name);

  //Task3
  instruction(TrafficLight.red);
  instruction(TrafficLight.yellow);
  instruction(TrafficLight.green);

  //Task4
  var user=User('Malika', UserRole.admin);
  print(user.hasEditPermission());

  //Task5
  for (var light in TrafficLight.values){
    print("${light.name} → ${light.durationInSeconds} seconds");
  }
}
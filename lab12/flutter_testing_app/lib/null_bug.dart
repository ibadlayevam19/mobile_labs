String? username;

String greet(){
  return "Hello, ${username!.toUpperCase()}";
}
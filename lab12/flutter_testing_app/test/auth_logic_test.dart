import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_testing_app/auth_service.dart';


class AuthSuccess implements AuthService{
  @override
  String signIn(String email, String password){
    return 'success';
  }
}
class AuthFail implements AuthService{
  @override
  String signIn(String email, String password){
    return 'failure';
  }
}

class AuthError implements AuthService{
  @override
  String signIn(String email, String password){
    return 'error';
  }
}
void main(){
  test('successful login', () async{
    final mock=AuthSuccess();
    final result=mock.signIn('a@test.com', '123');

    expect(result, 'success');
  });

  test('failed login', () async{
    final mock=AuthFail();
    final result=mock.signIn('a@test.com', '123');

    expect(result, 'failure');
  });
  test('error thrown', () async{
    final mock=AuthError();
    final result=mock.signIn('a@test.com', '123');

    expect(result, 'error');
  });
}
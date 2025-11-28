import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_app/login_screen.dart';
import 'package:flutter/material.dart';

void main(){
  testWidgets('Login form validation test', (tester) async{
    await tester.pumpWidget(LoginScreen());

    //tap submit with empty fields
    await tester.tap(find.byKey(Key('submit')));
    await tester.pump();

    expect(find.text('Required'), findsNWidgets(2));

    //invalid email
    await tester.enterText(find.byKey(Key('email')), 'abc');
    await tester.enterText(find.byKey(Key('password')), '12345');
    await tester.pump();

    expect(find.text('Invalid email'), findsOneWidget);

    //valid data
    await tester.enterText(find.byKey(Key('email')), 'test@gmail.com');
    await tester.pump();

    await tester.enterText(find.byKey(Key('password')), '12345');
    await tester.pump();

    final button=tester.widget<ElevatedButton>(find.byKey(Key('submit')));
    expect(button.onPressed !=null, true);
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_app/counter_app.dart';
import 'package:flutter/material.dart';

void main(){
  testWidgets('Counter increments smoke test',(WidgetTester tester) async{
    await tester.pumpWidget(CounterApp());

    //initial value
    expect(find.text('0'),findsOneWidget);

    //tap increment
    await tester.tap(find.byKey(Key('increment')));
    await tester.pump();

    //value updates
    expect(find.text('1'),findsOneWidget);
  });
}
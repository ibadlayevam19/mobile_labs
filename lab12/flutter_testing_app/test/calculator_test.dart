import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_app/calculator.dart';

void main(){
  group('Calculator.add()', (){
    test('positive numbers', (){
      //arrange
      final calc=Calculator();
      //act
      final result=calc.add(3,4);
      //assert
      expect(result, 7); 
    });
    test('negative numbers',(){
      //arrange
      final calc=Calculator();
      //act and assert
      expect(calc.add(-3, -2), -5);
    });
    test('mixed sign numbers',(){
      //arrange
      final calc=Calculator();
      //act and assert
      expect(calc.add(-3, 7), 4);
    });
    test('zero values',(){
      //arrange
      final calc=Calculator();
      //act and assert
      expect(calc.add(0,5), 5);
    });
  });
}
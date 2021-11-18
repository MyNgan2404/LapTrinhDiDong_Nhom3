import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int? height;
  final int? weight;

  double? _bmi;

  String calculateBMI(){

    _bmi =weight!/pow(height!/100, 2);
    return  _bmi!.toStringAsFixed(1);// adding ! to the private variable
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'Bạn có trọng lượng cơ thể cao hơn bình thường. Cố gắng tập thể dục nhiều hơn nhé!';
    } else if (_bmi! >= 18.5) {
      return 'Tuyệt vời! Bạn có trọng lượng cơ thể bình thường.Hãy duy trì nhé!';
    } else {
      return 'Bạn có trọng lượng cơ thể thấp hơn bình thường. Hãy bổ sung nhiều chất dinh dưỡng hơn nhé!';
    }
  }
}

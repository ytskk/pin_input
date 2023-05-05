import 'package:flutter/material.dart';

class PinController extends ChangeNotifier {
  PinController({
    required int pinLength,
    this.onPinCompleted,
  })  : _pinValues = List<String?>.filled(pinLength, null),
        _pinLength = pinLength;

  final List<String?> _pinValues;
  final int _pinLength;
  int _currentIndex = 0;
  final void Function(String pin)? onPinCompleted;

  // getters.

  List<String?> get pinValues => _pinValues;
  int get currentIndex => _currentIndex;
  int get pinLength => _pinLength;
  String get pin => _pinValues.join();

  void addValue(String value) {
    _pinValues[_currentIndex] = value;
    _currentIndex += 1;

    if (isComplete()) {
      onPinCompleted?.call(getPinString());
    }

    notifyListeners();
  }

  void insertFullPin(String pin) {
    _currentIndex = 0;
    for (int i = 0; i < _pinLength; i += 1) {
      addValue(pin[i]);
    }
  }

  void removeLastValue() {
    if (!isEmpty()) {
      _pinValues[_currentIndex - 1] = null;
      _currentIndex -= 1;
    }

    notifyListeners();
  }

  String getPinString() {
    return _pinValues.join();
  }

  bool isComplete() {
    return _currentIndex > _pinLength - 1;
  }

  bool isEmpty() {
    return _currentIndex == 0;
  }
}

// class PinController {
//   PinController({
//     required int pinLength,
//     this.onPinCompleted,
//   })  : _pinValues = List<String?>.filled(pinLength, null),
//         _pinLength = pinLength;

//   final List<String?> _pinValues;
//   final int _pinLength;
//   int _currentIndex = 0;
//   final void Function(String pin)? onPinCompleted;

//   void addValue(String value) {
//     _pinValues[_currentIndex] = value;
//     _currentIndex += 1;

//     if (isComplete()) {
//       onPinCompleted?.call(getPinString());
//     }
//   }

//   void insertFullPin(String pin) {
//     for (int i = 0; i < _pinLength; i += 1) {
//       addValue(pin[i]);
//     }
//   }

//   void removeLastValue() {
//     if (!isEmpty()) {
//       _pinValues[_currentIndex - 1] = null;
//       _currentIndex -= 1;
//     }
//   }

//   List<String?> getPin() {
//     return _pinValues;
//   }

//   String getPinString() {
//     return _pinValues.join();
//   }

//   bool isComplete() {
//     return _currentIndex > _pinLength - 1;
//   }

//   bool isEmpty() {
//     return _currentIndex == 0;
//   }
// }

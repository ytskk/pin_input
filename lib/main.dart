import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_input/features/features.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildLightTheme(),
      home: PinInputPage(
        title: 'Введите код',
        subtitle:
            'На ваш телефон +7 (960) 147-67-47 поступит звонок. Введите последние 4 цифры звонящего номера',
        onPinComplete: (pin) {
          print('You pin is $pin');
        },
        pinLength: 4,
      ),
    );
  }
}

ThemeData buildLightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF7B61FF),
    ),
    textTheme: GoogleFonts.latoTextTheme().apply(
      displayColor: Colors.black,
      bodyColor: Colors.black,
    ),
  );
}

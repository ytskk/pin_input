import 'package:flutter/material.dart';
import 'package:pin_input/features/features.dart';
import 'package:provider/provider.dart';

class PinInputPage extends StatelessWidget {
  const PinInputPage({
    required this.title,
    this.subtitle,
    this.onPinComplete,
    required this.pinLength,
    super.key,
  });

  final String title;
  final String? subtitle;
  final int pinLength;
  final void Function(String pin)? onPinComplete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (_) => PinController(
        pinLength: pinLength,
        onPinCompleted: onPinComplete,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 50),
              Text(
                title,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 20),
                Text(
                  subtitle!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 20),
              Consumer<PinController>(
                builder: (_, value, ___) => PinView(
                  values: value.pinValues,
                ),
              ),
              // const Spacer(),
              Consumer<PinController>(builder: (context, value, child) {
                return Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        value.insertFullPin('3826');
                      },
                      child: const Text('Insert pin: 3826'),
                    ),
                  ],
                );
              }),
              Row(
                children: [
                  Expanded(
                    child: BrandButton(
                      onPressed: () {},
                      child: const Text('Запросить еще раз'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Consumer<PinController>(
                builder: (_, value, ___) {
                  return NumericKeyboard(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    runSpacing: 16,
                    onDigitPressed: (digit) {
                      value.addValue(digit);
                    },
                    onRemovePressed: () {
                      value.removeLastValue();
                    },
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

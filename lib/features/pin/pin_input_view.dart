import 'package:flutter/material.dart';

import 'widgets/pin_input_badge.dart';

class PinView extends StatelessWidget {
  const PinView({
    super.key,
    required this.values,
  });

  final List<String?> values;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < values.length; i += 1)
          PinInputBadge(
            value: values[i],
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

typedef OnDigitPressed = void Function(String digit);
typedef OnRemovePressed = void Function();

class NumericKeyboard extends StatelessWidget {
  const NumericKeyboard({
    this.onDigitPressed,
    this.onRemovePressed,
    this.padding,
    this.spacing,
    this.runSpacing,
    super.key,
  });

  final OnDigitPressed? onDigitPressed;
  final OnRemovePressed? onRemovePressed;
  final EdgeInsets? padding;
  final double? spacing;
  final double? runSpacing;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int row = 1; row <= 3; row += 1)
              Row(
                children: [
                  for (int col = 0; col < 3; col += 1) ...[
                    DigitButton(
                      addHeight: runSpacing,
                      onPressed: onDigitPressed != null
                          ? () =>
                              onDigitPressed?.call((row + col * 3).toString())
                          : null,
                      content: Text((row + col * 3).toString()),
                    ),
                    if (spacing != null && col != 3) SizedBox(width: spacing),
                  ]
                ],
              ),
            Row(
              children: [
                const Spacer(),
                if (spacing != null) SizedBox(width: spacing),
                DigitButton(
                  addHeight: runSpacing,
                  onPressed: onDigitPressed != null
                      ? () => onDigitPressed?.call('0')
                      : null,
                  content: const Text('0'),
                ),
                if (spacing != null) SizedBox(width: spacing),
                DigitButton(
                  addHeight: runSpacing,
                  onPressed: onRemovePressed,
                  content: const Icon(Icons.backspace_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DigitButton extends StatelessWidget {
  const DigitButton({
    required this.content,
    this.onPressed,
    this.addHeight,
    super.key,
  });

  final Widget content;
  final VoidCallback? onPressed;
  final double? addHeight;

  static const double _defaultMinHeight = 56;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styledChild = DefaultTextStyle(
      style: theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 32,
      ),
      child: content,
    );

    return Expanded(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: _defaultMinHeight + (addHeight ?? 0)),
        child: TextButton(
          onPressed: onPressed,
          child: styledChild,
        ),
      ),
    );
  }
}

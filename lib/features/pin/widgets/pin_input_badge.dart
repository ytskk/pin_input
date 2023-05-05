import 'package:flutter/material.dart';

class PinInputBadge extends StatelessWidget {
  const PinInputBadge({
    this.value,
    super.key,
  });

  final String? value;

  static const double _badgeSize = 64;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final child = value == null
        ? null
        : Text(
            value!,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.primary,
            ),
          );

    return SizedBox(
      width: _badgeSize,
      height: _badgeSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

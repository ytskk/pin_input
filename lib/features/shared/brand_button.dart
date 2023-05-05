import 'package:flutter/material.dart';

class BrandButton extends StatelessWidget {
  const BrandButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;

  static const double _borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final _child = DefaultTextStyle(
      style: theme.textTheme.bodyMedium!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      child: child,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        gradient: brandGradient,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Ink(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Center(child: _child),
            ),
          ),
        ),
      ),
    );
  }
}

const brandGradient = LinearGradient(
  colors: [
    Color(0xFF7C62FF),
    Color(0xFFBA62FF),
  ],
);

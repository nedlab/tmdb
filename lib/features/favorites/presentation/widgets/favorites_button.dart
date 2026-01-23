import 'package:flutter/material.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({
    super.key,
    required this.isFavorite,
    required this.onPressed,
    this.addLabel = 'Add to favorites',
    this.removeLabel = 'Remove from favorites',
    this.padding = const EdgeInsets.only(top: 20),
  });

  final bool isFavorite;
  final VoidCallback? onPressed;

  final String addLabel;
  final String removeLabel;

  /// Outer padding that the parent screen can override.
  final EdgeInsetsGeometry padding;

  static const _minHeight = 52.0;
  static const _addColor = Color(0xFFE8CF63);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        child: isFavorite ? _removeButton(context) : _addButton(context),
      ),
    );
  }

  Widget _addButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(_minHeight),
        shape: const StadiumBorder(),
        backgroundColor: _addColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(addLabel),
    );
  }

  Widget _removeButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(_minHeight),
        shape: const StadiumBorder(),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      onPressed: onPressed,
      child: Text(removeLabel),
    );
  }
}

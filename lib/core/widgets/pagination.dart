import 'package:flutter/material.dart';

import 'package:tmdb/app/theme/app_theme.dart';

class Pagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onCurrentPageChanged;
  final double itemWidth;
  final double spacing;

  const Pagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onCurrentPageChanged,
    this.itemWidth = 48.0,
    this.spacing = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxSlots = _maxSlotsForWidth(
          maxWidth: maxWidth,
          itemWidth: itemWidth,
          spacing: spacing,
          total: totalPages,
        );

        final items = _buildItems(currentPage, totalPages, maxSlots);

        return Wrap(
          spacing: spacing,
          children: [
            for (final item in items)
              if (item == null)
                _Dots(size: itemWidth)
              else
                _CirclePage(
                  page: item,
                  selected: item == currentPage,
                  size: itemWidth,
                  onTap: () => onCurrentPageChanged(item),
                ),
          ],
        );
      },
    );
  }

  int _maxSlotsForWidth({
    required double maxWidth,
    required double itemWidth,
    required double spacing,
    required int total,
  }) {
    if (total <= 0) return 0;
    if (!maxWidth.isFinite || maxWidth <= 0) {
      return total;
    }

    // N*itemWidth + (N-1)*spacing <= maxWidth
    final slots = ((maxWidth + spacing) / (itemWidth + spacing)).floor();
    return slots.clamp(1, total);
  }

  List<int?> _buildItems(int current, int total, int maxSlots) {
    if (total <= 0) return const <int?>[];
    current = current.clamp(1, total);

    if (total <= 1) return <int?>[1];

    if (maxSlots <= 0) return const <int?>[];
    if (total <= maxSlots) {
      return List<int?>.generate(total, (i) => i + 1);
    }

    // If we don't have room for dots, fall back to showing what fits.
    if (maxSlots == 1) return <int?>[current];
    if (maxSlots == 2) {
      if (current == total) {
        return <int?>[(total - 1).clamp(1, total), total];
      }
      return <int?>[current, total];
    }

    if (maxSlots == 3) {
      final threshold = total - 1;
      if (current >= threshold) {
        final start = (total - 1).clamp(1, total);
        return <int?>[null, start, total];
      }
      if (current <= 2) {
        return <int?>[1, null, total];
      }
      return <int?>[current, null, total];
    }

    // maxSlots >= 4
    // If current page is within the last (maxSlots - 1) pages, show leading dots.
    final leadingDotsThreshold = total - maxSlots + 2;
    if (current >= leadingDotsThreshold) {
      final windowLen = maxSlots - 1;
      final start = total - windowLen + 1;
      final pages = List<int?>.generate(windowLen, (i) => start + i);
      return <int?>[null, ...pages];
    }

    // Otherwise show a window ending before the last page, plus trailing dots and the last page.
    final windowLen = maxSlots - 2;
    final maxStart = (total - 1) - windowLen + 1;
    final desiredStart = current - (windowLen ~/ 2);
    var start = desiredStart.clamp(1, maxStart);
    if (current <= 2) start = 1;
    final pages = List<int?>.generate(windowLen, (i) => start + i);

    return <int?>[...pages, null, total];
  }
}

class _CirclePage extends StatelessWidget {
  final int page;
  final bool selected;
  final double size;
  final VoidCallback onTap;

  const _CirclePage({
    required this.page,
    required this.selected,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final selectedBg = isDark ? AppColors.darkFavorite : AppColors.lightFavorite;
    final selectedFg = isDark ? AppColors.darkBtnTxt1 : AppColors.lightBtnTxt1;
    final normalFg = isDark ? AppColors.darkTxt : AppColors.lightTxt;

    final bg = selected ? selectedBg : Colors.transparent;
    final fg = selected ? selectedFg : normalFg;
    final borderSideColor = isDark ? AppColors.darkTxt : AppColors.lightTxt;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
          border: selected ? null : Border.all(color: borderSideColor, width: 1.0),
        ),
        child: Text(
          '$page',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: fg),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final double size;

  const _Dots({required this.size});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? AppColors.darkTxt : AppColors.lightTxt;
    return SizedBox(
      width: size*0.3,
      height: size,
      child: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: Text(
          '...',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: base,
          ),
        ),
      ),
    );
  }
}

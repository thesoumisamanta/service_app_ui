import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class CarouselSlider extends StatefulWidget {
  final List<Widget> items;
  final double maxHeight;
  final double minHeight;
  final double viewportFraction;
  final double itemSpacing;

  const CarouselSlider({
    super.key,
    required this.items,
    this.maxHeight = 220,
    this.minHeight = 160,
    this.viewportFraction = 0.85,
    this.itemSpacing = 8,
  });

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  late PageController _controller;

  double _currentPage = 0;
  int _currentIndex = 0;

  static const int _initialPage = 1000;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: _initialPage,
    );

    _currentPage = _initialPage.toDouble();

    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? _currentPage;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox();

    return Column(
      children: [
        SizedBox(
          height: widget.maxHeight,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index % widget.items.length;
              });
            },
            itemBuilder: (context, index) {
              final actualIndex = index % widget.items.length;

              final double distance = (_currentPage - index).abs();
              final double scale = (1 - distance).clamp(0.0, 1.0);

              final double height =
                  widget.minHeight +
                  (widget.maxHeight - widget.minHeight) * scale;

              return Center(
                child: SizedBox(
                  height: height,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: widget.itemSpacing,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: widget.items[actualIndex],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.items.length,
            (index) => _buildDot(index),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    final bool isActive = index == _currentIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.white : AppColors.offWhite,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedToggleButton extends StatefulWidget {
  final List<String> values;
  final ValueChanged<int> onToggle;
  final Color backgroundColor;
  final Color buttonColor;
  final double height;
  final double width;
  final Duration animationDuration;
  final Curve animationCurve;
  final int initialIndex;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;

  /// Creates an animated toggle button with customizable options.
  /// The button allows toggling between multiple options with smooth animations.
  ///
  /// Throws an assertion error if [values] has less than 2 items or if [icons]
  /// is provided but does not match the length of [values].
  const AnimatedToggleButton({
    super.key,
    required this.values,
    required this.onToggle,
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1.0),
    this.buttonColor = const Color.fromRGBO(142, 39, 143, 1.0),
    this.height = 50.0,
    this.width = 100.0,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.initialIndex = 0,
    this.padding = const EdgeInsets.all(2.0),
    this.textStyle,
    this.selectedTextStyle,
  })  : assert(values.length >= 2, 'At least two values are required'),
        assert(
          initialIndex >= 0 && initialIndex < values.length,
          'Initial position must be within the range of values list.',
        );

  @override
  State<AnimatedToggleButton> createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButton>
    with TickerProviderStateMixin {
  late int _currentIndex;
  late Map<int, AnimationController> _animationControllers;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _animationControllers = {};
  }

  @override
  void dispose() {
    for (var controller in _animationControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: 
                [
                  BoxShadow(
                    color: Colors.black.withAlpha((0.1 * 255).toInt()),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
          ),
          child: Stack(
            children: [
              // Animated Selection Indicator
              AnimatedAlign(
                alignment: _getAlignment(),
                duration: widget.animationDuration,
                curve: widget.animationCurve,
                child: Container(
                  width: _getButtonWidth(),
                  height: widget.height - widget.padding.vertical,
                  decoration: BoxDecoration(
                    color: widget.buttonColor,
                    borderRadius: BorderRadius.circular(
                      8.0 - widget.padding.horizontal / 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((0.1 * 255).toInt()),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
              // Toggle Button Options
              Row(
                children: List.generate(
                  widget.values.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () => _onToggle(index),
                      child: Container(
                        color: Colors.transparent,
                        child: Center(child: _buildOptionContent(index)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionContent(int index) {
    final isSelected = _currentIndex == index;

    // Ensure we have an animation controller for this index
    if (!_animationControllers.containsKey(index)) {
      _animationControllers[index] = AnimationController(
        duration: widget.animationDuration,
        vsync: this,
        value: isSelected ? 1.0 : 0.0,
      );
    }

    // Get controller for this index
    final controller = _animationControllers[index]!;

    // Update animation target based on selection state
    if (isSelected && controller.value < 1.0) {
      controller.animateTo(1.0, curve: widget.animationCurve);
    } else if (!isSelected && controller.value > 0.0) {
      controller.animateTo(0.0, curve: widget.animationCurve);
    }

    // The content to display
    final String content = widget.values[index];

    // Get base styles
    final TextStyle normalStyle = widget.textStyle ??
        const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            color: Color.fromRGBO(0, 0, 0, 1.0));
    final TextStyle selectedStyle = widget.selectedTextStyle ??
        const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            color: Color.fromRGBO(255, 255, 255, 1));

    // Use AnimatedBuilder for smooth transitions of all style properties
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // Interpolate font weight (can't directly lerp FontWeight)
        final int normalWeightIndex =
            normalStyle.fontWeight?.index ?? 3; // w400 = normal
        final int selectedWeightIndex =
            selectedStyle.fontWeight?.index ?? 6; // w700 = bold
        final int weightIndex = (normalWeightIndex +
                ((selectedWeightIndex - normalWeightIndex) * controller.value)
                    .round())
            .clamp(0, FontWeight.values.length - 1);
        final FontWeight fontWeight = FontWeight.values[weightIndex];

        // Interpolate font size
        final double normalSize = normalStyle.fontSize ?? 14.0;
        final double selectedSize = selectedStyle.fontSize ?? 14.0;
        final double fontSize =
            normalSize + (selectedSize - normalSize) * controller.value;

        // Interpolate color
        final Color color = Color.lerp(
          normalStyle.color,
          selectedStyle.color,
          controller.value,
        )!;

        // Interpolate letter spacing if defined
        final double normalSpacing = normalStyle.letterSpacing ?? 0.0;
        final double selectedSpacing = selectedStyle.letterSpacing ?? 0.0;
        final double letterSpacing = normalSpacing +
            (selectedSpacing - normalSpacing) * controller.value;

        // Create interpolated text style with all animated properties
        final TextStyle interpolatedStyle = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing,
          fontFamily: selectedStyle.fontFamily ?? normalStyle.fontFamily,
          fontStyle: controller.value > 0.5
              ? selectedStyle.fontStyle
              : normalStyle.fontStyle,
        );

        return _buildContent(content, null, interpolatedStyle);
      },
    );
  }

  // Helper method to build content with or without icon
  Widget _buildContent(String content, IconData? iconData, TextStyle style) {
    if (iconData != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: style.color, size: 20),
          const SizedBox(width: 5),
          Text(content, style: style),
        ],
      );
    }

    return Text(content, style: style);
  }

  Alignment _getAlignment() {
    final count = widget.values.length;
    final step = 2 / (count - 1);

    // For 2 items: -1 and 1
    // For 3 items: -1, 0, 1
    // For 4 items: -1, -0.33, 0.33, 1
    // And so on...

    double x = -1 + (_currentIndex * step);
    return Alignment(x, 0);
  }

  double _getButtonWidth() {
    // Width of a single button accounting for padding
    return (widget.width / widget.values.length) -
        widget.padding.horizontal / 2;
  }

  void _onToggle(int index) {

    setState(() {
      _currentIndex = index;
    });
    widget.onToggle(index);
  }
}
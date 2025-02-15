import 'package:flutter/material.dart';

/// A customizable animated button with a loading indicator.
///
/// This button smoothly transitions from its default state to a circular
/// loading indicator when `isLoading` is set to `true`.
///
/// ### Features:
/// - Customizable size, color, text style, and border radius.
/// - Displays a `CircularProgressIndicator` when loading.
/// - Animates the width reduction and shape transformation.
///
/// Author: Sabin Poudel
/// GitHub Profile: [Sabin Poudel](https://github.com/sabin6969)

class AnimatedButton extends StatefulWidget {
  final bool isLoading;
  final void Function()? onTap;
  final String buttonName;
  final double height;
  final double width;
  final Color color;
  final TextStyle textStyle;
  final BorderRadius? radius;
  final Color loadingIndicatorColor;
  const AnimatedButton({
    super.key,
    required this.isLoading,
    required this.onTap,
    required this.buttonName,
    required this.height,
    required this.width,
    this.radius,
    this.textStyle = const TextStyle(
      color: Colors.white, // Default text color white
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    this.color = Colors.blue, // Default button color
    this.loadingIndicatorColor = Colors.white,
  });

  @override
  State<AnimatedButton> createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.medium2,
    );

    _animation = Tween<double>(
      begin: 1,
      end: 0.25,
    ).animate(
      _animationController,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimatedButton oldWidget) {
    if (oldWidget.isLoading != widget.isLoading) {
      if (widget.isLoading) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isLoading,
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return ClipRRect(
              borderRadius: widget.radius ?? BorderRadius.circular(12),
              child: Container(
                height: widget.height,
                width: widget.width * _animation.value,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape:
                      _animationController.status == AnimationStatus.completed
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                ),
                child: Center(
                  child:
                      _animationController.status == AnimationStatus.completed
                          ? CircularProgressIndicator(
                              color: widget.loadingIndicatorColor,
                            )
                          : Text(
                              widget.buttonName,
                              style: widget.textStyle,
                            ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

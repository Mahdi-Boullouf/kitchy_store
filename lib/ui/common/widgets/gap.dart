import 'package:flutter/material.dart';

abstract class Gap extends StatelessWidget {
  final double size;

  const Gap({super.key, required this.size});
}

class VGap extends Gap {
  const VGap(double size, {super.key}) : super(size: size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class HGap extends Gap {
  const HGap(double size, {super.key}) : super(size: size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}

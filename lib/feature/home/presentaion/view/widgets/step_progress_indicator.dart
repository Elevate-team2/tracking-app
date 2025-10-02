import 'package:flutter/material.dart';
import 'package:tracking_app/core/theme/app_colors.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int stepsLength;


  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.stepsLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        stepsLength,
            (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 4,
            decoration: BoxDecoration(
              color: index <= currentStep ? AppColors.green : AppColors.white[60],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

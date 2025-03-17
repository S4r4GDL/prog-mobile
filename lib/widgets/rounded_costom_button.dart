import 'package:flutter/material.dart';

class RoundedCostomButton extends StatelessWidget {
  const RoundedCostomButton({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.onTap,
    this.labelColor,
  });

  final String? buttonText;
  final Color? buttonColor;
  final Color? labelColor;
  final Widget? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (e) => onTap!));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: labelColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}

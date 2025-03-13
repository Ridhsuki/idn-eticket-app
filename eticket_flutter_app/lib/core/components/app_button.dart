import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonColor,
  });

  final String title;
  final Color? buttonColor;
  // final
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColor.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}

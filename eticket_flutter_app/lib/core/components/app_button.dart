import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:flutter/material.dart';
class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.mainColor),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}

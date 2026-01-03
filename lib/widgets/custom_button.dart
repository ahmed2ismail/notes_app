import 'package:flutter/material.dart';
import 'package:notes_app/constansts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: kPrimaryColor,
      onPressed: onPressed,
      child: Text(
        'Add',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

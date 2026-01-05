import 'package:flutter/material.dart';
import 'package:notes_app/constansts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.isLoading = false});
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: kPrimaryColor,
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              height: 24,
              width: 24,
              // بنستخدم CircularProgressIndicator عشان نعرض مؤشر تحميل وبيظهر في الزرار نفسه لما الحالة بتاعت ال Cubit تكون Loading
              child: const CircularProgressIndicator(color: Colors.purple),
            )
          : const Text(
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

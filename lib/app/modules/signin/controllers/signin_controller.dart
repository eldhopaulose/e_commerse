import 'package:achievement_view/achievement_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController

  // final TextEditingController numberController = TextEditingController();
  // String initialCountry = 'IN';
  // PhoneNumber number = PhoneNumber(isoCode: 'IN');

  final TextEditingController emailController = TextEditingController();

  bool isCircle = true;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  void validation(BuildContext context, error) {
    AchievementView(
      title: "Error!",
      subTitle: error,
      isCircle: isCircle,
      listener: print,
      icon: Icon(Icons.mood_bad, color: const Color.fromARGB(255, 180, 86, 86)),
      iconBackgroundColor: Colors.white,
      color: Colors.red,
      borderRadius: BorderRadius.circular(12),
    ).show(context);
  }

  onSignInClick(context) {
    final bool isValid = EmailValidator.validate(emailController.text);
    if (!isValid || emailController.text.isEmpty) {
      final error =
          "Please fill in all required fields, or provide valid entries.";
      validation(context, error);
    }
  }
}

import 'package:e_commerse/app/modules/signin/views/signin_view.dart';
import 'package:e_commerse/app/modules/widgets/button.dart';
import 'package:e_commerse/app/modules/widgets/otp.dart';
import 'package:e_commerse/app/modules/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
            OtpWidget(otpGet: (String otp) {
              print('OtpView otpGet' + otp);
              controller.otp = otp;
            }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextView(
                  text: 'Resend OTP? ',
                  fontSize: 13,
                  color: Colors.black,
                ),
                InkWell(
                  onTap: () {
                    controller.onOtpResendClick(context);
                  },
                  child: TextView(
                    text: 'Get OTP',
                    fontSize: 13,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Button(
              text: 'Register Now',
              onClick: () {
                controller.onOtpClick(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

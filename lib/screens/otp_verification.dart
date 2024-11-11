import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/main.dart';
import 'package:liveasy/screens/profile_select.dart';
import 'package:liveasy/utils/utilities.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({
    super.key,
    required this.vid,
    required this.phoneNumber,
    this.token,
  });

  final String vid;
  final int? token;
  final String phoneNumber;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final otpController = TextEditingController();
  var code = '';

  signIn(context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.vid,
      smsCode: code,
    );

    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const MyApp(); // or ProfilePage
        }));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const Text(
              "Verify Phone",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Code is sent to number",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Utility().widthAuto(0.9, context),
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                onChanged: (value) {
                  setState(() {
                    code = value;
                  });
                },
                onCompleted: signIn(context),
                length: 6,
                controller: otpController,
                enableActiveFill: true,
                animationType: AnimationType.scale,
                pinTheme: PinTheme(
                    fieldWidth: 45,
                    activeFillColor: Colors.blue.shade300,
                    selectedColor: Colors.black,
                    activeColor: Colors.blue.shade300,
                    inactiveFillColor: Colors.blue.shade300,
                    inactiveColor: Colors.blue.shade300,
                    selectedFillColor: Colors.blue.shade300),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the code? ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Request Again",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Utility().widthAuto(0.9, context),
              height: 50,
              child: FilledButton(
                onPressed: () {
                  if (otpController.text.toString().length == 6) {
                    //signIn(context);
                  } else if (otpController.text.toString().length != 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incomplete Code'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid Action'),
                      ),
                    );
                  }
                },
                style: const ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromRGBO(46, 59, 98, 1))),
                child: const Text(
                  'VERIFY AND CONTINUE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Image.asset("assets/images/backDesign.png")
          ],
        ),
      ),
    );
  }
}

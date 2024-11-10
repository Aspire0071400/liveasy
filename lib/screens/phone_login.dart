import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveasy/utils/utilities.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController number = TextEditingController();
  CountryCode selectedCountryCode = CountryCode.fromCountryCode('IN');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const Text(
              "Please enter your mobile number",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "You'll receive a 6-digit code\nto verify next",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: Utility().widthAuto(0.9, context),
              child: TextField(
                controller: number,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 10,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  prefixIcon: CountryCodePicker(
                    initialSelection: 'IN',
                    onChanged: (CountryCode countryCode) {
                      setState(() {
                        selectedCountryCode = countryCode;
                      });
                    },

                    padding: EdgeInsets.zero, // Remove default padding
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  prefixText: '-  ',
                  prefixStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  hintText: 'Mobile Number',
                  hintStyle: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Utility().widthAuto(0.9, context),
              height: 50,
              child: FilledButton(
                onPressed: () {
                  if (number.text.toString().length == 10) {
                    final numWithCode =
                        selectedCountryCode.toString() + number.text.toString();
                  } else if (number.text.toString().isEmpty) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid Number'),
                      ),
                    );
                  }

                  //  Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return const PhoneLogin();
                  // }));
                },
                style: const ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromRGBO(46, 59, 98, 1))),
                child: const Text(
                  'CONTINUE',
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

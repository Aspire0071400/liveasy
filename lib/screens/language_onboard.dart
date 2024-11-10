import 'package:flutter/material.dart';
import 'package:liveasy/screens/phone_login.dart';
import 'package:liveasy/utils/utilities.dart';

class LanguageOnboarding extends StatefulWidget {
  const LanguageOnboarding({super.key});

  @override
  State<LanguageOnboarding> createState() => _LanguageOnboardingState();
}

class _LanguageOnboardingState extends State<LanguageOnboarding> {
  @override
  Widget build(BuildContext context) {
    //var adaptive = MediaQuery.sizeOf(context);

    List<String> items = ['English', 'Hindi'];
    String dropDownValue = items.first;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            Image.asset(
              "assets/images/image.png",
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const Text(
              "Please select your Language",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "You can change the language\nat any time",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: true,
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: dropDownValue,
                    onChanged: (String? value) {
                      setState(() {
                        dropDownValue = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(
              width: Utility().widthAuto(0.65, context),
              height: 50,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const PhoneLogin();
                      },
                    ),
                  );
                },
                style: const ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                    // minimumSize: WidgetStatePropertyAll(Size(200, 50)),
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromRGBO(46, 59, 98, 1))),
                child: const Text(
                  'NEXT',
                  style: TextStyle(fontSize: 18),
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

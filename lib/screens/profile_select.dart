import 'package:flutter/material.dart';
import 'package:liveasy/utils/utilities.dart';

class ProfileSelect extends StatefulWidget {
  const ProfileSelect({super.key});

  @override
  State<ProfileSelect> createState() => _ProfileSelectState();
}

class _ProfileSelectState extends State<ProfileSelect> {
  String _selectedProfile = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Please select your profile",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildRadioOption('Shipper', 'assets/images/shipper.png'),
            const SizedBox(height: 10),
            buildRadioOption('Transporter', 'assets/images/transporter.png'),
            const SizedBox(height: 20),
            SizedBox(
              width: Utility().widthAuto(0.9, context),
              height: 50,
              child: FilledButton(
                onPressed: () {
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
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildRadioOption(String title, String icon) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.threeLine,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        visualDensity: VisualDensity.compact,
        minLeadingWidth: 0,
        leading: Transform.scale(
          scale: 1.5,
          child: Radio<String>(
            fillColor:
                const WidgetStatePropertyAll(Color.fromRGBO(46, 59, 98, 1)),
            visualDensity: VisualDensity.compact,
            value: title,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            groupValue: _selectedProfile,
            onChanged: (value) {
              setState(() {
                _selectedProfile = value!;
              });
            },
          ),
        ),
        title: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          minLeadingWidth: 0,
          leading: Image.asset(
            icon,
            width: MediaQuery.of(context).size.width * 0.12,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle:
              const Text('Lorem ipsum dolor sit amet, consectetur adipiscing'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mlkeyprg/constants/pallete.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}
  TextEditingController countrycode = TextEditingController();
var phone = "";
class _PhoneFieldState extends State<PhoneField> {
  
  @override
  void initState() {
    countrycode.text = "+91";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(
            color: Pallete.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 40,
              child: TextField(
                controller: countrycode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Pallete.gradient2,
                      width: 3,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              '|',
              style: TextStyle(
                fontSize: 35,
                color: Pallete.borderColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  phone = value;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Phone",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

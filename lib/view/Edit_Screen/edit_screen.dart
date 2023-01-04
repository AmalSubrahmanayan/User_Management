import 'package:flutter/material.dart';
import 'package:mlkeyprg/constants/pallete.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final double coverHeight = 260;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180), child: getAppBar()),
    );
  }

  // Widget BuildCoverImage() => Container(
  //       color: Pallete.borderColor,
  //       child: Image.network("",
  //       width: double.infinity,
  //       // headers: coverHeight,
  //       fit: BoxFit.cover,
  //       ),
  //     );

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Pallete.backgroundColor,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Pallete.gradient2)),
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'abc@gmail.com',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

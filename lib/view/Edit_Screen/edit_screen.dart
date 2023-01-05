import 'package:flutter/material.dart';
import 'package:mlkeyprg/constants/pallete.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _domainNameController = TextEditingController();

  final double coverHeight = 260;
  @override
  Widget build(BuildContext context) {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _domainNameController = TextEditingController();
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(180),
      //   child: getAppBar(),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    // image
                    child: CircleAvatar(
                      backgroundColor: Pallete.borderColor,
                      radius: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ElevatedButton.icon(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.image_outlined),
                    //   label: const Text('Add An Image'),
                    // ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.textColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text('Add Image'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Full Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Full Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Age ';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Phone Number';
                    } else if (value.length != 10) {
                      return 'Enter valid Phone Number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: _domainNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Domain Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Domain Name ';
                    } else {
                      return null;
                    }
                  },
                ),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     // if (_formKey.currentState!.validate()) {
                //     //   onEditStudentButtonClicked(context);
                //     //   Navigator.of(context).pop();
                //     // }
                //   },
                //   icon: const Icon(Icons.save),
                //   label: const Text('Save'),
                // )
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.textColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  // Widget getAppBar() {
  //   return AppBar(
  //     elevation: 0,
  //     backgroundColor: Pallete.whiteColor,
  //     flexibleSpace: SafeArea(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: 75,
  //             width: 75,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(28),
  //                 border: Border.all(color: Pallete.gradient2)),
  //             child: Center(
  //               child: Container(
  //                 width: 70,
  //                 height: 70,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(30),
  //                   image: const DecorationImage(
  //                       image: NetworkImage(
  //                         "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  //                       ),
  //                       fit: BoxFit.cover),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const Text(
  //             'Name',
  //             style: TextStyle(
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           const Text(
  //             'abc@gmail.com',
  //             style: TextStyle(
  //               fontSize: 15,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


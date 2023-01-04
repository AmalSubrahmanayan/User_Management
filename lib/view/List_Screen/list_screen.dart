import 'package:flutter/material.dart';
import 'package:mlkeyprg/constants/pallete.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Pallete.backgroundColor,
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'message',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Pallete.borderColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Pallete.shadowColor,
                              spreadRadius: 2,
                              blurRadius: 15,
                              offset: const Offset(0, 1)),
                        ],
                        color: Pallete.listColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color: Pallete.borderColor)),
                          child: Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Name',
                                style: TextStyle(
                                    color: Pallete.backgroundColor,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Age : 24',
                                style: TextStyle(
                                    color: Pallete.borderColor, fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  label: const Text('Add'), 
                  backgroundColor: Pallete.gradient3,
                  icon: const Icon(
                    
                    Icons.add,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget buttonElevated() {
  //   return ElevatedButton(
  //     child: const Text("add", style: TextStyle(fontSize: 30)),
  //     onPressed: () {},
  //   );
  // }
}

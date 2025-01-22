import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.10,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.person,
            color: Color(0xffF67301),
            size: 50,
          ),
          Image(
            image: AssetImage('lib/images/logo.png'),
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Icon(
            Icons.logout,
            color: Color(0xffF67301),
            size: 50,
            weight: 1,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
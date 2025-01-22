import 'package:app/ThemeData.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.10,
      backgroundColor: darkMode.appBarBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.person,
            size: 50,
          ),
          Image(
            image: AssetImage('lib/images/logo.png'),
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Icon(
            Icons.logout,
            size: 50,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../ThemeData.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: MediaQuery.of(context).size.height * 0.10,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: IconButton(
          icon: Icon(
            Icons.person,
            color: darkMode.btnTextColor,
            size: 50,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon: Icon(
              Icons.logout,
              color: darkMode.btnTextColor,
              size: 50,
            ),
            onPressed: () {
              localStorage.removeItem('username');
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
      ],
      backgroundColor: darkMode.appBarBackgroundColor,
      automaticallyImplyLeading: false,
      title: Image(
        image: AssetImage('lib/images/logo.png'),
        height: MediaQuery.of(context).size.height * 0.1,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

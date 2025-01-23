import 'package:app/ThemeData.dart';
import 'package:app/components/CustomTextField.dart';
import 'package:app/components/MyButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Image(
                  image: AssetImage('lib/images/logo.png'),
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Image(
                  image: AssetImage('lib/images/name.png'),
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextField(
                  label: "Nome de Usuário",
                  controller: userController,
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)
                    ),
                  ),
                  child: MyButton(text: "Entrar", onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

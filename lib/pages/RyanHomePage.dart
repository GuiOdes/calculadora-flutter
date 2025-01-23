import 'package:app/components/MyButton.dart';
import 'package:app/components/MyTextField.dart';
import 'package:flutter/material.dart';

import '../components/MyAppBar.dart';

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
                MyTextField(
                  hintText: "Nome de Usuário",
                  obscureText: false,
                  controller: userController,
                  //validator: validator,
                  keyboardType: TextInputType.name,
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
                  child: MyButton(text: "Entrar", onPressed: () {}),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

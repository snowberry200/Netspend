
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//import '../authservice/auth.dart';
import '../database.dart';
// import '../widget/homepage/homepage_layout.dart';
// import '../widget/textfield.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  //url Luancher method
  launchUrl(url) async {
    if (await canLaunchUrl(url)) {
       launchUrl((url));
    } else {
      throw 'Could not launch $url';
    }
  }

  //final authClient = AuthService();
  late String data;
  bool ishidden = true;
  //bool _isPregressing = false;
  //final authclient = AuthService();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool ischecked = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView(children: [
        Container(
          //width: MediaQuery.of(context).size.width,
          height: 60,
          margin: const EdgeInsets.only(top: 20),
    
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 60,
                    width: 150,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'data:image/png;base64,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',
                                scale: 0.5)))),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('Account Login',
              style: (TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.black))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40),
          child: Center(
            child: Column(
              children: [
                Form(
                    key: _formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10.0),
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
                            controller: nameController = TextEditingController(),
                            decoration: const InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                )),
                            keyboardType: TextInputType.name,
                            autofillHints: const [AutofillHints.name],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: TextFormField(
                            obscureText: ishidden,
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
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                        ),
                       
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )),
                     Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 10, bottom: 30),
                      child: Row(
                        children: [
                          Checkbox(
                              value: ischecked,
                              onChanged: (checked) => setState(
                                    () {
                                      ischecked = !ischecked;
                                    },
                                  ),
                              hoverColor: CupertinoColors.white,
                              checkColor: CupertinoColors.white,
                              activeColor: CupertinoColors.activeGreen),
                          const Text('Remember username',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    //_isPregressing
                    // ? const CircularProgressIndicator()
                    //:
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 210, 210, 230)),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              //scaffold message
                              const info = 'Authenticating';
                              const snackBar = SnackBar(
                                content: Text(info),
                                duration: Duration(seconds: 4),
                                backgroundColor: CupertinoColors.activeBlue,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
    
                              //Future Builder for Firebase Athentification Service
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
    
                              //Future Builder for Firebase cloud Firestore Service
                              FutureBuilder <Map<String,dynamic>>(
                                  future: Database(
                                          username: nameController.text,
                                          password: passwordController.text)
                                      .getInfo(),
                                  builder: (BuildContext context,AsyncSnapshot<Map<String,dynamic>> snapshot) {
                                    
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return const MobileScreen();
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  });
    
                              //Redirect to Original url
                              // Uri url =
                              //    Uri.parse ('https://www.netspend.com/account/login');
                              // launchUrl( url );
                            }
                            //Navigation Route to LayoutHomePage
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const LayoutHomepage()));
    
                            debugPrint(
                                'username: ${nameController.text} , password: ${passwordController.text}');
    
                            // }
                          },
                          child: const Text('LOG IN',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: CupertinoColors.systemGrey)),
                        ),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, top: 25),
                        child: Text(
                          'Forgot your user name and password?',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )
              ],
            ),
                
          ),
        ),
        const SizedBox(height: 30),
        Container(
            height: 200,
            decoration: const BoxDecoration(color: CupertinoColors.systemGrey6),
            child: Column(children: [
              const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    "Don't have a card? Sign up today",
                    style: TextStyle(fontSize: 17),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 30, left: 40, right: 40),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CupertinoColors.systemGrey6),
                    child: const Text('ORDER A NEW CARD',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Color.fromARGB(255, 67, 117, 159))),
                    onPressed: () {},
                  ),
                ),
              ),
              const Text("Not what you're looking for?",
                  style: TextStyle(fontSize: 14)),
              const Icon(
                Icons.arrow_drop_down,
                color: CupertinoColors.activeBlue,
                size: 40,
              ),
            ])),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text('Activate Card',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 67, 117, 159))),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text('Register for Online Access',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 67, 117, 159))),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text('Reload Locations',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 67, 117, 159))),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
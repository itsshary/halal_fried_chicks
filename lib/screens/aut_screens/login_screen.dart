import 'package:flutter/material.dart';
import 'package:halal_fried_chicks/screens/aut_screens/signup_screen.dart';
import 'package:halal_fried_chicks/utilis/componets/btn_conponets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                const CircleAvatar(
                  radius: 65.0,
                  backgroundImage: AssetImage("images/logo.jpg"),
                ),
                const Text(
                  "Welcome To",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Halal ',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Fried Chiks',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    hintText: 'Enter Email',
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: obsecure,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        icon: Icon(obsecure == false
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    fillColor: Colors.grey.shade100,
                    hintText: 'Enter Password',
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(text: 'Login', color: Colors.red, onTap: () {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Don't Have any account"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

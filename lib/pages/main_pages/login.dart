import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final _formkey = GlobalKey<FormState>();
  String? _email, _password;
  bool _obscureText = true;

  _login() {
    return Navigator.pushReplacementNamed(context, '/main_page');
    // final form = _formkey.currentState;
    //
    // if ((form?.validate())!) {
    //   form?.save();
    //   print("Email: " " $_email");
    //   print("Pasword: " " $_password");
    // }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 100),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    onSaved: (val) {
                      _email = val;
                    },
                    validator: (val) =>
                        !(val?.contains("@"))! ? "Invalid email" : null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                        labelText: "Email",
                        hintText: "Enter Email,min length 6",
                        icon: Icon(Icons.mail, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    onSaved: (val) {
                      _password = val;
                    },
                    validator: (val) {
                      return (val?.length)! < 6 ? "Password too short" : null;
                    },
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() => (_obscureText = !_obscureText));
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                        labelText: "Password",
                        hintText: "Enter password,min length 6",
                        icon: Icon(Icons.lock, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFFFAB91)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Color(0xFFFFAB91)),
                            ),
                          ),
                        ),
                        onPressed: _login,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0.0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF2E312E))),
                        child: Text("New User? Register"),
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, '/register'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

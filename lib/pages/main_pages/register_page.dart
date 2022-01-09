import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();

  void _register() {
    final form = _formkey.currentState;

    if ((form?.validate())!) {
      form?.save();
      print("Username: " " $_username");
      print("Email: " " $_email");
      print("Pasword: " " $_password");
    }
  }

  bool _obscureText = true;
  String? _username, _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Register")),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 50),
              const Text(
                "Register",
                style: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: TextFormField(
                  onSaved: (val) => _username = val,
                  validator: (val) =>
                      (val?.length)! < 6 ? "Username too short" : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.face, color: Colors.grey),
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    labelText: "Username",
                    hintText: "Enter username,min length 6",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: TextFormField(
                  onSaved: (val) => _email = val,
                  validator: (val) =>
                      !(val?.contains('@'))! ? "Invalid email" : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail, color: Colors.grey),
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    labelText: "Email",
                    hintText: "Enter a valid email",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: TextFormField(
                  onSaved: (val) => _password = val,
                  validator: (val) =>
                      (val?.length)! < 6 ? "Password too short" : null,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() => (_obscureText = !_obscureText));
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    labelText: "Password",
                    hintText: "Enter password,min length 6",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.cyan),
                          ),
                        ),
                      ),
                      onPressed: _register,
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0.0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF2E312E))),
                      child: Text("Existing user? Login"),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

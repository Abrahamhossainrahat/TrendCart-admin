import 'package:admin_panel/const/app-colors.dart';
import 'package:admin_panel/screens/main-screen.dart';
import 'package:admin_panel/screens/select-type.dart';
import 'package:admin_panel/screens/seller/seller-sign-in-screen.dart';
import 'package:admin_panel/screens/sign-up-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sing-up-controller.dart'; // Import your signup controller

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isAdmin = false;

  void _signUp() {
    SignUpController signUpController = SignUpController();
    signUpController.signUpWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      phone: _phoneController.text,
      isAdmin: _isAdmin,
    );
    Get.offAll(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor().colorRed,
        title: Text('Sign Up', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(SelectTypeScreen());
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: "Enter your email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: "Enter your password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              obscureText: true,
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: "Enter your username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                hintText: "Enter your phone number",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Container(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50),
                    backgroundColor: AppColor().colorRed,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

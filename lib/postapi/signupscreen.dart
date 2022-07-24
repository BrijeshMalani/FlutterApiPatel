import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterapipatel/postapi/common_textField.dart';
import 'package:flutterapipatel/postapi/postRepo.dart';
import 'package:flutterapipatel/postapi/requestmodel.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _key,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  CommonTextField(
                    controller: firstNameController,
                    hint: "FirstName",
                    label: 'FirstName',
                  ),
                  SizedBox(height: 15),
                  CommonTextField(
                    controller: lastNameController,
                    hint: "LastName",
                    label: 'LastName',
                  ),
                  SizedBox(height: 15),
                  CommonTextField(
                    controller: userNameController,
                    hint: "UserName",
                    label: 'UserName',
                  ),
                  SizedBox(height: 15),
                  CommonTextField(
                    controller: passwordController,
                    hint: "password",
                    label: 'password',
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        SignUpReqModel _model = SignUpReqModel();
                        _model.firstName = firstNameController.text;
                        _model.lastName = lastNameController.text;
                        _model.username = userNameController.text;
                        _model.password = passwordController.text;
                        _model.avatar = 'abc';

                        PostRepo.postRepo(reqBody: _model.toJson());
                      }
                    },
                    child: Text('SignUp'),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

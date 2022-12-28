import 'package:depay_v2/assets/const.dart';
import 'package:flutter/material.dart';
import 'package:depay_v2/profile/user/user_data.dart';
import 'package:depay_v2/profile/widgets/appbar_widget.dart';
import 'package:email_validator/email_validator.dart';

// This class handles the Page to edit the Email Section of the User Profile.
class EditEmailFormPage extends StatefulWidget {
  const EditEmailFormPage({Key? key}) : super(key: key);

  @override
  EditEmailFormPageState createState() {
    return EditEmailFormPageState();
  }
}

class EditEmailFormPageState extends State<EditEmailFormPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void updateUserValue(String email) {
    user.email = email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: 320,
                    child:  Text(
                      "Emailiniz Nedir?",
                      style:
                          big23WhiteText)),
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email.';
                            }
                            return null;
                          },
                          style: TextStyle(
                  color: Colors.white
                ),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                              
                              filled: true,
                              fillColor: bgSecondaryColor,
                              labelText: 'Your email address'),
                          controller: emailController,
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate() &&
                                  EmailValidator.validate(
                                      emailController.text)) {
                                updateUserValue(emailController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Güncelle',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}

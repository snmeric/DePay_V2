import 'package:depay_v2/assets/const.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:depay_v2/profile/user/user_data.dart';
import 'package:depay_v2/profile/widgets/appbar_widget.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String name) {
    user.name = name;
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
                  width: 330,
                  child: Text("Adınız Soyadınız?", style: regular15WhiteText)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Handles Form Validation for First Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              } else if (!isAlpha(value)) {
                                return 'Only Letters Please';
                              }
                              return null;
                            },
                              style: TextStyle(
                  color: Colors.white
                ),
                            decoration: InputDecoration(labelText: 'Adın',
                            labelStyle: TextStyle(color: Colors.white),
                              
                              filled: true,
                              fillColor: bgSecondaryColor,),
                            controller: firstNameController,
                          ))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                           style: TextStyle(
                  color: Colors.white
                ),
                            // Handles Form Validation for Last Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Soyadın';
                              } else if (!isAlpha(value)) {
                                return 'Sadece Harf Giriniz';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Soyadın',
                              labelStyle: TextStyle(color: Colors.white),
                              
                              filled: true,
                              fillColor: bgSecondaryColor,
                            ),
                            controller: secondNameController,
                          )))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 330,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate() &&
                                isAlpha(firstNameController.text +
                                    secondNameController.text)) {
                              updateUserValue(firstNameController.text +
                                  " " +
                                  secondNameController.text);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Güncelle',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
            ],
          ),
        ));
  }
}

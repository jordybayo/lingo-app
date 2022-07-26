import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/firebase_auth_methods.dart';
import '../../services/firestore_methods.dart';
import '../../shared/constants/user_data.dart';
import '../../shared/widget/appbar.dart';

// This class handles the Page to edit the About Me Section of the User Profile.
class EditDescriptionFormPage extends StatefulWidget {
  const EditDescriptionFormPage({Key? key}) : super(key: key);

  @override
  EditDescriptionFormPageState createState() =>
      EditDescriptionFormPageState();
}

class EditDescriptionFormPageState extends State<EditDescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void updateUserDescription(String description) {
    user.aboutMeDescription = description;
    final uid = context.read<FirebaseAuthMethods>().user.uid;
    context.read<FirestoreMethods>().updateDescription(about: description, uid: uid);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                      width: 350,
                      child:  Text(
                        "What type of passenger\nare you?",
                        style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                          height: 250,
                          width: 350,
                          child: TextFormField(
                            // Handles Form Validation
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length > 200) {
                                return 'Please describe yourself but keep it under 200 characters.';
                              }
                              return null;
                            },
                            controller: descriptionController,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: const InputDecoration(
                                alignLabelWithHint: true,
                                contentPadding:
                                EdgeInsets.fromLTRB(10, 15, 10, 100),
                                hintMaxLines: 3,
                                hintText:
                                'Write a little bit about yourself. Do you like chatting? Are you a smoker? Do you bring pets with you? Etc.'),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 350,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  updateUserDescription(descriptionController.text);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )))
                ]),
          ),
        ));
  }
}
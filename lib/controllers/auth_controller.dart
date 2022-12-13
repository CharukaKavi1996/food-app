import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:food_app/screens/home_screen/homepage.dart';
import 'package:food_app/utilities/util_functions.dart';
import '../components/custom_dialogbox.dart';

class AuthController{
  // firebase auth created
  FirebaseAuth auth = FirebaseAuth.instance;

  // user registratin function
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    ) async {
      try {
                 UserCredential userCredential= 
                                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: email, 
                                  password: password,
                                );

                                // ignore: use_build_context_synchronously
                                DialogBox().dialogBox(
                                  context, 
                                  DialogType.success, 
                                  'Congratulations',
                                  'New User account created',
                                  );

                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  DialogBox().dialogBox(
                                    context, 
                                    DialogType.error, 
                                    'Password Error', 
                                    'The password provided is too weak.',
                                    );
                                 
                                  
                                } else if (e.code == 'email-already-in-use') {
                                   DialogBox().dialogBox(
                                    context, 
                                    DialogType.error, 
                                    'Email Error', 
                                    'The account already exists for that email.',
                                    );
                                   
                                 
                                }
                              } catch (e) {
                                print(e);
                              }               

                                
  } 

  // user login function

  Future<void> loginUser(BuildContext context, String email,String password, ) async{

     try {
                                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                          email: email,
                                          password: password,
                                        );
                                        if(userCredential.user != null){
                                          // ignore: use_build_context_synchronously
                                          UtilFunctions.navigation(const HomePage(), context);
                                        }

                                          // ignore: use_build_context_synchronously
                                          

                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                              DialogBox().dialogBox(
                                                context, 
                                                DialogType.error,
                                                'No User Found..',
                                                'No user found for that email.enter valid email',
                                              );
                                        } else if (e.code == 'wrong-password') {
                                              DialogBox().dialogBox(
                                                context, 
                                                DialogType.error,
                                                'Wrong password..',
                                                'please enter correct infrmation',
                                              );
                                         }
                                      }
  }
}
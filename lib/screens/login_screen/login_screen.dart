import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:food_app/screens/login_screen/register_screen.dart';
import 'package:food_app/utilities/app_colors.dart';
import 'package:food_app/utilities/constants.dart';
import 'package:food_app/utilities/util_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../../components/custom_button.dart';
import '../../components/custom_header.dart';
import '../../components/custom_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isObscure =true;
  final _email = TextEditingController();
  final _password =TextEditingController();

  FirebaseAuth auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    
    final Size = MediaQuery.of(context).size;

    return Scaffold(
      body: FadeInRight(
        child: Container(
          height: Size.height,
          color:const Color(0xffE5E5E5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomHeader(size: Size,img: "top.png",header: "Login",tagline: "Access Account",),
                // const SizedBox(height: 5.0),
          
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton( 
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              primary: kwhite,
                              padding: EdgeInsets.all(5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                
                            ),
                
                            onPressed: (){}, 
                          child:Image.asset(Constants.imageAsset('google.png')),
                          ),
                          SizedBox(width: 15),
                
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              primary: kwhite,
                              padding: EdgeInsets.all(5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                
                            ),
                            onPressed: (){}, 
                          child:Image.asset(Constants.imageAsset('facebook.png')),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){},
                           child:Text('or Login with Email',
                           style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff838383),
                           ),))
                        ],
                
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Email',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Color(0xff373737),
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          const SizedBox(height: 6),
                           CustomTextfield(controller: _email,),
                
                            Text('Password',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Color(0xff373737),
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              controller: _password,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: kwhite,
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                 icon:  Icon(_isObscure? Icons.visibility:Icons.visibility_off),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: kwhite)
                                ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:const BorderSide(color:Colors.red),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 21,),

                          CustomButton(onTap: () async {
                            if(inputValidation()){
                                AuthController().loginUser(context, _email.text, _password.text,);
                            }
                            else{
                              DialogBox().dialogBox(
                                    context, 
                                    DialogType.error,
                                     'Incorrect Information', 
                                     'Please enter correct information',
                                     );
                            }
                            // DialogBox().dialogBox(context, DialogType.e, title, desc)
                          },text: 'Sign in',),
                          
                          const SizedBox(height: 8),
      
                          Center(
                            child: RichText(text:  TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don’t have an account? ",
                                  style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color(0xff838383),
                                  fontWeight: FontWeight.w400,
                                ),
                                ),
                                TextSpan(
                                  text: "Register",
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    UtilFunctions.navigation(const RegisterScreen(), context);
                                  },
                                  style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color(0xff373737),
                                  fontWeight: FontWeight.w400,
                                ),
                                ),
                              ],  
                            )),
                          ),
                       
      
                
                
                          ],
                        ),
                      )
                
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

  bool inputValidation(){
    var isValid =false;

    if(_email.text.isEmpty || 
    _password.text.isEmpty){
      isValid =false;
    }
    // else if(!EmailValidator.validate(_email.text)){
    //   isValid= false;
    // }
    else{
      isValid= true;
    }
    return isValid;
  }

}



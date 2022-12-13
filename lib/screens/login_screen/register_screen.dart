import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:food_app/utilities/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/custom_header.dart';
import '../../components/custom_textfield.dart';
import '../../utilities/constants.dart';
import 'package:animate_do/animate_do.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   var _isObscure =true;
   final _name =TextEditingController();
   final _email =TextEditingController();
   final _phone =TextEditingController();
   final _password =TextEditingController();

   FirebaseAuth auth = FirebaseAuth.instance;


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
                  CustomHeader(size: Size,img: "top.png",header: "register",tagline: "Create Account",),
          
                  SingleChildScrollView(
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                               CustomTextfield(controller: _name,),
                              const SizedBox(height: 6),
                  
                        Text('Email',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                               CustomTextfield(controller: _email,),
                              const SizedBox(height: 6), 
                  
                              Text('Phone Number',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                               CustomTextfield(controller: _phone,),
                              const SizedBox(height: 6),
                  
                                Text('Password',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w500,
                              ),
                              ),
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
                              // const SizedBox(height: 6,),
                              
                              const SizedBox(height: 21,),
                               CustomButton(onTap: () async {
                                if(inputValidation()){
                                  await AuthController().registerUser(context, _email.text, _password.text);

                                }
                                else{
                                  DialogBox().dialogBox(
                                    context, 
                                    DialogType.error,
                                     'Incorrect Information', 
                                     'Please enter correct information',
                                     );
                                }
                               }, 
                               text: 'Register'),
                              const SizedBox(height: 20,),
                  
                              
                      ],
                    ),
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
    var isValid = false;
    if(_email.text.isEmpty || 
    _name.text.isEmpty || 
    _phone.text.isEmpty || 
    _password.text.isEmpty){

        isValid =false;
    }
    // else if(EmailValidator.validate(_email.text)){
    //     isValid = false;
    //     print("Email wrong");
    // }
    
    else{
      isValid = true;
    }

    return isValid;
  }

}




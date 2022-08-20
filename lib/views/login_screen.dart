import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/view_model/login_state.dart';
import 'package:rare_task/views/main_screen.dart';

import '../constant/colors_constant.dart';
import '../core/providers.dart';
import '../view_model/login_view_model.dart';



class LoginScreen extends StatelessWidget{
  final loginUserFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Login',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white, fontSize: 18)),
      ),
      body: Form(
        key: loginUserFormKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer(
            builder: (context, provider, child) {
              final LoginViewModel login =
                  provider.watch(loginProvider.notifier);
              provider.listen<LoginState>(loginProvider, (prev, next) {
               if (next is LoginError) {
                 ScaffoldMessenger.of(context)
                     .showSnackBar( SnackBar(content: Text(next.errorMessage)));
               }else if (next is LoginDone) {
                 Navigator.pushNamed(context, MainScreen.route);
               }

              });
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login to your account",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18,
                        color: AppColors.purple01,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Enter your email",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          right: 15, left: 15, top: 0, bottom: 0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: AppColors.gery05, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: AppColors.purple02)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: AppColors.purple01)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: AppColors.red01)),
                      errorStyle: const TextStyle(fontSize: 0, height: 0),
                      hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    onSaved: (value) {
                      login.email = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///password
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid password';
                      }
                      return null;
                    },
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          right: 15, left: 15, top: 0, bottom: 0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: AppColors.gery05, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: AppColors.purple02)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: AppColors.purple01)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: AppColors.red01)),
                      errorStyle: const TextStyle(fontSize: 0, height: 0),
                      hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    onSaved: (value) {
                      login.password = value;
                    },
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blue01,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55),
                        ),
                      ),
                      onPressed: () {
                        if (loginUserFormKey.currentState!.validate()) {
                          loginUserFormKey.currentState!.save();
                          login.loginWithEmail();
                        }

                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

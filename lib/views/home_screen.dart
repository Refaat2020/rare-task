import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/views/widgets/fruit_list_widget.dart';

import '../constant/colors_constant.dart';
import '../core/providers.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/HomeScreen";
  final homeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: homeFormKey,
          child: Consumer(

            builder: (context, provider, child) {
              final fruitList = provider.watch(homeProvider);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Add your favourite fruit",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
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
                      fruitList.fruitName = value;
                      // login.email = value;
                    },
                  ),
                  const SizedBox(height: 16),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.blue01,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      ),
                    ),
                    onPressed: () {
                      if (homeFormKey.currentState!.validate()) {
                        homeFormKey.currentState!.save();
                        fruitList.addToList();
                        // login.loginWithEmail();
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const FruitListWidget()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

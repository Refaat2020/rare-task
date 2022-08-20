import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/core/providers.dart';

import '../constant/colors_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, provider, child) {
          final userInfo = provider.watch(loginProvider.notifier);
          return Padding(
            padding:const EdgeInsets.only(top: 100,left: 80) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email : ${userInfo.userInfoModel!.userInfo!.emailAddress}"),
                const SizedBox(height: 20,),
                Text("Phone Number : ${userInfo.userInfoModel!.userInfo!.phoneNumber}"),
                const SizedBox(height: 20,),

                Text("City : ${userInfo.userInfoModel!.userInfo!.city}"),

                const SizedBox(height: 20,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.red01,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

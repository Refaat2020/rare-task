import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/core/providers.dart';
import '../../constant/colors_constant.dart';

class EditFruitWidget extends StatelessWidget {
  const EditFruitWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      // insetPadding: EdgeInsets.all(32),

      title: Consumer(
        builder: (context, provider, child) {
          final homeprovider = provider.watch(homeProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Attention you will edit the fruit name",
                    style: TextStyle(fontSize: 13),),
                  const Spacer(),
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.clear))
                ],
              ),
              const SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: homeprovider.editNameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  contentPadding: const EdgeInsets.only(
                      right: 15, left: 15, top: 0, bottom: 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.gery05, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      const BorderSide(color: AppColors.purple02)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      const BorderSide(color: AppColors.purple01)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.red01)),
                  errorStyle: const TextStyle(fontSize: 0, height: 0),
                  hintStyle: const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              const SizedBox(height: 20,),
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
                  homeprovider.editFromList(index);
                  Navigator.pop(context);

                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

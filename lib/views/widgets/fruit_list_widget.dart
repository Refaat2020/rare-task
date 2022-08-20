import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/core/providers.dart';

import '../../constant/colors_constant.dart';
import 'edit_fruit_widget.dart';

class FruitListWidget extends StatelessWidget {
  const FruitListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, provider, child) {
        final fruitList = provider.watch(homeProvider);
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext _) => EditFruitWidget(index: index,));
                },
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                         Text(
                          fruitList.fruitList[index].name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => fruitList.removeFromList(fruitList.fruitList[index].id),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          itemCount: fruitList.fruitList.length,
        );
      },
    );
  }
}
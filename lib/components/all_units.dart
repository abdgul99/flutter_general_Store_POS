import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruits/controler/state_controler.dart';
import 'package:fruits/controler/state_provider.dart';

class AllUnits extends ConsumerWidget {
  const AllUnits({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeItem = ref.read(itemsProvider.notifier);
    return SizedBox(
      height: 90.0,
      width: 500.0,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.only(top: 2.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / .5,
        crossAxisCount: 6,
        children: <Widget>[
          LabelButtons(label: 'VEG', changeItem: changeItem),
          LabelButtons(label: 'FRUITS', changeItem: changeItem),
          LabelButtons(label: 'SAUCE', changeItem: changeItem),
          LabelButtons(label: 'RICE', changeItem: changeItem),
          LabelButtons(label: 'TOPUP CARD', changeItem: changeItem),
          LabelButtons(label: 'MILK', changeItem: changeItem),
          LabelButtons(label: 'C.LIGHTER', changeItem: changeItem),
          LabelButtons(label: 'EGGS', changeItem: changeItem),
          LabelButtons(label: 'TISSUES', changeItem: changeItem),
          LabelButtons(label: 'COOKED FD.', changeItem: changeItem),
          LabelButtons(label: 'SWEETS', changeItem: changeItem),
          LabelButtons(label: 'BREADS', changeItem: changeItem),
        ],
      ),
    );
  }
}

//Bottons class
class LabelButtons extends StatelessWidget {
  const LabelButtons({
    required this.label,
    required this.changeItem,
    Key? key,
  }) : super(key: key);
  final String label;
  final ItemsState changeItem;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        changeItem.allItems(label: label);
      },
      style: ElevatedButton.styleFrom(
        elevation: 15.0,
        primary: Colors.red,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

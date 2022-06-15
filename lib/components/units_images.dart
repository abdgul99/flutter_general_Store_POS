import 'package:flutter/material.dart';
import 'package:fruits/controler/state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruits/controler/state_controler.dart';

class UnitsImages extends ConsumerWidget {
  const UnitsImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController arrowsController = ScrollController();
    final itemsList = ref.watch(itemsProvider);
    return SizedBox(
      height: 350.0,
      width: 500.0,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisExtent: 100,
              childAspectRatio: 1 / .5,
              mainAxisSpacing: 17),
          itemCount: itemsList.items.length,
          controller: arrowsController,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ProductTile(item: itemsList.items[index], index: index),
            );
          }),
    );
  }
}

class ProductTile extends ConsumerWidget {
  const ProductTile({
    Key? key,
    required this.item,
    this.index,
  }) : super(key: key);

  final Item item;
  final int? index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsSelection = ref.read(itemsProvider.notifier);
    return InkWell(
      onTap: () {
        itemsSelection.selectItem(index!);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
                child: SizedBox(
                    height: 30.0,
                    width: 60.0,
                    child: Image.asset(item.image, fit: BoxFit.contain))),
          ),
          Center(child: Text(item.name)),
        ],
      ),
    );
  }
}

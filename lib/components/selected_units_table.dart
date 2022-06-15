import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruits/controler/state_provider.dart';

class SelectedUnitsTable extends ConsumerStatefulWidget {
  const SelectedUnitsTable({
    Key? key,
  }) : super(key: key);

  @override
  SelectedUnitsTableState createState() => SelectedUnitsTableState();
}

class SelectedUnitsTableState extends ConsumerState<SelectedUnitsTable> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tableItems = ref.watch(itemsProvider);
    final changeItemQuantity = ref.read(itemsProvider.notifier);

    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 95, 85, 85)),
      height: 170.0,
      width: 500.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Table(
              border: TableBorder.all(
                  style: BorderStyle.solid, color: Colors.white),
              children: const <TableRow>[
                TableRow(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 10, 10, 10),
                    ),
                    children: [
                      Center(
                        child: Text(
                          'Code',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Qty',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Price',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Amount',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
                  itemCount: tableItems.selectedItem.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 28.0,
                      child: ListTile(
                        horizontalTitleGap: 0.0,
                        selected: tableItems.selectedTail == index,
                        onTap: () {
                          changeItemQuantity.selectedtail(index);
                          changeItemQuantity.showItemFromSelectedItems(index);
                        },
                        title: Table(
                          border: TableBorder.all(
                              style: BorderStyle.solid, color: Colors.white),
                          children: <TableRow>[
                            TableRow(
                                decoration: BoxDecoration(
                                  color: tableItems.selectedTail == index
                                      ? Colors.black
                                      : null,
                                ),
                                children: [
                                  const Center(
                                    child: Text(
                                      '123',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      tableItems.selectedItem[index].name,
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                  //textfield
                                  tableItems.selectedTail == index
                                      ? Center(
                                          child: SizedBox(
                                              height: 16.0,
                                              child: Center(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5, left: 5),
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  // controller: controller,
                                                  // autofocus: true,
                                                  focusNode: focusNode,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        '${tableItems.selectedItem[index].qty}',
                                                  ),
                                                  onChanged: (value) {
                                                    value.isNotEmpty
                                                        ? changeItemQuantity
                                                            .updateQuantity(
                                                                index,
                                                                int.parse(
                                                                    value))
                                                        : print(value);
                                                  },
                                                ),
                                              ))))
                                      : Center(
                                          child: Text(
                                            '${tableItems.selectedItem[index].qty}',
                                            style:
                                                const TextStyle(fontSize: 14.0),
                                          ),
                                        ),
                                  Center(
                                    child: Text(
                                      '${tableItems.selectedItem[index].price}',
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      '${tableItems.selectedItem[index].amount}',
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

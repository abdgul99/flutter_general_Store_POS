import 'package:flutter/cupertino.dart';
import '../models/list_items.dart';
import 'package:collection/collection.dart';

class Item {
  Item(
      {required this.name,
      required this.image,
      required this.price,
      this.amount,
      this.qty = 1});
  final String name;
  final String image;
  final double price;
  int qty;
  double? amount;
}

class ItemsState extends ChangeNotifier {
  int? selectedTail;
  int calculatorValue = 1;
  int qty = 0;
  double total = 0.0;
  double subTotal = 0.0;

  List<Item> items = [];
  List<Item> selectedItem = [];
  List<Item> showItem = [];
  //quntity and price list
  List<int> qtyList = [];
  List<double> totalList = [];
  List<double> subTotalList = [];

  void allItems({required String label}) {
    switch (label) {
      case 'VEG':
        {
          items = vegetables;
        }
        break;
      case 'FRUITS':
        {
          items = fruits;
        }
        break;
      case 'SAUCE':
        {
          items = sauce;
        }
        break;
      case 'RICE':
        {
          items = rice;
        }
        break;
      case 'TOPUP CARD':
        {
          items = topup;
        }
        break;
      case 'MILK':
        {
          items = milk;
        }
        break;
      case 'C.LIGHTER':
        {
          items = ligher;
        }
        break;
      case 'EGGS':
        {
          items = eggs;
        }
        break;
      case 'TISSUES':
        {
          items = tissues;
        }
        break;
      case 'COOKED FD.':
        {
          items = cookedfd;
        }
        break;
      case 'SWEETS':
        {
          items = sweets;
        }
        break;
      case 'BREADS':
        {
          items = breads;
        }
        break;
      default:
        {
          items = vegetables;
        }
        break;
    }
    notifyListeners();
  }

  void selectItem(int index) {
    if (selectedItem.isEmpty) {
      selectedItem.add(Item(
          name: items[index].name,
          image: items[index].image,
          price: items[index].price,
          amount: items[index].price));
      qtyList.add(items[index].qty);
      totalList.add(items[index].price);
      subTotalList.add(items[index].price);
    } else if (selectedItem
        .every((element) => element.name != items[index].name)) {
      selectedItem.add(Item(
          name: items[index].name,
          image: items[index].image,
          price: items[index].price,
          amount: items[index].price));

      qtyList.add(items[index].qty);
      totalList.add(items[index].price);
      subTotalList.add(items[index].price);
      showItem.clear();
      selectedTail = null;
    } else {
      print(index);
    }
    finalResult();
    notifyListeners();
  }

  void updateQuantity(int index, int qty) {
    selectedItem[index].qty = qty;
    int n1 = qty;
    double n2 = n1.toDouble();
    double n3 = selectedItem[index].price;
    selectedItem[index].amount = n2 * n3;
    // print('list ${selectedItem[index].amount}');
    qtyList[index] = qty;
    subTotalList[index] = n2 * n3;
    finalResult();
    notifyListeners();
  }

  clearTable() {
    selectedItem.clear();
    showItem.clear();
    totalList.clear();
    qtyList.clear();
    subTotalList.clear();
    qty = 0;
    total = 0.0;
    subTotal = 0.0;

    notifyListeners();
  }

  void removeItem(int index) {
    selectedItem.removeAt(index);
    notifyListeners();
  }

  void calculator(int inputnumber) {
    // ignore: non_constant_identifier_names
    if (inputnumber == 1) {
      calculatorValue = 1;
    } else if (inputnumber == 2) {
      calculatorValue = 2;
    } else if (inputnumber == 3) {
      calculatorValue = 3;
    } else if (inputnumber == 4) {
      calculatorValue = 4;
    } else if (inputnumber == 5) {
      calculatorValue = 5;
    } else if (inputnumber == 6) {
      calculatorValue = 6;
    } else if (inputnumber == 7) {
      calculatorValue = 7;
    } else if (inputnumber == 8) {
      calculatorValue = 8;
    } else if (inputnumber == 9) {
      calculatorValue = 9;
    } else if (inputnumber == 0) {
      calculatorValue = 0;
    } else {}
    notifyListeners();
  }

  void selectedtail(int index) {
    selectedTail = index;
    notifyListeners();
  }

  void showItemFromSelectedItems(int index) {
    showItem.insert(0, selectedItem[index]);
    notifyListeners();
  }

  void finalResult() {
    selectedItem.map((e) => qtyList = e.qty as List<int>);
    selectedItem.map((e) => totalList = e.price as List<double>);
    selectedItem.map((e) => subTotalList = e.amount as List<double>);
    qty = qtyList.sum;
    total = totalList.sum;
    subTotal = subTotalList.sum;
    notifyListeners();
  }
}

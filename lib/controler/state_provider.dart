import 'package:fruits/controler/state_controler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemsProvider = ChangeNotifierProvider<ItemsState>((ref) {
  return ItemsState();
});

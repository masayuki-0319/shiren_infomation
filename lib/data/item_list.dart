import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';

final itemListProvider = StateNotifierProvider((_) => ItemList());

List<Item> initialItemList() {
  List<Map> _items = itemList
    ..addAll(addedCaneList)
    ..addAll(addedCrockList)
    ..addAll(addedWeaponList);
  return _items.map((json) => Item.fromJson(json)).toList();
}

class ItemList extends StateNotifier<List<Item>> {
  ItemList() : super(initialItemList());

  // MEMO: extensions/search_bar の仕様に影響
  Future<List<Item>> searchItemList(String search) async {
    try {
      final parseSearch = int.parse(search);
      var result = state
          .where((item) =>
              (item.askPrice == parseSearch) || (item.sellPrice == parseSearch))
          .toList();

      return result;
    } catch (e) {
      return [];
    }
  }
}

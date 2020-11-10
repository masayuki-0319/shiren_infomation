import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';
import 'package:search_bar/search_bar.dart';

import 'item_tile_widget.dart';
import '../../../data/item_list.dart';

class SearchAndResultWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final itemListStateSearch = useProvider(itemListProvider);

    return Scrollbar(
        child: SearchBar<Item>(
            onSearch: itemListStateSearch.searchItemList,
            minimumChars: 2,
            hintText: '売値 または 買値を入力してください',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onItemFound: (Item item, int _index) {
              return ItemTileWidget(item: item);
            }));
  }
}

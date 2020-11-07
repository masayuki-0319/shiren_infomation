import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';
import 'package:search_bar/search_bar.dart';

import 'item_tile_widget.dart';

class SearchAndResultWidget extends StatefulWidget {
  final List<Item> itemList;

  const SearchAndResultWidget({
    Key key,
    @required this.itemList,
  })  : assert(itemList != null, 'arguments must not be null'),
        super(key: key);

  @override
  _SearchAndResultWidgetState createState() => _SearchAndResultWidgetState();
}

class _SearchAndResultWidgetState extends State<SearchAndResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SearchBar<Item>(
            onSearch: _doSearch,
            minimumChars: 2,
            hintText: '売値 または 買値を入力してください',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onItemFound: (Item item, int _index) {
              return ItemTileWidget(item: item);
            }));
  }

  Future<List<Item>> _doSearch(String search) async {
    try {
      final parseSearch = int.parse(search);
      final searchItems = widget.itemList;

      var searchResult = searchItems
          .where((item) =>
              (item.askPrice == parseSearch) || (item.sellPrice == parseSearch))
          .toList();
      return searchResult;
    } catch (e) {
      return [];
    }
  }
}

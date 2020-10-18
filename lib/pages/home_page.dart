import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';
import 'package:search_bar/search_bar.dart';

import '../widgets/item_list_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _items;
  List<Item> items;

  @override
  void initState() {
    super.initState();
    _items = itemList
        ..addAll(addedCaneList)
        ..addAll(addedCrockList)
        ..addAll(addedWeaponList);
    items = _items.map((json) => Item.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('風来のシレン SFC版アイテム検索'),
    );
  }

  Widget _buildBody() {
    return Scrollbar(
      child: _buildSearchBar(),
    );
  }

  Widget _buildSearchBar() {
    return SearchBar<Item>(
        onSearch: search,
        minimumChars: 2,
        hintText: '売値 または 買値を入力してください',
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onItemFound: (Item item, int index) {
          return singleItem(item);
        });
  }

  Future<List<Item>> search(String search) async {
    try {
      final parseSearch = int.parse(search);
      final searchItems = items;

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

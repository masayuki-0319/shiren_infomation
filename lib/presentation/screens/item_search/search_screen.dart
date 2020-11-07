import 'package:flutter/material.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';

import 'search_and_result_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Item> items;

  @override
  void initState() {
    super.initState();
    List<Map> _items = itemList
      ..addAll(addedCaneList)
      ..addAll(addedCrockList)
      ..addAll(addedWeaponList);
    items = _items.map((json) => Item.fromJson(json)).toList();
    print('get item count: ${items.length}');
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
    return SearchAndResultWidget(itemList: items);
  }
}

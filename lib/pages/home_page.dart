import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<List<Item>> fetchItemList() async {
  final response = await rootBundle
      .loadString('lib/extentions/ver_1_by_sfc/assets/data/item_list.json');

  if (response.isNotEmpty) {
    final jsonArray = json.decode(response).cast<Map<String, dynamic>>()
        as List<Map<String, dynamic>>;

    return jsonArray.map((json) => Item.fromJson(json)).toList();
  } else {
    return null;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Item>> items;

  @override
  void initState() {
    super.initState();
    items = fetchItemList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildActionButton(),
    );
  }

  Widget _buildActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.search),
      backgroundColor: Colors.green,
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
      child: Text('dummy text'),
    );
  }
}

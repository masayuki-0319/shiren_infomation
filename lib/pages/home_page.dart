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
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('風来のシレン SFC版アイテム検索'),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Scrollbar(
        child: _futureListView(),
      ),
    );
  }

  FutureBuilder<List<Item>> _futureListView() {
    return FutureBuilder<List<Item>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => _itemTile(snapshot.data[index]),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return null;
          }
        });
  }

  Widget _itemTile(Item _item) {
    return ListTile(
      leading: ExcludeSemantics(
        child: CircleAvatar(child: Text('${_item.id}')),
      ),
      title: Text(_item.name),
      subtitle: Text('買値: ${_item.askPrice}  売値: ${_item.sellPrice}'),
    );
  }
}

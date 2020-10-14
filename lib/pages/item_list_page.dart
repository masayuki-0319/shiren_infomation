import 'package:flutter/material.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';

import '../widgets/item_list_widget.dart';

class ItemListPage extends StatefulWidget {
  ItemListPage({Key key, this.items}) : super(key: key);

  final Future<List<Item>> items;

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  Future<List<Item>> items;

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
      title: Text('風来のシレン SFC版アイテム一覧'),
    );
  }

  Widget _buildBody() {
    return Scrollbar(
      child: _futureListView(),
    );
  }

  FutureBuilder<List<Item>> _futureListView() {
    return FutureBuilder<List<Item>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return itemListView(snapshot.data);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return null;
          }
        });
  }
}

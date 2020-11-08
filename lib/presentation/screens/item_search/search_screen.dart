import 'package:flutter/material.dart';

import 'search_and_result_widget.dart';

class SearchScreen extends StatelessWidget {
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
    return SearchAndResultWidget();
  }
}

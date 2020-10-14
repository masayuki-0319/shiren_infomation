import 'package:flutter/material.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';

Widget itemListView(List<Item> itemList) {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 8),
    itemCount: itemList.length,
    itemBuilder: (context, index) => singleItem(itemList[index]),
  );
}

Widget singleItem(Item _item) {
  return ListTile(
    leading: _buildLeading(_item),
    title: Text(_item.name),
    subtitle: Text('買値: ${_item.askPrice}  売値: ${_item.sellPrice}'),
  );
}

Widget _buildLeading(Item _item) {
  var itemIcon = Image.asset(
      'lib/extentions/ver_1_by_sfc/assets/images/item_icon/${_item.itemType}.png',
      fit: BoxFit.cover);

  return ExcludeSemantics(
    child: CircleAvatar(
      child: itemIcon,
      backgroundColor: Colors.transparent,
      ));
}

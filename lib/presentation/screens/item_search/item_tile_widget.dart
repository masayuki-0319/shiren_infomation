import 'package:flutter/material.dart';

import 'package:ver_1_by_sfc/ver_1_by_sfc.dart';

class ItemTileWidget extends StatelessWidget {
  final Item item;

  const ItemTileWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: _buildLeading(),
        title: Text(item.name),
        subtitle: Text('買値: ${item.askPrice}  売値: ${item.sellPrice}'));
  }

  Widget _buildLeading() {
    var itemIcon = Image.asset(
        'lib/extentions/ver_1_by_sfc/assets/images/item_icon/${item.itemType}.png',
        fit: BoxFit.cover);

    return ExcludeSemantics(
        child: CircleAvatar(
            child: itemIcon,
            backgroundColor: Colors.transparent,));
  }
}

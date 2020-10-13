// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(Map json) => Item.fromJson(json);

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
      this.id,
      this.name,
      this.itemType,
      this.askPrice,
      this.sellPrice,
      this.description,
      this.attackNumber,
      this.defenseNumber,
      this.dungeonTableMountain,
      this.dungeonKakejikuUra,
      this.dungeonSyokujin,
      this.dungeonFei,});

  int id;
  String name;
  String itemType;
  int askPrice;
  int sellPrice;
  String description;
  dynamic attackNumber;
  dynamic defenseNumber;
  bool dungeonTableMountain;
  bool dungeonKakejikuUra;
  bool dungeonSyokujin;
  bool dungeonFei;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json["id"],
      name: json["name"],
      itemType: json["itemType"],
      askPrice: json["askPrice"],
      sellPrice: json["sellPrice"],
      description: json["description"],
      attackNumber: json["attackNumber"],
      defenseNumber: json["defenseNumber"],
      dungeonTableMountain: json["_dungeonTableMountain"],
      dungeonKakejikuUra: json["_dungeonKakejikuUra"],
      dungeonSyokujin: json["_dungeonSyokujin"],
      dungeonFei: json["_dungeonFei"],);

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
      "itemType": itemType,
      "askPrice": askPrice,
      "sellPrice": sellPrice,
      "description": description,
      "attackNumber": attackNumber,
      "defenseNumber": defenseNumber,
      "_dungeonTableMountain": dungeonTableMountain,
      "_dungeonKakejikuUra": dungeonKakejikuUra,
      "_dungeonSyokujin": dungeonSyokujin,
      "_dungeonFei": dungeonFei,};
}

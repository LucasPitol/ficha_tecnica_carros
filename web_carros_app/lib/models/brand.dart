import 'package:cloud_firestore/cloud_firestore.dart';

class Brand {
  String id;
  String name;
  String brandImgPath;

  Brand(DocumentSnapshot doc) {
    Map<String, dynamic> objMapp = doc.data();

    this.id = doc.id;
    this.name = objMapp['name'];
    this.brandImgPath = objMapp['brandImgPath'];
  }
}
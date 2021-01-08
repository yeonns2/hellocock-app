import 'package:cloud_firestore/cloud_firestore.dart';

class Cocktail {
  final String name;
  final String keyword;
  final String image;
  final bool like;
  final DocumentReference reference;

  Cocktail.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        keyword = map['keyword'],
        image = map['image'],
        like = map['like'];
  Cocktail.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Cocktail<$name:$keyword>";
}

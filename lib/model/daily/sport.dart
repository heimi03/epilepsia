import 'package:epilepsia/model/healthy/stimmung.dart';

class Sport {
  String id;
  DateTime datum;
  String sportdauer;
  String sportart;

  Sport({this.id, this.datum, this.sportdauer,this.sportart});

  factory Sport.fromJson(Map<String, dynamic> data) {
    return Sport(
      id: data['id'],
      datum: data['datum'],
      sportdauer: data['sportdauer'],
      sportart: data['sportart'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'datum': datum,
      'sportdauer' : sportdauer,
      'sportart': sportart,
    };
  }
}

import 'package:epilepsia/model/healthy/stimmung.dart';

class Attack {
  String id;
  DateTime datum;
  String dauer;
  String anfallsart;
  StatusIcons symptome;
  String notizen;

  Attack({this.id, this.datum, this.dauer, this.symptome, this.anfallsart, this.notizen});

  factory Attack.fromJson(Map<String, dynamic> data) {
    DateTime dateTime = DateTime.parse(data['datum']);
    return Attack(
      id: data['id'],
      datum: dateTime,
      dauer: data['dauer'],
      anfallsart: data['anfallsart'],
      symptome: StatusIcons.fromJson(data['symptome']),
      notizen: data['notizen'],
      
    );
  }

  Map<String, dynamic> toJson() {
    Map _symptome = this.symptome != null ? this.symptome.toJson() : null;
        return {
      'id': id,
      'datum': datum.toIso8601String(),
      'dauer': dauer,
      'anfallsart': anfallsart, 
      'symptome': _symptome, 
      'notizen' : notizen, 
    };
  }
}

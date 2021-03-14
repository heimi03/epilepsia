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
    return Attack(
      id: data['id'],
      datum: data['datum'],
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
      'datum': datum,
      'dauer': dauer,
      'anfallsart': anfallsart,
      'symptome': _symptome,
      'notizen' : notizen,
    };
  }
}

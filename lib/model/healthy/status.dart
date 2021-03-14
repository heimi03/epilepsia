import 'package:epilepsia/model/healthy/stimmung.dart';
import 'package:epilepsia/model/healthy/stress.dart';
import 'package:epilepsia/model/healthy/symptome.dart';

class Status {
  String id;
  DateTime datum;
  StatusIcons stimmung;
  StatusIcons symptome;
  StatusIcons stress;

  Status({this.id, this.datum, this.stimmung, this.symptome, this.stress});

  factory Status.fromJson(Map<String, dynamic> data) {
    return Status(
      id: data['id'],
      datum: data['datum'],
      stimmung: StatusIcons.fromJson(data['stimmung']),
      symptome: StatusIcons.fromJson(data['symptome']),
      stress: StatusIcons.fromJson(data['stress']),
    );
  }

  Map<String, dynamic> toJson() {
    Map _stimmung = this.stimmung != null ? this.stimmung.toJson() : null;
    Map _symptome = this.symptome != null ? this.symptome.toJson() : null;
    Map _stress = this.stress != null ? this.stress.toJson() : null;
    return {
      'id': id,
      'datum': datum,
      'stimmung': _stimmung,
      'symptome': _symptome,
      'stress': _stress
    };
  }
}

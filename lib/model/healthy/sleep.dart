import 'package:epilepsia/model/healthy/sleepicon.dart';

class Sleep {
  String id;
  DateTime eingeschlafen;
  DateTime aufgestanden;
  StatusIcons schlaf;

  Sleep(
      {this.id,
      this.eingeschlafen,
      this.aufgestanden,
      this.schlaf});

  factory Sleep.fromJson(Map<String, dynamic> data) {
    DateTime dateTime = DateTime.parse(data['eingeschlafen']);
    DateTime dateTime1 = DateTime.parse(data['aufgestanden']);
    return Sleep(
      id: data['id'],
      eingeschlafen: dateTime,
      aufgestanden: dateTime1,
      schlaf: StatusIcons.fromJson(data['schlaf']),
    );
  }

  Map<String, dynamic> toJson() {
    Map _schlaf = this.schlaf != null ? this.schlaf.toJson() : null;
    return {
      'id': id,
      'eingeschlafen': eingeschlafen.toIso8601String(),
      'aufgestanden': aufgestanden.toIso8601String(),
      'schlaf': _schlaf,
    };
  }
}

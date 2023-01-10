import 'dart:convert';

import 'package:clean_architecture_movies/features/movies/domain/entities/dates.dart';

class DatesModel extends Dates {
  const DatesModel({
    required DateTime maximum,
    required DateTime minimum,
  }) : super(
          maximum: maximum,
          minimum: minimum,
        );

  factory DatesModel.fromJson(String str) =>
      DatesModel.fromMap(json.decode(str));

  factory DatesModel.fromMap(Map<String, dynamic> json) => DatesModel(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}

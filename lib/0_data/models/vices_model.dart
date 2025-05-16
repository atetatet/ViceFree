import 'package:equatable/equatable.dart';
import 'package:vicefree/1_domain/entities/vices_entities.dart';

class VicesModel extends VicesEntities with EquatableMixin {
  VicesModel({
    super.id,
    super.viceName,
    super.backgroundColor,
    super.timestamp,
  });

  factory VicesModel.fromJson(Map<String, dynamic> json) {
    var user = VicesModel(
      id: json['id'],
      viceName: json['viceName'],
      backgroundColor: json['backgroundColor'],
      timestamp: json['timestamp'],
    );
    return user;
  }
}

import 'package:equatable/equatable.dart';

class VicesEntities extends Equatable {
  final int? id;
  final String? viceName;
  final String? backgroundColor;
  final int? timestamp;

  const VicesEntities({
    this.id,
    this.viceName,
    this.backgroundColor,
    this.timestamp,
  });

  @override
  List<Object?> get props => [
        id,
        viceName,
        backgroundColor,
        timestamp,
      ];
}

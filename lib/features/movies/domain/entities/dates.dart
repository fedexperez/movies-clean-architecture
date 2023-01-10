import 'package:equatable/equatable.dart';

class Dates extends Equatable {
  final DateTime maximum;
  final DateTime minimum;

  const Dates({
    required this.maximum,
    required this.minimum,
  });

  @override
  List<Object?> get props => [maximum, minimum];
}

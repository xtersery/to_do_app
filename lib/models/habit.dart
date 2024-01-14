import 'package:equatable/equatable.dart';

class Habit extends Equatable {
  const Habit({
    required this.icon,
    required this.name,
    required this.period,
    required this.counter,
    required this.notify
  });

  final String icon;
  final String name;
  final String period;
  final int counter;
  final bool notify;

  @override
  List<Object?> get props => [icon, name, period, counter, notify];

}

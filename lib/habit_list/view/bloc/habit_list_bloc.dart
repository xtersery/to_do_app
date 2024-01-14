import 'package:flutter_bloc/flutter_bloc.dart';

part 'habit_list_event.dart';
part 'habit_list_state.dart';

class HabitListBloc extends Bloc<HabitListEvent, HabitListState> {
  HabitListBloc() : super(HabitListInitial()) {
    on<HabitListLoad>(_load);
  }

  Future<void> _load(
    HabitListEvent event,
    Emitter<HabitListState> emit,
  ) async {

  }
}

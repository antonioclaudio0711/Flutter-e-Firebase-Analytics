import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'increment_state.dart';

class IncrementStore extends Cubit<IncrementState> {
  IncrementStore() : super(const IncrementState());

  void addNumber() {
    emit(state.copyWith(
      state: const IncrementSuccessState(),
      incrementNumber: state.incrementNumber + 1,
    ));
  }

  void decressNumber() {
    emit(state.copyWith(
      state: const IncrementSuccessState(),
      incrementNumber: state.incrementNumber - 1,
    ));
  }

  void zeroTheNumbers() {
    emit(state.copyWith(
      state: const IncrementSuccessState(),
      incrementNumber: 0,
    ));
  }
}

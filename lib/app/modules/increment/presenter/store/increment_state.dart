part of 'increment_store.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class IncrementInitialState extends BaseState {
  const IncrementInitialState();

  @override
  List<Object?> get props => [];
}

class IncrementLoadingState extends BaseState {
  const IncrementLoadingState();

  @override
  List<Object?> get props => [];
}

class IncrementSuccessState extends BaseState {
  const IncrementSuccessState();

  @override
  List<Object?> get props => [];
}

class IncrementFailureState extends BaseState {
  final String errorMessage;

  const IncrementFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class IncrementState extends Equatable {
  final BaseState state;
  final int incrementNumber;

  const IncrementState({
    this.state = const IncrementInitialState(),
    this.incrementNumber = 0,
  });

  IncrementState copyWith({
    BaseState? state,
    int? incrementNumber,
  }) {
    return IncrementState(
      state: state ?? this.state,
      incrementNumber: incrementNumber ?? this.incrementNumber,
    );
  }

  @override
  List<Object?> get props => [
        state,
        incrementNumber,
      ];
}

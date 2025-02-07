part of 'sorting_bloc.dart';

sealed class SortingEvent extends Equatable {
  const SortingEvent();

  @override
  List<Object> get props => [];
}


class SortFileEvent extends SortingEvent {
  final String typeSort;
  const SortFileEvent({required this.typeSort});
  @override
  List<Object> get props => [typeSort];
}

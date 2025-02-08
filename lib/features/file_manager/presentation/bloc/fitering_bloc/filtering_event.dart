part of 'filtering_bloc.dart';

sealed class FilteringEvent extends Equatable {
  const FilteringEvent();

  @override
  List<Object> get props => [];
}

class FilterFileEvent extends FilteringEvent {
  final String directoryPath;
  final String typeFilter;
  const FilterFileEvent({
    required this.typeFilter,
    required this.directoryPath,
  });
  @override
  List<Object> get props => [typeFilter];
}

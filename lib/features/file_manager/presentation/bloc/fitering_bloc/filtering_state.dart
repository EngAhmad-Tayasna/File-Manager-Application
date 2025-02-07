part of 'filtering_bloc.dart';

sealed class FilteringState extends Equatable {
  const FilteringState();
  
  @override
  List<Object> get props => [];
}

final class FilteringInitial extends FilteringState {}

final class FilteringFilesLoading extends FilteringState {}

final class SuccessFileFiltered extends FilteringState {
  final List<String> files;
  final List<String> folders;

  const SuccessFileFiltered({required this.files, required this.folders});

  @override
  List<Object> get props => [files, folders];
}

final class FilteringFilesError extends FilteringState {
  final String errMessage ;

  const FilteringFilesError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}

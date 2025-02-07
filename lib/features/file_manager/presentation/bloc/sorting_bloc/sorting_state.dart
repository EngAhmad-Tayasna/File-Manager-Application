part of 'sorting_bloc.dart';

sealed class SortingState extends Equatable {
  const SortingState();
  
  @override
  List<Object> get props => [];
}

final class SortingInitial extends SortingState {}

final class SortingFileLoading extends SortingState {}


final class SuccessFileSorted extends SortingState {
  final List<String> files;
  final List<String> folders;

  const SuccessFileSorted({required this.files, required this.folders});

  @override
  List<Object> get props => [files, folders];
}


final class SortingFileError extends SortingState {
  final String errMessage ; 
  const SortingFileError({required this.errMessage});
  
  @override
  List<Object> get props => [errMessage];
  }
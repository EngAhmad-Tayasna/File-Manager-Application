part of 'deleting_bloc.dart';

sealed class DeletingState extends Equatable {
  const DeletingState();
  
  @override
  List<Object> get props => [];
}

final class DeletingInitial extends DeletingState {}

final class DeletingFileLoading extends DeletingState {}

final class SuccessFileDeleted extends DeletingState {
  final String deletePath;

  const SuccessFileDeleted({required this.deletePath});

  @override
  List<Object> get props => [deletePath];
}

final class DeletingFileError extends DeletingState {
  final String errMessage;

  const DeletingFileError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}

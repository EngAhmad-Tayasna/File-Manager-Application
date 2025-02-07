part of 'editing_bloc.dart';

sealed class EditingState extends Equatable {
  const EditingState();
  
  @override
  List<Object> get props => [];
}

final class EditingInitial extends EditingState {}

final class EditingFileLoading extends EditingState {}

final class SuccessFileEdited extends EditingState {
  final String filePath;
  final String content;

  const SuccessFileEdited({required this.filePath, required this.content});

  @override
  List<Object> get props => [filePath, content];
}

final class EditingFileError extends EditingState {
  final String errMessage;

  const EditingFileError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
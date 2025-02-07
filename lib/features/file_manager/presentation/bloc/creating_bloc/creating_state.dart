part of 'creating_bloc.dart';

sealed class CreatingState extends Equatable {
  const CreatingState();
  
  @override
  List<Object> get props => [];
}

final class CreatingInitial extends CreatingState {}

final class CreateFileLoading extends CreatingState {}

final class SuccessFileCreated extends CreatingState {
  final String filePath;

  const SuccessFileCreated({required this.filePath});
  @override
  List<Object> get props => [filePath];
}

final class CreateFileError extends CreatingState {
  final String errMessage;

  const CreateFileError({required this.errMessage});
  
  @override
  List<Object> get props => [errMessage];
}
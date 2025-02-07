part of 'get_files_bloc.dart';


sealed class GetFilesState extends Equatable {
  const GetFilesState();

  @override
  List<Object> get props => [];
}

final class GetFilesInitial extends GetFilesState {}

final class GetFilesLoading extends GetFilesState {}

final class GetFilesLoaded extends GetFilesState {
  final List<String> files;
  final List<String> folders;
  final String currentDirectory;

  const GetFilesLoaded(
      {required this.files,
      required this.folders,
      required this.currentDirectory});

  @override
  List<Object> get props => [files, folders, currentDirectory];
}

final class GetFilesError extends GetFilesState {
  final String errMessage;

  const GetFilesError({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

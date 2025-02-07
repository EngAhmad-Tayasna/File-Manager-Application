part of 'file_manager_bloc.dart';

sealed class FileManagerState extends Equatable {
  const FileManagerState();
  
  @override
  List<Object> get props => [];
}

final class FileManagerInitial extends FileManagerState {}

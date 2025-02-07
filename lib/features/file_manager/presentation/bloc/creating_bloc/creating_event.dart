part of 'creating_bloc.dart';

sealed class CreatingEvent extends Equatable {
  const CreatingEvent();

  @override
  List<Object> get props => [];
}


class CreateFileEvent extends CreatingEvent {
  final String directoryPath;
  final String fileName;

  const CreateFileEvent({required this.directoryPath, required this.fileName});

  @override
  List<Object> get props => [directoryPath, fileName];
}

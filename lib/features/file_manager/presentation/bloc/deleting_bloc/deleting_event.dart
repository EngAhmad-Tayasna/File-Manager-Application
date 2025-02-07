part of 'deleting_bloc.dart';

sealed class DeletingEvent extends Equatable {
  const DeletingEvent();

  @override
  List<Object> get props => [];
}

class DeleteFileEvent extends DeletingEvent {
  final String filePath;
  const DeleteFileEvent({required this.filePath});

  @override
  List<Object> get props => [filePath];
}

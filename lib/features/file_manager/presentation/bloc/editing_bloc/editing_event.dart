part of 'editing_bloc.dart';

sealed class EditingEvent extends Equatable {
  const EditingEvent();

  @override
  List<Object> get props => [];
}


class EditFileEvent extends EditingEvent {
  final String filePath;
  final String content;
  const EditFileEvent({required this.content, required this.filePath});

  @override
  List<Object> get props => [filePath, content];
}

import 'package:equatable/equatable.dart';

sealed class GetFilesEvent extends Equatable {
  const GetFilesEvent();

  @override
  List<Object> get props => [];
}

class LoadFilesEvent extends GetFilesEvent {
  final String directoryPath;

  const LoadFilesEvent({required this.directoryPath});
  @override
  List<Object> get props => [directoryPath];
}


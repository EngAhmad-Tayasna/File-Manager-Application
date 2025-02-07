import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'file_manager_event.dart';
part 'file_manager_state.dart';

class FileManagerBloc extends Bloc<FileManagerEvent, FileManagerState> {
  FileManagerBloc() : super(FileManagerInitial()) {
    on<FileManagerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

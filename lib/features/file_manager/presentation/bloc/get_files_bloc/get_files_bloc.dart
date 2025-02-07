import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/get_files_bloc/get_files_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_files_state.dart';

class GetFilesBloc extends Bloc<GetFilesEvent, GetFilesState> {
  GetFilesBloc() : super(GetFilesInitial()) {
    on<LoadFilesEvent>((event, emit) async {
      emit(
        GetFilesLoading(),
      );
      try {
        final directory = Directory(event.directoryPath);
        if (await directory.exists()) {
          final files = directory
              .listSync()
              .whereType<File>()
              .map((file) => file.path)
              .toList();
          final folders = directory
              .listSync()
              .whereType<Directory>()
              .map((folder) => folder.path)
              .toList();
          emit(GetFilesLoaded(
            files: files,
            folders: folders,
            currentDirectory: event.directoryPath,
          ));
        } else {
          emit(
            const GetFilesError(
              errMessage: "Directory does not exist.",
            ),
          );
        }
      } catch (e) {
        emit(
          GetFilesError(
            errMessage: e.toString(),
          ),
        );
      }
    });
  }
}

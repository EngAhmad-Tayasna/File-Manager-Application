import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'creating_event.dart';
part 'creating_state.dart';

class CreatingBloc extends Bloc<CreatingEvent, CreatingState> {
  CreatingBloc() : super(CreatingInitial()) {
    on<CreateFileEvent>((event, emit) async {
      emit(
        CreateFileLoading(),
      );
      try {
        final newFile = File(
          '${event.directoryPath}/${event.fileName}',
        );
        if (await newFile.exists()) {
          emit(
            const CreateFileError(
              errMessage: "File already exists.",
            ),
          );
        } else {
          await newFile.create();
          emit(
            SuccessFileCreated(
              filePath: newFile.path,
            ),
          );
        }
      } catch (e) {
        emit(
          CreateFileError(
            errMessage: e.toString(),
          ),
        );
      }
    });
  }
}

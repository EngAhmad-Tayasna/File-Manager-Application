import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'editing_event.dart';
part 'editing_state.dart';

class EditingBloc extends Bloc<EditingEvent, EditingState> {
  EditingBloc() : super(EditingInitial()) {
    on<EditFileEvent>((event, emit) async {
      emit(
        EditingFileLoading(),
      );
      try {
        final file = File(event.filePath);
        if (await file.exists()) {
          await file.writeAsString(event.content);
          emit(
            SuccessFileEdited(
              filePath: event.filePath,
              content: event.content,
            ),
          );
        } else {
          emit(
            const EditingFileError(
              errMessage: "File does not exist.",
            ),
          );
        }
      } catch (e) {
        emit(
          EditingFileError(
            errMessage: e.toString(),
          ),
        );
      }
    });
  }
}

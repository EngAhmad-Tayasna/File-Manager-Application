import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deleting_event.dart';
part 'deleting_state.dart';

class DeletingBloc extends Bloc<DeletingEvent, DeletingState> {
  DeletingBloc() : super(DeletingInitial()) {
    on<DeleteFileEvent>((event, emit) async {
      emit(
        DeletingFileLoading(),
      );
      try {
        final file = File(event.filePath);
        if (await file.exists()) {
          await file.delete();
          emit(
            SuccessFileDeleted(
              deletePath: event.filePath,
            ),
          );
        } else {
          emit(
            const DeletingFileError(
              errMessage: "File does not exist.",
            ),
          );
        }
      } catch (e) {
        emit(
          DeletingFileError(
            errMessage: e.toString(),
          ),
        );
      }
    });
  }
}

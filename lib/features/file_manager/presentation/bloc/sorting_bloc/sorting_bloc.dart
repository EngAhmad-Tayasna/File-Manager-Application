import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sorting_event.dart';
part 'sorting_state.dart';

class SortingBloc extends Bloc<SortingEvent, SortingState> {
  SortingBloc() : super(SortingInitial()) {
    on<SortFileEvent>((event, emit) async {
      emit(
        SortingFileLoading(),
      );
      if (state is SuccessFileSorted) {
        final currentState = state as SuccessFileSorted;
        List<String> sortedFiles = List.from(currentState.files);
        List<String> sortedFolders = List.from(currentState.folders);

        if (event.typeSort == 'name') {
          sortedFiles.sort();
          sortedFolders.sort();
        } else if (event.typeSort == 'date') {
          sortedFiles.sort(
            (a, b) => File(a).lastModifiedSync().compareTo(
                  File(b).lastModifiedSync(),
                ),
          );
          sortedFolders.sort(
            (a, b) => Directory(a).statSync().modified.compareTo(
                  Directory(b).statSync().modified,
                ),
          );
        } else if (event.typeSort == 'size') {
          sortedFiles.sort(
            (a, b) => File(a).lengthSync().compareTo(
                  File(b).lengthSync(),
                ),
          );
        }

        emit(
          SuccessFileSorted(
            files: sortedFiles,
            folders: sortedFolders,
          ),
        );
      }
    });
  }
}

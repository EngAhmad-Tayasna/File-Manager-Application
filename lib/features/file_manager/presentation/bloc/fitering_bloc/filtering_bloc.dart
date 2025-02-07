import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filtering_event.dart';
part 'filtering_state.dart';

class FilteringBloc extends Bloc<FilteringEvent, FilteringState> {
  FilteringBloc() : super(FilteringInitial()) {
    on<FilterFileEvent>((event, emit) async {
      emit(
        FilteringFilesLoading(),
      );
      if (state is SuccessFileFiltered) {
        final currentState = state as SuccessFileFiltered;
        final filteredFiles = currentState.files
            .where(
              (file) => file.endsWith(
                event.typeFilter,
              ),
            )
            .toList();
        emit(
          SuccessFileFiltered(
            files: filteredFiles,
            folders: currentState.folders,
          ),
        );
      }
    });
  }
}

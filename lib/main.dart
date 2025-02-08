import 'package:file_manager_application/config/observer.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/deleting_bloc/deleting_bloc.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/fitering_bloc/filtering_bloc.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/get_files_bloc/get_files_bloc.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/get_files_bloc/get_files_event.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/sorting_bloc/sorting_bloc.dart';
import 'package:file_manager_application/features/file_manager/presentation/pages/file_manager_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> getInitialDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<String>(
        future: getInitialDirectory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<GetFilesBloc>(
                  create: (_) => GetFilesBloc()
                    ..add(
                      LoadFilesEvent(
                        directoryPath: snapshot.data!,
                      ),
                    ),
                ),
                BlocProvider<SortingBloc>(
                  create: (_) => SortingBloc()
                    ..add(
                      SortFileEvent(
                        typeSort: snapshot.data!,
                        directoryPath: snapshot.data!,
                      ),
                    ),
                ),
                BlocProvider<FilteringBloc>(
                  create: (_) => FilteringBloc()
                    ..add(
                      FilterFileEvent(
                        typeFilter: snapshot.data!,
                        directoryPath: snapshot.data!,
                      ),
                    ),
                ),
                BlocProvider<DeletingBloc>(
                  create: (_) => DeletingBloc()
                    ..add(
                      DeleteFileEvent(
                        filePath: snapshot.data!,
                      ),
                    ),
                ),
              ],
              child: GetFilesScreen(
                initialDirectory: snapshot.data!,
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load directory'),
            );
          }
        },
      ),
    );
  }
}

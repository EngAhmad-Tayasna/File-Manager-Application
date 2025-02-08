import 'dart:io';
import 'package:file_manager_application/features/file_manager/presentation/bloc/deleting_bloc/deleting_bloc.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/fitering_bloc/filtering_bloc.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/get_files_bloc/get_files_bloc.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/get_files_bloc/get_files_event.dart';
import 'package:file_manager_application/features/file_manager/presentation/bloc/sorting_bloc/sorting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GetFilesScreen extends StatelessWidget {
  final String initialDirectory;

  const GetFilesScreen({
    super.key,
    required this.initialDirectory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              context.read<SortingBloc>().add(SortFileEvent(
                 directoryPath: initialDirectory , typeSort: 'name'));
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              context.read<FilteringBloc>().add(FilterFileEvent(
                  directoryPath: initialDirectory, typeFilter: 'files'));
            },
          ),
        ],
      ),
      body: BlocBuilder<GetFilesBloc, GetFilesState>(
        builder: (context, state) {
          if (state is GetFilesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetFilesLoaded) {
            return ListView.builder(
              itemCount: state.files.length,
              itemBuilder: (context, index) {
                final file = state.files[index];
                return ListTile(
                  leading: Icon(
                    file is Directory ? Icons.folder : Icons.insert_drive_file,
                    color: file is Directory ? Colors.blue : Colors.grey,
                  ),
                  title: Text(file),
                  onTap: file is Directory 
                      ? () {
                          context.read<GetFilesBloc>().add(
                                LoadFilesEvent(
                                    directoryPath:
                                        '$initialDirectory/$file'),
                              );
                        }
                      : null,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<DeletingBloc>().add(DeleteFileEvent(
                          filePath: '$initialDirectory/$file'));
                    },
                  ),
                );
              },
            );
          } else if (state is GetFilesError) {
            return Center(child: Text('Error: ${state.errMessage}'));
          } else {
            return const Center(child: Text('No files found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

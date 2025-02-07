import 'dart:io';

import 'package:file_manager_application/features/file_manager/data/data_sources/file_local.dart';
import 'package:file_manager_application/features/file_manager/domain/entities/file_entity.dart';
import 'package:file_manager_application/features/file_manager/domain/repository/file_repository.dart';

class FileRepositoryImpl implements FileRepository {
  final FileLocalData fileLocalData;

  FileRepositoryImpl({required this.fileLocalData});

  @override
  Future<void> createFile(String directoryPath, String fileName) async {
    await fileLocalData.createFile(directoryPath, fileName);
  }

  @override
  Future<void> deleteFile(String filePath) async {
    await fileLocalData.deleteFile(filePath);
  }

  @override
  Future<void> editPath(String filePath, String content) async {
    await fileLocalData.editFile(filePath, content);
  }

  @override
  Future<List<FileEntity>> getFiles(String directoryPath) async {
    final files = await fileLocalData.getFiles(directoryPath);
    return files.map((file) {
      final stats = file.statSync();
      return FileEntity(
        name: file.uri.pathSegments.last,
        isDirectory: file is Directory,
        size: stats.size,
        lastModified: stats.modified,
      );
    }).toList();
  }
  
  @override
  Future<List<FileEntity>> filterFiles(String directoryPath, String typeFilter) async {
    final files = await fileLocalData.filterFiles(directoryPath, typeFilter);
    return files.map((file) {
      final stats = file.statSync();
      return FileEntity(
        name: file.uri.pathSegments.last,
        isDirectory: file is Directory,
        size: stats.size,
        lastModified: stats.modified,
      );
    }).toList();
   }
  
  @override
  Future<List<FileEntity>> sortFiles(String directoryPath, String typeSort) async {
    final files = await fileLocalData.sortFiles(directoryPath, typeSort);
    return files.map((file) {
      final stats = file.statSync();
      return FileEntity(
        name: file.uri.pathSegments.last,
        isDirectory: file is Directory,
        size: stats.size,
        lastModified: stats.modified,
      );
    }).toList();
  }

}

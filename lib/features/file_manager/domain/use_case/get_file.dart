import 'package:file_manager_application/features/file_manager/domain/entities/file_entity.dart';
import 'package:file_manager_application/features/file_manager/domain/repository/file_repository.dart';

class GetFileUseCase {
  final FileRepository fileRepository;

  GetFileUseCase({required this.fileRepository});

  Future<List<FileEntity>> getFiles(String directoryPath) async {
    return await fileRepository.getFiles(directoryPath);
  }

  Future<void> createFile(String directoryPath, String fileName) async {
    return await fileRepository.createFile(directoryPath, fileName);
  }

  Future<void> deleteFile(String filePath) async {
    return await fileRepository.deleteFile(filePath);
  }
  
  Future<void> editPath(String filePath, String content) async {
    return await fileRepository.editPath(filePath, content);
  }

  Future<List<FileEntity>> sortFiles(String directoryPath, String typeSort) async {
    return await fileRepository.sortFiles(directoryPath, typeSort);
  }
  
  Future<List<FileEntity>> filterFiles(String directoryPath, String typeFilter) async {
    return await fileRepository.filterFiles(directoryPath, typeFilter);
  }
}

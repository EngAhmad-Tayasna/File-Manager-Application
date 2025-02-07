import 'package:file_manager_application/features/file_manager/domain/entities/file_entity.dart';
import 'package:file_manager_application/features/file_manager/domain/repository/file_repository.dart';

class GetFileUseCase {
  final FileRepository fileRepository;

  GetFileUseCase({required this.fileRepository});

  Future<List<FileEntity>> getFiles(String directoryPath) async {
    return await fileRepository.getFiles(directoryPath);
  }
}

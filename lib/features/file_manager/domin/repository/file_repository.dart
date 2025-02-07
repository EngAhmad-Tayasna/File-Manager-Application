
import 'package:file_manager_application/features/file_manager/domin/entities/file_entity.dart';

abstract class FileRepository {

  Future<List<FileEntity>> getFiles(String directoryPath) ;
  Future<void> createFile(String directoryPath , String fileName);
  Future<void> deleteFile(String filePath);
  Future<void> editPath(String filePath, String content);

 }


import 'dart:io';

class FileLocalData {

  Future<List<FileSystemEntity>> getFiles( String directoryPath) async {
    final directory = Directory(directoryPath); 
    return directory.listSync();
  } 

  Future<void> createFile(String directoryPath , String fileName) async {
    final file = File('$directoryPath/$fileName');
    await file.create();
  }

  Future<void> deleteFile(String filePath) async {
    final file= File(filePath);
    await file.delete();
  }

  Future<void> editFile(String filePath , String content) async {
    final file = File(filePath);
    await file.writeAsString(content);
  }
  
}
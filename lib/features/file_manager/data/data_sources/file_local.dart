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
  
   Future<List<FileSystemEntity>> sortFiles(
      String directoryPath, String typeSort) async {
    final files = await getFiles(directoryPath);

    if (typeSort == 'name') {
      files.sort((a, b) => a.path.compareTo(b.path));
    } else if (typeSort == 'date') {
      files.sort((a, b) {
        final aStat = a.statSync();
        final bStat = b.statSync();
        return aStat.modified.compareTo(bStat.modified);
      });
    } else if (typeSort == 'size') {
      files.sort((a, b) {
        if (a is File && b is File) {
          return a.lengthSync().compareTo(b.lengthSync());
        }
        return 0;
      });
    }

    return files;
  }

   Future<List<FileSystemEntity>> filterFiles(
      String directoryPath, String typeFilter) async {
    final files = await getFiles(directoryPath);
    if (typeFilter.startsWith('.')) {
      return files.where((file) => file.path.endsWith(typeFilter)).toList();
    }
    if (typeFilter == 'files') {
      return files.whereType<File>().toList();
    } else if (typeFilter == 'folders') {
      return files.whereType<Directory>().toList();
    }
    return [];
  }
}
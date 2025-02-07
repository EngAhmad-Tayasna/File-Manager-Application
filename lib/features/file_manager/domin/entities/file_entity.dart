
class FileEntity { 
  final String name;
  final bool isDirectory;
  final double size;
  final DateTime lastModified;

  FileEntity({
    required this.name,
    required this.isDirectory,
    required this.size,
    required this.lastModified,
  });
}
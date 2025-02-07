
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



// Future<String> getInitialDirectory() async {
//   final directory = await getApplicationDocumentsDirectory();
//   return directory.path;
// }
// MaterialApp(
//       home: FutureBuilder<String>(
//         future: getInitialDirectory(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (snapshot.hasData) {
//             return BlocProvider(
//               create: (_) => GetFilesBloc()
//                 ..add(LoadFilesEvent(directoryPath: snapshot.data!)),
//               child: BlocBuilder<GetFilesBloc, GetFilesState>(
//                 builder: (context, state) {
//                   if (state is GetFilesLoaded) {
//                     return GetFilesScreen(
//                       initialDirectory: state.currentDirectory,
//                     );
//                   } else if (state is GetFilesError) {
//                     return Center(
//                       child: Text('Error: ${state.errMessage}'),
//                     );
//                   } else {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                 },
//               ),
//             );
//           } else {
//             return const Center(
//               child: Text('Failed to load directory'),
//             );
//           }
//         },
//       ),
//     );

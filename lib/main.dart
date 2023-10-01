import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/tasks_cubit.dart';
import 'screens/tasks_list_screen/ui/tasks_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  if (kDebugMode) {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationDocumentsDirectory();
    print('Database Path: ${directory.path}');
  }

  runApp(
    BlocProvider(
      create: (context) => TasksCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TasksList(),
    );
  }
}

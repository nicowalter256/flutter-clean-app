import 'package:clean_app/config/routes/routes.dart';
import 'package:clean_app/config/theme/app_theme.dart';
import 'package:clean_app/features/events/presentation/bloc/event/remote/remote_event_bloc.dart';
import 'package:clean_app/features/events/presentation/bloc/event/remote/remote_event_event.dart';
import 'package:clean_app/features/events/presentation/pages/home/home_screen.dart';
import 'package:clean_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteEventsBloc>(
      create: (context) => sl()..add(const GetEvents()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const HomeScreen()),
    );
  }
}

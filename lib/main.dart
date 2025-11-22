import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'feature/bottom_nav_bar/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LayoutProvider(),
        ),
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) {
          return App();
        },
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_no_app/config/app_theme.dart';
import 'package:si_no_app/presentacion/provider/chat_provider.dart';
import 'package:si_no_app/presentacion/chat/chat_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'Si No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
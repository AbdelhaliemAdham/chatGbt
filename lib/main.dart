import 'package:chatgbt_4/providers/chats_provider.dart';
import 'package:chatgbt_4/providers/model_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/chat.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: cardColor),
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        ),
        home: const ChatScreen(),
      ),
    );
  }
}

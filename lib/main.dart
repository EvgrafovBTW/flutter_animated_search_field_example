import 'package:flutter/material.dart';
import 'package:offscreen_sliding_animation_example/animation_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Color(0xFF9C9FB2))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6A6E87),
          ),
          contentPadding: EdgeInsets.fromLTRB(18, 12, 18, 12),
        ),
      ),
      home: const Scaffold(
        body: Buffer(),
      ),
    );
  }
}

class Buffer extends StatefulWidget {
  const Buffer({
    super.key,
  });

  @override
  State<Buffer> createState() => _BufferState();
}

class _BufferState extends State<Buffer> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((d) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('app restarted')));
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: AnimationScreen(),
    );
  }
}

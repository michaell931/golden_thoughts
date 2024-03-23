import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:golden_thoughts/features/generate/generate_page.dart';
import 'package:golden_thoughts/features/recent/recent_page.dart';
import 'package:golden_thoughts/models/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  String getAppBarText() {
    if (currentIndex == 0) {
      return "Twoja sentencja na dziś";
    } else if (currentIndex == 1) {
      return "Ostatnie sentencje";
    } else if (currentIndex == 2) {
      return "Twoje ulubione sentencje";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          getAppBarText(),
          style: GoogleFonts.zillaSlab(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const GeneratePage();
        }
        if (currentIndex == 1) {
          return const RecentPage();
        }
        if (currentIndex == 2) {
          return const Text('2');
        }

        return const Text('3');
      }),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.circle,
        padding: const EdgeInsets.all(3),
        showSelectedLabels: true,
        snakeViewColor: Colors.orange,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          if (newIndex == 3) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(
                      appBar: AppBar(
                        title: const Text('Uzytkownik'),
                      ),
                    )));
          } else {
            setState(() {
              currentIndex = newIndex;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.casino), label: 'Generuj'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Ostatnie'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Ulubione'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Użytkownik'),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({super.key});

  @override
  State<GeneratePage> createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 100.0,
                child: FadeInAnimation(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('categories')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Wystąpił nieoczekiwany problem');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        final documents = snapshot.data!.docs;

                        return Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            for (final document in documents) ...[
                              Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(5),
                                child: PrettyColorSlideButton(
                                  label: document['name'],
                                  onPressed: () {},
                                  position: SlidePosition.left,
                                  bgColor: Colors.amber,
                                  foregroundColor: Colors.purple,
                                  labelStyle: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                            const SizedBox(
                              height: 100,
                            ),
                            ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.amber)),
                              onPressed: () {},
                              child: const Text(
                                "GENERUJ!",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 40),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

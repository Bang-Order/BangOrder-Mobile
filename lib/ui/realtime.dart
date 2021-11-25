import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimePage extends StatelessWidget {
  late DatabaseReference dbRef;

  RealtimePage(this.dbRef);

  AppBar initAppBar() => AppBar(
        title: const Text('Movie App'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("REALTIME DATABASE"),
            StreamBuilder(
              stream: dbRef.onValue,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (_isTrue(snapshot)) {
                  return Text(snapshot.data.snapshot.value);
                } else {
                  return Center(child: Text("No data"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _isTrue(AsyncSnapshot<dynamic> snapshot) {
    return snapshot.hasData &&
        !snapshot.hasError &&
        snapshot.data.snapshot.value != null;
  }
}

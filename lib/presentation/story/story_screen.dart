import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  double _fontSize = 20.0; // Initial font size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Adjuster'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Adjustable Text',
              style: TextStyle(fontSize: _fontSize),
            ),
          ),
          Slider(
            value: _fontSize,
            min: 10.0,
            max: 50.0,
            onChanged: (value) {
              setState(() {
                _fontSize = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SongDetailsPage extends StatefulWidget {
  final String song;
  final String artist;
  final String imagePath;

  SongDetailsPage({required this.song, required this.artist, required this.imagePath});

  @override
  _SongDetailsPageState createState() => _SongDetailsPageState();
}

class _SongDetailsPageState extends State<SongDetailsPage> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Details', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF523E7B), // Dark purple color
              Color(0xFF9C89B8), // Light purple color
            ],
            stops: [0.0, 0.8], // Adjust the stops to control the transition point
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.8, // Adjust the height as needed
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      widget.song,
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.artist,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Slider(
                value: 0.5,
                onChanged: (double value) {
                  // Handle slider change logic
                },
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.shuffle),
                    onPressed: () {
                      // Handle shuffle logic
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {
                      // Handle skip previous logic
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: () {
                      // Handle play logic
                    },
                    elevation: 8.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next),
                    onPressed: () {
                      // Handle skip next logic
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ],
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}

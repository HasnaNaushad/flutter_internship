import 'package:flutter/material.dart';
import 'package:flutter_internship/AlbumPage.dart';
import 'package:flutter_internship/InfoPage.dart';
import 'package:flutter_internship/SettingsPage.dart';
import 'package:flutter_internship/SongDetails.dart';
import 'package:flutter_internship/colors.dart';
import 'package:flutter_internship/ArtistPage.dart';
import 'package:flutter_internship/PlaylistPage.dart';
import 'package:flutter_internship/AccountPage.dart';

void main() {
  runApp(MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: mprimary,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> songs = List.generate(35, (index) => 'Song ${index + 1}');
  bool isPlaying = false;
  int currentSongIndex = -1;

  void playSong(int index) {
    setState(() {
      isPlaying = true;
      currentSongIndex = index;
    });
  }

  void pauseSong() {
    setState(() {
      isPlaying = false;
    });
  }

  void skipNext() {
    if (currentSongIndex < songs.length - 1) {
      setState(() {
        currentSongIndex++;
      });
    }
  }

  void skipPrevious() {
    if (currentSongIndex > 0) {
      setState(() {
        currentSongIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HARMONIX', style: TextStyle(color: const Color(0xFFE5E5E5))),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            color: const Color(0xFFE5E5E5),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
              // Add onPressed logic
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: const Color(0xFFE5E5E5),),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'option1',
                child: Text('Settings'),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Text('Info'),
              ),

            ],
            onSelected: (String value) {

              // Handle menu option selection logic
              if (value == 'option1') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
                // Handle option 1 logic
              } else if (value == 'option2') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage()),
                );
                // Handle option 2 logic
              }
            },
          ),
        ],
      ),

    body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    Color(0xFF523E7B), // Dark purple color
    Color(0xFF9C89B8), // Lighter purple color
    ],
    stops: [0.0, 0.8], // Adjust the stops to control the transition point
    ),
    ),

      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFE5E5E5).withOpacity(0.2), // Lightest gradient shade with increased opacity
                    Color(0xFFE5E5E5).withOpacity(0.4), // Lighter gradient shade with increased opacity
                  ],
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)), // Make the hint text less transparent
                  prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.9)), // Set the color of the search icon with higher opacity
                  border: InputBorder.none, // Remove the border
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                style: TextStyle(color: Colors.white), // Set the text color to white
              ),
            ),


          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              ElevatedButton(
                onPressed: () {
                  // Button 1 onPressed logic
                },
                child: Text('SONGS', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Albumpage()),
                  );
                  // Button 2 onPressed logic
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
                child: Text('ALBUM',style: TextStyle(color: Colors.white) ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaylistPage(folders: folders)),
                  );
                  // Button 3 onPressed logic
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
                child: Text('PLAYLIST', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArtistPage()),
                  );
                  // Button 4 onPressed logic
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
                child: Text('ARTIST', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/albumpage1.jpg'), // Replace with the actual image path
                  ),
                  title: Text(songs[index]),
                  trailing: PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: 'option1',
                        child: Text('Play next'),
                      ),
                      PopupMenuItem<String>(
                        value: 'option2',
                        child: Text('Add to playlist'),
                      ),
                      PopupMenuItem<String>(
                        value: 'option3',
                        child: Text('Delete'),
                      ),
                    ],
                    onSelected: (String value) {
                      // Handle menu option selection logic
                      if (value == 'option1') {
                        // Handle option 1 logic
                      } else if (value == 'option2') {
                        // Handle option 2 logic
                      } else if (value == 'option3') {
                        // Handle option 3 logic
                      }
                    },
                  ),
                  onTap: () {
                    playSong(index);
                  },
                );
              },
            ),
          ),
          if (currentSongIndex != -1)
            NowPlaying(
              song: songs[currentSongIndex],
              isPlaying: isPlaying,
              onPause: pauseSong,
              onSkipNext: skipNext,
              onSkipPrevious: skipPrevious,
            ),
        ],
      ),
    )
    );
  }
}

class NowPlaying extends StatelessWidget {
  final String song;
  final bool isPlaying;
  final VoidCallback onPause;
  final VoidCallback onSkipNext;
  final VoidCallback onSkipPrevious;

  NowPlaying({
    required this.song,
    required this.isPlaying,
    required this.onPause,
    required this.onSkipNext,
    required this.onSkipPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle container tap
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SongDetailsPage(song: song, imagePath:'assets/images/songdetails.png', artist: 'Artist', )),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE5E5E5), // Light white color
                Color(0xFFD3D3D3), // Lighter purple color
              ],
              stops: [0.0, 0.8], // Adjust the stops to control the transition point
            ),
          ),

          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/albumpage1.jpg'), // Replace with the actual image path
                  ),
                  SizedBox(width: 8.0),
                  Text(song),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: onSkipPrevious,
                  ),
                  IconButton(
                    icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                    onPressed: onPause,
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next),
                    onPressed: onSkipNext,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}


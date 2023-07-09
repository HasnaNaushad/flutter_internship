import 'package:flutter/material.dart';
import 'package:flutter_internship/ArtistPage.dart';
import 'package:flutter_internship/InfoPage.dart';
import 'package:flutter_internship/SettingsPage.dart';
import 'package:flutter_internship/PlaylistPage.dart';
import 'package:flutter_internship/colors.dart';
import 'package:flutter_internship/homescreen.dart';
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
        primarySwatch: mprimary, // Replace `mprimary` with a color from your `colors.dart` file or use `Colors.blue` as an example
      ),
      home: Albumpage(),
    );
  }
}

class Albumpage extends StatelessWidget {
  final List<String> albums = [
    'assets/album1.jpeg',
    'assets/album2.jpeg',
    'assets/album3.jpeg',
    'assets/album4.jpeg',
    'assets/album5.jpeg',
    'assets/album6.jpeg',
    'assets/album7.jpeg',
    'assets/album8.jpeg',
  ];

  final List<String> albumNames = [
    'French Consul',
    'Bangles',
    'Euphoria',
    'Beatles',
    'Pouvoir Féminin',
    'Dance All night',
    'K-pop',
    'Ultimate Party Mix',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HARMONIX',
          style: TextStyle(color: const Color(0xFFE5E5E5)),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: const Color(0xFFE5E5E5)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: const Color(0xFFE5E5E5)),
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
      Color(0xFF9C89B8), // Light purple color
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  // Button 1 onPressed logic
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
                ),
                child: Text('SONGS', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Button 2 onPressed logic
                },
                child: Text('ALBUM', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistPage(folders: folders),
                    ),
                  );
                  // Button 3 onPressed logic
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
                ),
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
                ),
                child: Text('ARTIST', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75, // Adjust the aspect ratio as desired
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: albums.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>AlbumDetailsScreen(album: albums[index], albumName: albumNames[index],),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            albums[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          albumNames[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    )
    );
  }
}

class AlbumDetailsScreen extends StatelessWidget {
  final String album;
  final String albumName;

  AlbumDetailsScreen({required this.album, required this.albumName});

  // Dummy list of songs
  final List<String> songs = [
    'Song 1',
    'Song 2',
    'Song 3',
    'Song 4',
    'Song 5',
    'Song 6',
    'Song 7',
    'Song 8',
    'Song 9',
    'Song 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(albumName),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
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
              Color(0xFF7B5B95), // Lighter shade of purple color
              Color(0xFFB8A1D9), // Light purple color
              ],
              stops: [0.0, 0.8], // Adjust the stops to control the transition point
              ),
              ),

      child: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      album,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Implement shuffle functionality
                      },
                      icon: Icon(Icons.shuffle),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        // Implement play functionality
                      },
                      icon: Icon(
                        Icons.play_circle_filled,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (BuildContext context, int index) {
                final song = songs[index];
                return ListTile(
                  title: Text(song),
                  trailing: PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: 'option1',
                        child: Text('Share'),
                      ),
                      PopupMenuItem<String>(
                        value: 'option2',
                        child: Text('Add to queue'),
                      ),
                    ],
                    onSelected: (String value) {
                      // Handle option selection
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
              )
    );
  }
}

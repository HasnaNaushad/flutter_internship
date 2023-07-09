import 'package:flutter/material.dart';
import 'package:flutter_internship/AlbumPage.dart';
import 'package:flutter_internship/colors.dart';
import 'package:flutter_internship/PlaylistPage.dart';
import 'package:flutter_internship/homescreen.dart';
import 'package:flutter_internship/AccountPage.dart';
import 'package:flutter_internship/SettingsPage.dart'; // Import the SettingsPage
import 'package:flutter_internship/InfoPage.dart';
import 'package:flutter_svg/flutter_svg.dart';// Import the InfoPage

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
      home: ArtistPage(),
    );
  }
}

class ArtistPage extends StatefulWidget {
  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  final List<String> artists = [
    'Taylor Swift',
    'Arijit Singh',
    'Ariana Grande',
    'Justin Bieber',
    'Selena Gomez',
    'A.R. Rahman',
    'Shreya Goshal',
    'Rihanna',
    'Sonu Nigam',
    'Weeknd',
  ];

  final Map<String, String> artistImages = {
    'Taylor Swift': 'assets/images/artist1.jpeg',
    'Arijit Singh': 'assets/images/artist2.jpg',
    'Ariana Grande': 'assets/images/artist3.png',
    'Justin Bieber': 'assets/images/artist4.jpeg',
    'Selena Gomez': 'assets/images/artist5.jpeg',
    'A.R. Rahman': 'assets/images/artist6.jpg',
    'Shreya Goshal': 'assets/images/artist7.jpg',
    'Rihanna': 'assets/images/artist8.jpeg',
    'Sonu Nigam': 'assets/images/artist9.jpg',
    'Weeknd': 'assets/images/artist10.jpg',

    // Add more artist-image pairs as needed
  };


  List<String> filteredArtists = [];

  @override
  void initState() {
    super.initState();
    filteredArtists.addAll(artists);
  }

  void filterArtists(String query) {
    filteredArtists.clear();
    if (query.isNotEmpty) {
      final lowercaseQuery = query.toLowerCase();
      artists.forEach((artist) {
        if (artist.toLowerCase().contains(lowercaseQuery)) {
          filteredArtists.add(artist);
        }
      });
    } else {
      filteredArtists.addAll(artists);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HARMONIX', style: TextStyle(color: const Color(0xFFE5E5E5))),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: const Color(0xFFE5E5E5),),
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
              if (value == 'option1') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              } else if (value == 'option2') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage()),
                );
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
      Color(0xFF9C89B8),// Light purple color
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
                child: Text('SONGS', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Albumpage()),
                  );
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
                child: Text('ALBUM', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaylistPage(folders: folders)),
                  );
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
                child: Text('PLAYLIST', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform action for button 4
                },
                child: Text('ARTIST', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 10),


          Expanded(
            child: ListView.builder(
              itemCount: filteredArtists.length,
              itemBuilder: (BuildContext context, int index) {
                final artist = filteredArtists[index];
                final imageAsset = artistImages[artist];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtistDetailPage(artist: artist, artistImages: artistImages),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: imageAsset != null
                                ? Image.asset(
                              imageAsset,
                              fit: BoxFit.cover,
                            )
                                : Icon(Icons.image),
                          ),
                        ),
                        SizedBox(width: 16.0), // Add horizontal spacing
                        Expanded(
                          child: ListTile(
                            title: Text(artist),
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


class ArtistDetailPage extends StatelessWidget {
  final String artist;
  final Map<String, String> artistImages;

  ArtistDetailPage({required this.artist, required this.artistImages});

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
        title: Text(artist),
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
                      artistImages[artist]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.2, // Adjust the scaling factor as needed
                      child: IconButton(
                        onPressed: () {
                          // Implement shuffle functionality
                        },
                        icon: Icon(Icons.shuffle),
                      ),
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

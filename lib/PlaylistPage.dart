import 'package:flutter/material.dart';
import 'package:flutter_internship/ArtistPage.dart';
import 'package:flutter_internship/Albumpage.dart';
import 'package:flutter_internship/InfoPage.dart';
import 'package:flutter_internship/SettingsPage.dart';
import 'package:flutter_internship/colors.dart';
import 'package:flutter_internship/homescreen.dart';
import 'package:flutter_internship/AccountPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playlist App',
      home: PlaylistPage(folders: folders),
    );
  }
}


class PlaylistPage extends StatefulWidget {
  final List<Folder> folders;

  PlaylistPage({required this.folders});

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<Folder> folders = [];
  TextEditingController playlistNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    folders = widget.folders;
  }

  void createPlaylist(String playlistName) {
    setState(() {
      folders.add(Folder(name: playlistName, songs: []));
    });
    Navigator.pop(context); // Close the dialog
  }

  void addSongsToPlaylist(List<Song> songs) {
    setState(() {
      folders.add(Folder(name: playlistNameController.text, songs: songs));
    });
    Navigator.pop(context); // Close the dialog
  }

  void navigateToAddSongPage() async {
    final List<Song>? selectedSongs = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddSongs()),
    );

    if (selectedSongs != null) {
      addSongsToPlaylist(selectedSongs);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HARMONIX', style: TextStyle(color: const Color(0xFFE5E5E5))),
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
                    // Handle button 3 tap
                  },
                  child: Text('PLAYLIST', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ArtistPage()),
                    );
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
                  child: Text('ARTIST', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: folders.length,
                itemBuilder: (BuildContext context, int folderIndex) {
                  return ExpansionTile(
                    title: Text(folders[folderIndex].name),
                    children: folders[folderIndex].songs.map((song) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(song.coverImage),
                        ),
                        title: Text(song.title),
                        subtitle: Text(song.artist),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Remove song from playlist
                            setState(() {
                              folders[folderIndex].songs.remove(song);
                            });
                          },
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: mprimary,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Create Playlist'),
                content: TextField(
                  controller: playlistNameController,
                  decoration: InputDecoration(hintText: 'Playlist Name'),
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                  ),
                  TextButton(
                    child: Text('Create'),
                    onPressed: () {
                      String playlistName = playlistNameController.text;
                      createPlaylist(playlistName);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );

  }
}

class AddSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the UI for selecting songs to add
    return Scaffold(
      // Add your widget tree and functionality for selecting songs
      // ...
    );
  }
}

class Song {
  final String title;
  final String artist;
  final String coverImage;

  Song({required this.title, required this.artist, required this.coverImage});
}

class Folder {
  final String name;
  final List<Song> songs;

  Folder({required this.name, required this.songs});
}

List<Folder> folders = [
  Folder(
    name: 'Folder 1',
    songs: [
      Song(
        title: 'Song 1',
        artist: 'Artist 1',
        coverImage: 'assets/song1.jpg',
      ),
      Song(
        title: 'Song 2',
        artist: 'Artist 2',
        coverImage: 'assets/song2.jpg',
      ),
    ],
  ),
  Folder(
    name: 'Folder 2',
    songs: [
      Song(
        title: 'Song 3',
        artist: 'Artist 3',
        coverImage: 'assets/song3.jpg',
      ),
      Song(
        title: 'Song 4',
        artist: 'Artist 4',
        coverImage: 'assets/song4.jpg',
      ),
    ],
  ),
];

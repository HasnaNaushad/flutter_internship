import 'package:flutter/material.dart';
import 'package:flutter_internship/Login.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool isLightMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        children: [
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Theme'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Select Theme'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CheckboxListTile(
                          title: Text('Dark Mode'),
                          value: isDarkMode,
                          onChanged: (bool? value) {
                            setState(() {
                              isDarkMode = value ?? false;
                              isLightMode = !isDarkMode; // Uncheck the other option
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text('Light Mode'),
                          value: isLightMode,
                          onChanged: (bool? value) {
                            setState(() {
                              isLightMode = value ?? false;
                              isDarkMode = !isLightMode; // Uncheck the other option
                            });
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Confirm'),
                        onPressed: () {
                          // Handle theme selection confirmation
                          Navigator.of(context).pop();
                          if (isDarkMode) {
                            // Apply Dark Mode theme
                          } else if (isLightMode) {
                            // Apply Light Mode theme
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Yes'),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => LoginPage()),
                                (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    ));
  }
}

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  bool isCurrentPasswordCorrect = true;
  bool isCurrentPasswordVisible = false;
  bool isNewPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
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
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: passwordController,
              obscureText: !isCurrentPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isCurrentPasswordVisible = !isCurrentPasswordVisible;
                    });
                  },
                ),
                errorText: isCurrentPasswordCorrect ? null : 'Current password is wrong',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: newPasswordController,
              obscureText: !isNewPasswordVisible,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(isNewPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isNewPasswordVisible = !isNewPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String currentPassword = 'current_password'; // Replace with actual current password
                String password = passwordController.text;
                String newPassword = newPasswordController.text;

                if (password == currentPassword) {
                  // Update the password with the new password
                  // ...
                  setState(() {
                    isCurrentPasswordCorrect = true;
                  });
                } else {
                  setState(() {
                    isCurrentPasswordCorrect = false;
                  });
                }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    ));
  }
}

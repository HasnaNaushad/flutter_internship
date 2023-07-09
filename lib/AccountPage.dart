import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AccountPage(),
  ));
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USER DETAILS', style: TextStyle(color: const Color(0xFFE5E5E5))),
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

      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: Colors.transparent,
                        content: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.white,
                                Colors.white,
                                Colors.white,
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: TextField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    labelText: 'Address',
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: TextField(
                                  controller: contactController,
                                  decoration: InputDecoration(
                                    labelText: 'Contact',
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              ButtonBar(
                                children: [
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Save'),
                                    onPressed: () {
                                      // Save the edited profile
                                      String name = nameController.text;
                                      String address = addressController.text;
                                      String contact = contactController.text;
                                      // Perform save operation
                                      // ...

                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );



                    },
                  );
                },
                child: const Text("EDIT PROFILE", style: TextStyle(color:Colors.black ),),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      IconData icon;
                      String text;
                      String value;
                      if (index == 0) {
                        icon = Icons.person;
                        text = "Your Name";
                        value = nameController.text;
                      } else if (index == 1) {
                        icon = Icons.info;
                        text = "Address";
                        value = addressController.text;
                      } else {
                        icon = Icons.phone;
                        text = "Contact";
                        value = contactController.text;
                      }
                      return ListTile(
                        leading: Icon(icon),
                        title: Text(text),
                        subtitle: Text(value),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}

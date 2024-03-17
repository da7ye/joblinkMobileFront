import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/loginPage.dart';
import 'package:flutter_application_1/screens/categoryProviders.dart';

class HomePage extends StatelessWidget {
  final List<dynamic> categories;

  HomePage({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800], // Change the color of the app bar
        centerTitle: true, // Center the title
        title: Text(
          'Work Specialties',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white, // Change the color of the app bar title
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800], // Sombre background color
        ),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            var categoryId = categories[index]['id'];
            var categoryName = categories[index]['name'];
            var categoryDescription = categories[index]['description'];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4, // Add elevation for a card-like appearance
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProviderPage(
                          categoryId: categoryId,
                          category: categoryName,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          categoryName,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87, // Color of category name
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          categoryDescription,
                          style: TextStyle(
                            fontSize: 18.0,
                            color:
                                Colors.black54, // Color of category description
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

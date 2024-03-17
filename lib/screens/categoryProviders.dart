import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_service.dart';
import 'package:flutter_application_1/screens/categoryProvidersProfil.dart';

class CategoryProviderPage extends StatelessWidget {
  final int categoryId;
  final String category;

  CategoryProviderPage({required this.categoryId, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true, // Center the title of the AppBar
        backgroundColor: Colors.blueGrey[800], // Change the background color of the AppBar
      ),
      backgroundColor: Colors.grey[800], // Change the background color of the body to a somber shade
      body: FutureBuilder(
        future: APIServices.getCategoryProvider(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var categoryData = snapshot.data;
            var participants = categoryData['providers'];
            return ListView.builder(
              itemCount: participants.length,
              itemBuilder: (context, index) {
                var provider = participants[index];
                var providerName = provider['name'].toString();
                var providerEmail = provider['email'].toString();
                var providerPhoneNumber = provider['phone_number'].toString();
                var providerPrice = provider['price'].toString();
                var providerDescriptionSmall = provider['description_small'].toString();
                var providerId = provider['id']; // Assuming the provider object has an 'id' field
                var providerPhoto = '../assets/delivery.jpg'; // Path to provider photo in assets
                return Card(
                  elevation: 4, // Add elevation for a card-like appearance
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Expanded(
                        child: Image.asset(
                          providerPhoto,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(providerName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: $providerEmail'),
                          Text('Phone Number: $providerPhoneNumber'),
                          Text('Price: $providerPrice'),
                          Text('Description: $providerDescriptionSmall'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProviderProfilePage(providerId: providerId),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

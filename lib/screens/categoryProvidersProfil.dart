import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProviderProfilePage extends StatefulWidget {
  final int providerId;

  ProviderProfilePage({required this.providerId});

  @override
  _ProviderProfilePageState createState() => _ProviderProfilePageState();
}

class _ProviderProfilePageState extends State<ProviderProfilePage> {
  late Future<Map<String, dynamic>> _providerFuture;

  @override
  void initState() {
    super.initState();
    _providerFuture = fetchProviderDetails(widget.providerId);
  }

  Future<Map<String, dynamic>> fetchProviderDetails(int providerId) async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/providers/$providerId/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load provider details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder<Map<String, dynamic>>(
        future: _providerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var provider = snapshot.data!;
            var providerPhoto = 'assets/delivery.jpg';
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200, // Adjust the height of the photo as needed
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(providerPhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Name: ${provider['name']} ${provider['last_name']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Email: ${provider['email']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Gender: ${provider['gender']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Phone Number: ${provider['phone_number']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Price: ${provider['price']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Description Small: ${provider['description_small']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Description Big: ${provider['description_big']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

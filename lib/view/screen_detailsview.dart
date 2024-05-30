import 'package:airtable_project/controller.dart';
import 'package:flutter/material.dart';import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AirtableService airtableService = AirtableService();
  late Future<List<Map<String, dynamic>>> futureRecords;

  @override
  void initState() {
    super.initState();
    futureRecords = airtableService.fetchRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airtable Flutter Demo'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureRecords,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No records found'));
          } else {
            final records = snapshot.data!;
            return ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return ListTile(
                  title: Text(record['Name'] ?? 'No Name'), // Replace 'Name' with your field name
                  subtitle: Text(record['age'] ?? 'No Description'), // Replace with your field name
                );
              },
            );
          }
        },
      ),
    );
  }
}

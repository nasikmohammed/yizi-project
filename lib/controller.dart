import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AirtableService {
  final String baseId = dotenv.env['appDlDpCcSPitJeW7']!;
  final String apiKey = dotenv.env['patmmylqkt4ZdJQBr.1d2e3f07db6dcd63f486177ac34749f56bd94d5843c584fa0e79d0ea43490ea6']!;
  final String tableName = 'YourTableName'; // Replace with your table name

  Future<List<Map<String, dynamic>>> fetchRecords() async {
    final url = 'https://api.airtable.com/v0/$baseId/$tableName';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $apiKey'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> records = data['records'];
      return records.map((record) => record['fields'] as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load records');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class EventService {
  final String baseUrl = 'https://idpabih-8cf32-default-rtdb.europe-west1.firebasedatabase.app/events.json';

  Future<List<EventModel>> fetchEvents() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to load events');
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final List<EventModel> events = [];

    data.forEach((key, value) {
      events.add(EventModel.fromJson(value));
    });

    return events;
  }
}

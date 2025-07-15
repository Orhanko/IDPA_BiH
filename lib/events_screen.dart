import 'package:flutter/material.dart';
import 'package:idpa_bih/events_list.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("All Events", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: EventList(),
    );
  }
}

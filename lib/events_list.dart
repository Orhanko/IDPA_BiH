import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:idpa_bih/event_detail_screen.dart';
import 'package:idpa_bih/models/models.dart';
import 'package:idpa_bih/services/event_service.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:intl/intl.dart';

class EventList extends StatelessWidget {
  EventList({super.key});
  final EventService _eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventModel>>(
      future: _eventService.fetchEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No events found.'));
        }

        final now = DateTime.now();
        final upcoming = snapshot.data!.where((e) => DateFormat('dd.MM.yyyy').parse(e.startDate).isAfter(now)).toList();

        final past =
            snapshot.data!.where((e) => DateFormat('dd.MM.yyyy').parse(e.startDate).isBefore(now)).toList()..sort(
              (a, b) =>
                  DateFormat('dd.MM.yyyy').parse(b.startDate).compareTo(DateFormat('dd.MM.yyyy').parse(a.startDate)),
            );

        return ListView(
          children: [
            StickyHeader(
              header: _buildHeader('upcomingEvents'.tr(), context),
              content: _buildEventList(upcoming, context),
            ),
            StickyHeader(header: _buildHeader('pastEvents'.tr(), context), content: _buildEventList(past, context)),
          ],
        );
      },
    );
  }

  Widget _buildHeader(String title, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(128),
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  Widget _buildEventList(List<EventModel> events, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        final dateFormat = DateFormat('dd.MM.yyyy');
        final isPastEvent = dateFormat.parse(event.endDate).isBefore(DateTime.now());
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 20,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.white.withAlpha(50),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)));
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    Ink.image(image: NetworkImage(event.imgUrl), height: 250, fit: BoxFit.cover),
                    Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.onSecondaryFixed,
                            Theme.of(context).colorScheme.primary,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.name,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 16, color: Colors.white),
                                const SizedBox(width: 6),
                                Text(
                                  '${event.startDate} - ${event.endDate}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.white),
                                const SizedBox(width: 6),
                                Text(event.shootingRange.name, style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.phone, size: 16, color: Colors.white),
                                const SizedBox(width: 6),
                                Text(event.phone, style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                if (isPastEvent) Positioned.fill(child: Container(color: Colors.white.withAlpha(90))),
              ],
            ),
          ),
        );
      },
    );
  }
}

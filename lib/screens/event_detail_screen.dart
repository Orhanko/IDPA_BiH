import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:idpa_bih/models/models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:idpa_bih/services/monri_payment_service.dart';

const authenticityToken = '4bafba17eee548ca5e90c7ebdabf8ed690fb5e39';
const clientKey = 'key-6dcb2c7a0f7ea93166e92671ecd63b45';

class EventDetailScreen extends StatelessWidget {
  final EventModel event;
  static final String orderId = 'ORD-${DateTime.now().millisecondsSinceEpoch}';

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eventDetails'.tr(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(event.imgUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.name,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.arrow_circle_up_outlined, size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      'tier'.tr(),
                                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                event.tier,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_month, color: Colors.grey, size: 16),
                                  SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      'startDate'.tr(),
                                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                event.startDate,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_month, color: Colors.grey, size: 16),
                                  SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      'endDate'.tr(),
                                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                event.endDate,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('stagesResults'.tr(), style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text("practiscore.com", style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () async {
                      final Uri url = Uri.parse(event.practiscoreUrl);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } else {
                        return;
                      }
                    },
                  ),
                  ListTile(
                    title: Text('hotel'.tr(), style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(event.hotel.name, style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () async {
                      if (event.hotel.placeId == "--") return;
                      final Uri url = Uri.parse(
                        "https://www.google.com/maps/search/?api=1&query=Google&query_place_id=${event.hotel.placeId}",
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } else {
                        return;
                      }
                    },
                  ),
                  ListTile(
                    title: Text('shootingRange'.tr(), style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(event.shootingRange.name, style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () async {
                      final Uri url = Uri.parse(
                        "https://www.google.com/maps/search/?api=1&query=Google&query_place_id=${event.shootingRange.placeId}",
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } else {
                        return;
                      }
                    },
                  ),
                  ListTile(
                    title: Text("contactInfo".tr(), style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(event.phone, style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () async {
                      final Uri telUri = Uri(scheme: 'tel', path: event.phone.replaceAll(' ', ''));
                      if (await canLaunchUrl(telUri)) {
                        await launchUrl(telUri);
                      }
                    },
                  ),

                  ...event.agenda.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final isFirst = index == 0;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: isFirst ? "Pre-match: " : "Main match: ",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: item.name,
                                    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ...item.infoList.map((info) => Text('   • $info')),
                        ],
                      ),
                    );
                  }),

                  if (event.payment)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            splashFactory: NoSplash.splashFactory,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              try {
                                await launchMonriPayment(
                                  authenticityToken: dotenv.env['AUTH_TOKEN']!,
                                  clientKey: dotenv.env['CLIENT_KEY']!,
                                  eventName: event.name,
                                  amountCents: 1000,
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                              }
                            },
                            icon: const Icon(Icons.payment, size: 20),
                            label: Text('payNow'.tr(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(event.visitSuggestion.visitUrl);

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not launch URL')));
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        event.visitSuggestion.imageUrl,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(height: 180, width: double.infinity, color: Colors.white.withAlpha(130)),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'explore'.tr(args: [event.visitSuggestion.name]),
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [Shadow(offset: Offset(3, 5), blurRadius: 8, color: Colors.black54)],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

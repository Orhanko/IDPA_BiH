import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idpa_bih/events_list.dart';
import 'package:easy_localization/easy_localization.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('allEvents'.tr(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: 24,
                height: 24,
                child: getFlagForLocale(context.locale), // npr. BosnianIcon() ili slično
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (_) => Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Select language', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 12),
                            ...[
                              {'name': 'Bosnian', 'code': 'bs', 'img': 'assets/flags/ba.svg'},
                              {'name': 'Croatian', 'code': 'hr', 'img': 'assets/flags/hr.svg'},
                              {'name': 'English', 'code': 'en', 'img': 'assets/flags/eng.svg'},
                              {'name': 'Italian', 'code': 'it', 'img': 'assets/flags/it.svg'},
                              {'name': 'Hungarian', 'code': 'hu', 'img': 'assets/flags/hu.svg'},
                              {'name': 'Serbian', 'code': 'sr', 'img': 'assets/flags/sr.svg'},
                              {'name': 'Slovenian', 'code': 'sl', 'img': 'assets/flags/slo.svg'},
                              {'name': 'Turkish', 'code': 'tr', 'img': 'assets/flags/tr.svg'},
                            ].map(
                              (lang) => ListTile(
                                leading: SvgPicture.asset(lang['img']!, width: 32, height: 32),
                                title: Text(lang['name']!),
                                onTap: () {
                                  context.setLocale(Locale(lang['code']!));
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              );
            },
          ),
        ],
      ),
      body: EventList(),
    );
  }

  Widget getFlagForLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'bs':
        return SvgPicture.asset('assets/flags/ba.svg');
      case 'hr':
        return SvgPicture.asset('assets/flags/hr.svg');
      case 'en':
        return SvgPicture.asset('assets/flags/eng.svg');
      case 'tr':
        return SvgPicture.asset('assets/flags/tr.svg');
      case 'hu':
        return SvgPicture.asset('assets/flags/hu.svg');
      case 'it':
        return SvgPicture.asset('assets/flags/it.svg');
      case 'sr':
        return SvgPicture.asset('assets/flags/sr.svg');
      case 'sl':
        return SvgPicture.asset('assets/flags/slo.svg');
    }
    return const Icon(Icons.language, color: Colors.white);
  }
}

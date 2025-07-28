import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:idpa_bih/screens/events_screen.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late final AppLinks _appLinks;
bool _isDialogShowing = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('bs'),
        Locale('hr'),
        Locale('sr'),
        Locale('sl'),
        Locale('hu'),
        Locale('tr'),
        Locale('it'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initAppLinks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5E5DBA))),
      home: const EventsScreen(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

Future<void> initAppLinks() async {
  _appLinks = AppLinks();

  try {
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      handleMonriRedirect(initialUri.toString());
    }

    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        handleMonriRedirect(uri.toString());
      }
    });
  } catch (e) {
    return;
  }
}

DateTime? _lastDialogTime;

void handleMonriRedirect(String link) {
  final now = DateTime.now();
  if (_lastDialogTime != null && now.difference(_lastDialogTime!) < Duration(seconds: 2)) {
    return;
  }
  _lastDialogTime = now;
  String? title;
  String? message;

  if (link.contains('monri-success')) {
    title = '✅ ${'paymentSuccessful'.tr()}';
    message = 'paymentSuccessfulMessage'.tr();
  } else if (link.contains('monri-fail')) {
    title = '❌ ${'paymentFailed'.tr()}';
    message = 'paymentFailedMessage'.tr();
  } else {
    return;
  }

  _showDialogWithRetry(title, message);
}

void _showDialogWithRetry(String title, String message, {int maxAttempts = 10, int intervalMs = 300}) {
  int attempt = 0;
  Timer.periodic(Duration(milliseconds: intervalMs), (timer) {
    final context = navigatorKey.currentContext;
    attempt++;
    if (context != null && !_isDialogShowing) {
      timer.cancel();
      _showMonriDialog(context, title, message);
    } else if (attempt >= maxAttempts) {
      timer.cancel();
    }
  });
}

void _showMonriDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder:
        (_) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('ok'.tr()))],
        ),
  );
}

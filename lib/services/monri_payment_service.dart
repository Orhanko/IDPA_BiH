import 'package:url_launcher/url_launcher.dart';

Future<void> launchMonriPayment({
  required String authenticityToken,
  required String clientKey,
  required String eventName,
  required int amountCents,
}) async {
  final amount = amountCents.toString();
  final currency = "EUR";
  final orderInfo = "Kotizacija za $eventName";

  final params = {
    'authenticity_token': authenticityToken,
    'client_key': clientKey,
    'amount': amount,
    'currency': currency,
    'order_info': orderInfo,
    'language': "en",
  };

  final uri = Uri.parse("https://idpabih-8cf32.web.app").replace(queryParameters: params);

  final success = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!success) {
    throw Exception('❌ Ne mogu otvoriti eksterni browser za Monri checkout.');
  }
}

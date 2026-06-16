import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/services_catalog.dart';

Future<void> openConsultationEmail({String? topic}) async {
  final subject = topic == null
      ? '[소통웨어 상담] 프로젝트 문의'
      : '[소통웨어 상담] $topic';
  final body = ServicesCatalog.consultationEmailBody;
  final uri = Uri(
    scheme: 'mailto',
    path: ServicesCatalog.contactEmail,
    query: _encodeQuery({
      'subject': subject,
      'body': body,
    }),
  );
  if (!await launchUrl(uri)) {
    debugPrint('mailto 열기 실패: $uri');
  }
}

String? _encodeQuery(Map<String, String> params) {
  final entries = params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
  return entries.isEmpty ? null : entries;
}

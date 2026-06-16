import 'package:flutter/material.dart';

import '../data/services_catalog.dart';
import '../utils/contact_utils.dart';

class ServiceDetailPage extends StatelessWidget {
  const ServiceDetailPage({super.key, required this.service});

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: Text(
          service.title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(service.icon, size: 36, color: service.accentColor),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        service.summary,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.65,
                          color: Color(0xFF334155),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text(
                  '주요 기능',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 12),
                ...service.features.map(
                  (f) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle, color: Color(0xFF2563EB), size: 20),
                        const SizedBox(width: 10),
                        Expanded(child: Text(f, style: const TextStyle(height: 1.5))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  '상세 안내',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 8),
                Text(
                  service.id == 'monitoring'
                      ? '아래 섹션은 블로그·현장 자료를 바탕으로 순차적으로 채울 예정입니다.'
                      : '콘텐츠를 준비 중입니다. 빈 페이지라도 구조를 먼저 확인하실 수 있습니다.',
                  style: const TextStyle(color: Color(0xFF64748B), height: 1.5),
                ),
                const SizedBox(height: 20),
                ...service.detailSections.map(
                  (sec) => _PlaceholderSection(
                    title: sec.title,
                    body: sec.placeholder,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '프로젝트 상담',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        ServicesCatalog.contactEmail,
                        style: const TextStyle(color: Color(0xFFDBEAFE), fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        ServicesCatalog.responseTimeLabel,
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13),
                      ),
                      const SizedBox(height: 16),
                      FilledButton.tonal(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF2563EB),
                        ),
                        onPressed: () => openConsultationEmail(topic: service.title),
                        child: const Text('이메일로 상담 요청'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceholderSection extends StatelessWidget {
  const _PlaceholderSection({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Text(body, style: const TextStyle(color: Color(0xFF64748B), height: 1.55)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.schedule, size: 16, color: Color(0xFF94A3B8)),
                SizedBox(width: 6),
                Text(
                  '콘텐츠 준비 중',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../data/services_catalog.dart';
import '../utils/contact_utils.dart';
import '../widgets/showcase_image.dart';

class ServiceDetailPage extends StatelessWidget {
  const ServiceDetailPage({super.key, required this.service});

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      appBar: AppBar(
        backgroundColor: Colors.white.withValues(alpha: 0.92),
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
        title: Text(
          service.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _DetailHero(service: service),
            _DetailBody(service: service),
          ],
        ),
      ),
    );
  }
}

class _DetailHero extends StatelessWidget {
  const _DetailHero({required this.service});

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 44, 24, 34),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: service.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 760;
              final copy = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Text(
                      service.eyebrow,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    service.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.w900,
                      height: 1.08,
                      letterSpacing: -1.2,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    service.summary,
                    style: const TextStyle(
                      color: Color(0xFFFFF7FB),
                      fontSize: 17,
                      height: 1.7,
                    ),
                  ),
                ],
              );
              final visual = _HeroPreview(service: service);
              if (wide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: copy),
                    const SizedBox(width: 34),
                    Expanded(flex: 4, child: visual),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [copy, const SizedBox(height: 28), visual],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HeroPreview extends StatelessWidget {
  const _HeroPreview({required this.service});

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (service.imageAsset != null)
            ShowcaseImageCard(
              asset: service.imageAsset!,
              caption: service.imageCaption ?? service.title,
              aspectRatio: 1,
              compact: true,
            )
          else
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Icon(service.icon, color: Colors.white, size: 74),
              ),
            ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '핵심 가치',
                  style: TextStyle(
                    color: service.accentColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  service.outcomes.first,
                  style: const TextStyle(
                    color: Color(0xFF334155),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  const _DetailBody({required this.service});

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoGrid(
                service: service,
                sections: [
                  _InfoSection(title: '주요 기능', items: service.features),
                  _InfoSection(title: '추천 대상', items: service.audience),
                  _InfoSection(title: '기대 효과', items: service.outcomes),
                ],
              ),
              const SizedBox(height: 28),
              for (final section in service.detailSections) ...[
                _NarrativeCard(
                  service: service,
                  title: section.title,
                  body: section.body,
                ),
                const SizedBox(height: 16),
              ],
              const SizedBox(height: 14),
              _ConsultationCard(service: service),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoSection {
  const _InfoSection({required this.title, required this.items});

  final String title;
  final List<String> items;
}

class _InfoGrid extends StatelessWidget {
  const _InfoGrid({required this.service, required this.sections});

  final ServiceItem service;
  final List<_InfoSection> sections;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 860;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final section in sections)
              SizedBox(
                width: wide
                    ? (constraints.maxWidth - 32) / 3
                    : constraints.maxWidth,
                child: _ListCard(service: service, section: section),
              ),
          ],
        );
      },
    );
  }
}

class _ListCard extends StatelessWidget {
  const _ListCard({required this.service, required this.section});

  final ServiceItem service;
  final _InfoSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: service.accentColor.withValues(alpha: 0.16)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12312E81),
            blurRadius: 22,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 14),
          for (final item in section.items)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: service.accentColor,
                    size: 19,
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Color(0xFF475569),
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _NarrativeCard extends StatelessWidget {
  const _NarrativeCard({
    required this.service,
    required this.title,
    required this.body,
  });

  final ServiceItem service;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: service.accentColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: service.accentColor.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: service.accentColor,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: const TextStyle(
              color: Color(0xFF334155),
              height: 1.7,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConsultationCard extends StatelessWidget {
  const _ConsultationCard({required this.service});

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [service.gradientColors.first, service.gradientColors.last],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 640;
          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '서비스 문의',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${service.title} 제휴·도입·입점 문의를 이메일로 보내주세요.',
                style: const TextStyle(color: Color(0xFFFFF7FB), height: 1.6),
              ),
              const SizedBox(height: 10),
              SelectableText(
                ServicesCatalog.contactEmail,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          );
          final button = FilledButton(
            onPressed: () => openConsultationEmail(topic: service.title),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: service.accentColor,
            ),
            child: const Text('이메일로 문의하기'),
          );
          if (wide) {
            return Row(
              children: [
                Expanded(child: copy),
                const SizedBox(width: 22),
                button,
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [copy, const SizedBox(height: 20), button],
          );
        },
      ),
    );
  }
}

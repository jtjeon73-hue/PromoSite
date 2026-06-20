import 'package:flutter/material.dart';

import 'data/services_catalog.dart';
import 'pages/service_detail_page.dart';
import 'utils/contact_utils.dart';

void main() {
  runApp(const SotongPlatformApp());
}

class SotongPlatformApp extends StatelessWidget {
  const SotongPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF6D5DF6);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ServicesCatalog.brandName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F5FF),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xFF111827),
              displayColor: const Color(0xFF111827),
            ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            textStyle: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      home: const PlatformLandingPage(),
    );
  }
}

class PlatformLandingPage extends StatefulWidget {
  const PlatformLandingPage({super.key});

  @override
  State<PlatformLandingPage> createState() => _PlatformLandingPageState();
}

class _PlatformLandingPageState extends State<PlatformLandingPage> {
  final _scrollController = ScrollController();
  final _contactKey = GlobalKey();
  final _serviceKeys = {
    for (final service in ServicesCatalog.all) service.id: GlobalKey(),
  };

  void _openService(ServiceItem service) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ServiceDetailPage(service: service),
      ),
    );
  }

  void _scrollToService(ServiceItem service) {
    final target = _serviceKeys[service.id]?.currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 560),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }

  void _scrollToContact() {
    final target = _contactKey.currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 560),
      curve: Curves.easeOutCubic,
      alignment: 0.12,
    );
  }

  void _showConsultationGuide() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('문의 시 보내주실 내용'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '아래 항목을 함께 보내주시면 서비스 제휴·도입 검토가 빠릅니다.',
                style: TextStyle(color: Color(0xFF64748B), height: 1.5),
              ),
              const SizedBox(height: 18),
              for (final item in ServicesCatalog.consultationChecklist)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_outline, size: 18, color: Color(0xFF6D5DF6)),
                      const SizedBox(width: 8),
                      Expanded(child: Text(item, style: const TextStyle(height: 1.45))),
                    ],
                  ),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('닫기')),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              openConsultationEmail();
            },
            child: const Text('이메일 작성'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _AmbientBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                PlatformTopNavigation(
                  onServiceSelected: _scrollToService,
                  onContactTap: _scrollToContact,
                ),
                HeroSection(
                  onPrimaryTap: _scrollToContact,
                  onServiceTap: _scrollToService,
                ),
                ServicesShowcaseSection(
                  keysByServiceId: _serviceKeys,
                  onServiceTap: _openService,
                ),
                const PlatformJourneySection(),
                const BrandExperienceSection(),
                ContactSection(
                  key: _contactKey,
                  onEmailTap: openConsultationEmail,
                  onGuideTap: _showConsultationGuide,
                ),
                const FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF7F5FF), Color(0xFFEFF6FF), Color(0xFFFFF7ED)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SizedBox.expand(),
    );
  }
}

class PlatformTopNavigation extends StatelessWidget {
  const PlatformTopNavigation({
    super.key,
    required this.onServiceSelected,
    required this.onContactTap,
  });

  final void Function(ServiceItem service) onServiceSelected;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxWidth < 840;
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: compact ? 16 : 22,
                    vertical: compact ? 12 : 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.84),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.72)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A312E81),
                        blurRadius: 28,
                        offset: Offset(0, 14),
                      ),
                    ],
                  ),
                  child: compact
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                const _BrandMark(),
                                const Spacer(),
                                FilledButton.tonal(
                                  onPressed: onContactTap,
                                  child: const Text('문의'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            _MobileMenu(onTap: onServiceSelected),
                          ],
                        )
                      : Row(
                          children: [
                            const _BrandMark(),
                            const Spacer(),
                            for (final service in ServicesCatalog.all)
                              _NavItem(
                                label: service.title,
                                onTap: () => onServiceSelected(service),
                              ),
                            const SizedBox(width: 12),
                            FilledButton.icon(
                              onPressed: onContactTap,
                              icon: const Icon(Icons.mail_outline),
                              label: const Text('제휴 문의'),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6D5DF6), Color(0xFFFF6B8A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.forum_outlined, color: Colors.white),
        ),
        const SizedBox(width: 12),
        const Text(
          ServicesCatalog.brandName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: -0.4),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF334155),
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
        child: Text(label),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({required this.onTap});

  final void Function(ServiceItem service) onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final service in ServicesCatalog.all)
          ActionChip(
            avatar: Icon(service.icon, color: service.accentColor, size: 18),
            label: Text(service.title),
            onPressed: () => onTap(service),
            side: BorderSide(color: service.accentColor.withValues(alpha: 0.22)),
            backgroundColor: service.accentColor.withValues(alpha: 0.08),
          ),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onPrimaryTap,
    required this.onServiceTap,
  });

  final VoidCallback onPrimaryTap;
  final void Function(ServiceItem service) onServiceTap;

  @override
  Widget build(BuildContext context) {
    return _LandingSection(
      topPadding: 72,
      bottomPadding: 54,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 980;
          final content = _HeroCopy(onPrimaryTap: onPrimaryTap);
          final visual = _HeroVisual(onServiceTap: onServiceTap);
          if (wide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 11, child: content),
                const SizedBox(width: 46),
                Expanded(flex: 9, child: visual),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              content,
              const SizedBox(height: 34),
              visual,
            ],
          );
        },
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.onPrimaryTap});

  final VoidCallback onPrimaryTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final titleSize = width < 520 ? 42.0 : (width < 900 ? 56.0 : 68.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _GradientBadge(text: 'Flutter Web · Material 3 · Responsive Landing'),
        const SizedBox(height: 24),
        Text(
          ServicesCatalog.tagline,
          style: TextStyle(
            fontSize: titleSize,
            height: 1.04,
            letterSpacing: -2.3,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          ServicesCatalog.heroDescription,
          style: TextStyle(
            color: Color(0xFF475569),
            fontSize: 17,
            height: 1.75,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: onPrimaryTap,
              icon: const Icon(Icons.rocket_launch_outlined),
              label: const Text('제휴 문의하기'),
            ),
            OutlinedButton.icon(
              onPressed: () => openConsultationEmail(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                textStyle: const TextStyle(fontWeight: FontWeight.w800),
              ),
              icon: const Icon(Icons.alternate_email),
              label: const Text('이메일 작성'),
            ),
          ],
        ),
        const SizedBox(height: 34),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            for (final metric in ServicesCatalog.metrics)
              _MetricPill(metric: metric),
          ],
        ),
      ],
    );
  }
}

class _GradientBadge extends StatelessWidget {
  const _GradientBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFD8B4FE)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF6D28D9),
          fontSize: 13,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({required this.metric});

  final PlatformMetric metric;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.76),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(color: Color(0x12312E81), blurRadius: 20, offset: Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            metric.value,
            style: const TextStyle(
              color: Color(0xFF6D5DF6),
              fontSize: 30,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
          Text(metric.label, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(
            metric.description,
            style: const TextStyle(color: Color(0xFF64748B), fontSize: 12, height: 1.35),
          ),
        ],
      ),
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual({required this.onServiceTap});

  final void Function(ServiceItem service) onServiceTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1B4B), Color(0xFF312E81), Color(0xFF581C87)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(38),
        boxShadow: const [
          BoxShadow(color: Color(0x38312E81), blurRadius: 46, offset: Offset(0, 28)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -48,
            top: -54,
            child: _GlowOrb(color: const Color(0xFFFF6B8A).withValues(alpha: 0.45), size: 180),
          ),
          Positioned(
            left: -38,
            bottom: 18,
            child: _GlowOrb(color: const Color(0xFF38BDF8).withValues(alpha: 0.28), size: 170),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.dashboard_customize_outlined, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Platform Preview',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    Icon(Icons.circle, size: 10, color: Color(0xFF22C55E)),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              LayoutBuilder(
                builder: (context, constraints) {
                  final twoColumns = constraints.maxWidth > 430;
                  if (twoColumns) {
                    final tileWidth = (constraints.maxWidth - 14) / 2;
                    return Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      children: [
                        for (final service in ServicesCatalog.all)
                          SizedBox(
                            width: tileWidth,
                            height: 214,
                            child: _HeroServiceTile(
                              service: service,
                              onTap: () => onServiceTap(service),
                            ),
                          ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      for (final service in ServicesCatalog.all) ...[
                        SizedBox(
                          height: 154,
                          child: _HeroServiceTile(
                            service: service,
                            compact: true,
                            onTap: () => onServiceTap(service),
                          ),
                        ),
                        if (service != ServicesCatalog.all.last) const SizedBox(height: 12),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: color, blurRadius: 48, spreadRadius: 18)],
      ),
    );
  }
}

class _HeroServiceTile extends StatelessWidget {
  const _HeroServiceTile({
    required this.service,
    required this.onTap,
    this.compact = false,
  });

  final ServiceItem service;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(26),
        child: Ink(
          padding: EdgeInsets.all(compact ? 16 : 18),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.94),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _ServiceIconBubble(service: service, small: compact),
                  const Spacer(),
                  Icon(Icons.north_east, size: 18, color: service.accentColor),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.eyebrow,
                    style: TextStyle(
                      color: service.accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    service.title,
                    style: TextStyle(
                      fontSize: compact ? 18 : 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.6,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.shortDesc,
                    maxLines: compact ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Color(0xFF64748B), height: 1.45, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesShowcaseSection extends StatelessWidget {
  const ServicesShowcaseSection({
    super.key,
    required this.keysByServiceId,
    required this.onServiceTap,
  });

  final Map<String, GlobalKey> keysByServiceId;
  final void Function(ServiceItem service) onServiceTap;

  @override
  Widget build(BuildContext context) {
    return _LandingSection(
      topPadding: 58,
      bottomPadding: 34,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeading(
            eyebrow: 'Menu',
            title: '4개의 소통 메뉴',
            subtitle: '각 서비스가 독립적인 매력을 갖되, 하나의 플랫폼 브랜드로 자연스럽게 이어지도록 설계했습니다.',
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 940;
              return Wrap(
                spacing: 18,
                runSpacing: 18,
                children: [
                  for (final service in ServicesCatalog.all)
                    SizedBox(
                      key: keysByServiceId[service.id],
                      width: wide ? (constraints.maxWidth - 18) / 2 : constraints.maxWidth,
                      child: ServiceFeatureCard(
                        service: service,
                        onTap: () => onServiceTap(service),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ServiceFeatureCard extends StatelessWidget {
  const ServiceFeatureCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  final ServiceItem service;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.86),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: service.accentColor.withValues(alpha: 0.14)),
        boxShadow: const [
          BoxShadow(color: Color(0x14312E81), blurRadius: 28, offset: Offset(0, 16)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ServiceIconBubble(service: service),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.eyebrow,
                      style: TextStyle(
                        color: service.accentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -0.7),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service.shortDesc,
                      style: const TextStyle(color: Color(0xFF475569), height: 1.55, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in service.features.take(3))
                Chip(
                  label: Text(item),
                  labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  backgroundColor: service.accentColor.withValues(alpha: 0.08),
                  side: BorderSide(color: service.accentColor.withValues(alpha: 0.16)),
                ),
            ],
          ),
          const SizedBox(height: 22),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  service.gradientColors.first.withValues(alpha: 0.12),
                  service.gradientColors.last.withValues(alpha: 0.08),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              service.summary,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Color(0xFF334155), height: 1.6),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: FilledButton.tonalIcon(
                  onPressed: onTap,
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('자세히 보기'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceIconBubble extends StatelessWidget {
  const _ServiceIconBubble({required this.service, this.small = false});

  final ServiceItem service;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final size = small ? 44.0 : 58.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: service.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(small ? 16 : 20),
        boxShadow: [
          BoxShadow(
            color: service.accentColor.withValues(alpha: 0.24),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(service.icon, color: Colors.white, size: small ? 22 : 28),
    );
  }
}

class PlatformJourneySection extends StatelessWidget {
  const PlatformJourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    return _LandingSection(
      topPadding: 44,
      bottomPadding: 44,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(36),
          boxShadow: const [
            BoxShadow(color: Color(0x3320205A), blurRadius: 34, offset: Offset(0, 20)),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 860;
            final copy = const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DarkSectionLabel(text: 'Experience Flow'),
                SizedBox(height: 14),
                Text(
                  '발견에서 전환까지\n끊김 없는 플랫폼 여정',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    height: 1.18,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  '각 메뉴의 성격은 다르지만 사용자는 같은 화면 규칙, 같은 CTA, 같은 신뢰감 안에서 서비스를 탐색합니다.',
                  style: TextStyle(color: Color(0xFFCBD5E1), height: 1.7, fontSize: 16),
                ),
              ],
            );
            final steps = const _JourneySteps();
            if (wide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: copy),
                  const SizedBox(width: 32),
                  Expanded(flex: 6, child: steps),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                copy,
                const SizedBox(height: 30),
                steps,
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DarkSectionLabel extends StatelessWidget {
  const _DarkSectionLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFA78BFA),
        fontSize: 13,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _JourneySteps extends StatelessWidget {
  const _JourneySteps();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        for (var i = 0; i < ServicesCatalog.platformSteps.length; i++)
          SizedBox(
            width: 230,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '0${i + 1}',
                    style: const TextStyle(
                      color: Color(0xFFFFB4C8),
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    ServicesCatalog.platformSteps[i],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 17),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _stepDescription(i),
                    style: const TextStyle(color: Color(0xFFCBD5E1), height: 1.5, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  static String _stepDescription(int index) {
    return switch (index) {
      0 => '사용자의 관심사와 상황을 명확한 서비스 카드로 안내합니다.',
      1 => '4개 메뉴 중 필요한 서비스를 빠르게 선택하도록 돕습니다.',
      2 => '콘텐츠, 기록, 매칭, 농장 데이터를 서비스별 톤으로 제공합니다.',
      _ => '문의, 상담, 입점, 제휴로 이어지는 전환 동선을 제공합니다.',
    };
  }
}

class BrandExperienceSection extends StatelessWidget {
  const BrandExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _LandingSection(
      topPadding: 44,
      bottomPadding: 44,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeading(
            eyebrow: 'Design System',
            title: '고급 랜딩페이지 디자인',
            subtitle: '부드러운 그라데이션, 유리 질감 카드, 명확한 CTA, 서비스별 컬러를 사용해 프리미엄 브랜드 인상을 만듭니다.',
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 900;
              final cards = [
                const _ExperienceCard(
                  icon: Icons.phone_iphone_outlined,
                  title: '반응형 레이아웃',
                  desc: '모바일에서는 칩 메뉴와 단일 컬럼, 데스크톱에서는 넓은 히어로와 그리드 카드로 자동 전환됩니다.',
                ),
                const _ExperienceCard(
                  icon: Icons.palette_outlined,
                  title: 'Material 3 감성',
                  desc: 'ColorScheme, FilledButton, Chip, Card 계열 위젯을 Material 3 스타일로 통일했습니다.',
                ),
                const _ExperienceCard(
                  icon: Icons.auto_graph_outlined,
                  title: '전환 중심 구성',
                  desc: '서비스 탐색, 상세 확인, 문의 작성까지 랜딩페이지의 핵심 목적이 이어지도록 배치했습니다.',
                ),
              ];
              if (wide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < cards.length; i++) ...[
                      if (i > 0) const SizedBox(width: 18),
                      Expanded(child: cards[i]),
                    ],
                  ],
                );
              }
              return Column(
                children: [
                  for (var i = 0; i < cards.length; i++) ...[
                    if (i > 0) const SizedBox(height: 18),
                    cards[i],
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  final IconData icon;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.84),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(color: Color(0x12312E81), blurRadius: 24, offset: Offset(0, 12)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFF6D5DF6).withValues(alpha: 0.11),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: const Color(0xFF6D5DF6)),
          ),
          const SizedBox(height: 18),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(color: Color(0xFF64748B), height: 1.65)),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.onEmailTap,
    required this.onGuideTap,
  });

  final Future<void> Function({String? topic}) onEmailTap;
  final VoidCallback onGuideTap;

  @override
  Widget build(BuildContext context) {
    return _LandingSection(
      topPadding: 44,
      bottomPadding: 68,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6D5DF6), Color(0xFFEC4899), Color(0xFFF97316)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(38),
          boxShadow: const [
            BoxShadow(color: Color(0x33581C87), blurRadius: 38, offset: Offset(0, 20)),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 760;
            final copy = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '소통 플랫폼과 함께할 준비가 되셨나요?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    height: 1.22,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  '서비스 제휴, 입점, 콘텐츠 협업, Flutter Web 개발 문의를 이메일로 보내주세요.',
                  style: TextStyle(color: Color(0xFFFFE4F0), fontSize: 16, height: 1.7),
                ),
                const SizedBox(height: 18),
                SelectableText(
                  ServicesCatalog.contactEmail,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 8),
                Text(
                  ServicesCatalog.responseTimeLabel,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.84), fontSize: 13),
                ),
              ],
            );
            final actions = Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton.icon(
                  onPressed: () => onEmailTap(),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6D5DF6),
                  ),
                  icon: const Icon(Icons.mail),
                  label: const Text('이메일로 문의하기'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: onGuideTap,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white70),
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                    textStyle: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  icon: const Icon(Icons.checklist_outlined),
                  label: const Text('문의 항목 보기'),
                ),
              ],
            );
            if (wide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: copy),
                  const SizedBox(width: 30),
                  SizedBox(width: 280, child: actions),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                copy,
                const SizedBox(height: 28),
                actions,
              ],
            );
          },
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      color: const Color(0xFF080B1A),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Wrap(
            spacing: 16,
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            children: [
              const Text(
                '© 2026 소통 플랫폼',
                style: TextStyle(color: Color(0xFFCBD5E1), fontWeight: FontWeight.w700),
              ),
              Text(
                ServicesCatalog.all.map((service) => service.title).join(' · '),
                style: const TextStyle(color: Color(0xFF94A3B8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  final String eyebrow;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            color: Color(0xFF6D5DF6),
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 36,
            height: 1.16,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            subtitle,
            style: const TextStyle(color: Color(0xFF64748B), height: 1.7, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class _LandingSection extends StatelessWidget {
  const _LandingSection({
    required this.child,
    this.topPadding = 56,
    this.bottomPadding = 56,
  });

  final Widget child;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width < 620 ? 18.0 : 32.0;
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, topPadding, horizontal, bottomPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: child,
        ),
      ),
    );
  }
}

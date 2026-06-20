import 'package:flutter/material.dart';

import 'data/services_catalog.dart';
import 'pages/service_detail_page.dart';
import 'utils/contact_utils.dart';
import 'widgets/showcase_image.dart';

void main() {
  runApp(const PromoSiteApp());
}

class PromoSiteApp extends StatelessWidget {
  const PromoSiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ServicesCatalog.brandName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
      ),
      home: const PromoHomePage(),
    );
  }
}

class PromoHomePage extends StatefulWidget {
  const PromoHomePage({super.key});

  @override
  State<PromoHomePage> createState() => _PromoHomePageState();
}

class _PromoHomePageState extends State<PromoHomePage> {
  final _scrollController = ScrollController();
  final _contactKey = GlobalKey();

  void _openService(BuildContext context, ServiceItem service) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => ServiceDetailPage(service: service)),
    );
  }

  void _scrollToContact() {
    final target = _contactKey.currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _showConsultationGuide() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('상담 시 보내주실 내용'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '아래 항목을 이메일에 적어 주시면 검토가 빠릅니다.',
                style: TextStyle(color: Color(0xFF64748B), height: 1.5),
              ),
              const SizedBox(height: 16),
              ...ServicesCatalog.consultationChecklist.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontWeight: FontWeight.w700)),
                      Expanded(child: Text(item, style: const TextStyle(height: 1.45))),
                    ],
                  ),
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
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            TopNavigation(
              onServiceTap: (s) => _openService(context, s),
              onConsultTap: _scrollToContact,
            ),
            HeroSection(onConsultTap: () => openConsultationEmail()),
            BusinessMixSection(onTap: (id) {
              final s = ServicesCatalog.byId(id);
              if (s != null) _openService(context, s);
            }),
            ServiceSection(onTap: (s) => _openService(context, s)),
            AreaHighlightsSection(onTap: (s) => _openService(context, s)),
            const CompanyAboutSection(),
            const StrengthSection(),
            ContactSection(
              key: _contactKey,
              onEmailTap: openConsultationEmail,
              onGuideTap: _showConsultationGuide,
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

class TopNavigation extends StatelessWidget {
  const TopNavigation({super.key, this.onServiceTap, this.onConsultTap});

  final void Function(ServiceItem)? onServiceTap;
  final VoidCallback? onConsultTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 1120;
          return Row(
            children: [
              const Icon(Icons.hub_outlined, color: Color(0xFF2563EB)),
              const SizedBox(width: 10),
              Text(
                ServicesCatalog.brandName,
                style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),
              const Spacer(),
              if (isCompact) ...[
                PopupMenuButton<ServiceItem>(
                  tooltip: '메뉴',
                  icon: const Icon(Icons.menu),
                  onSelected: (service) => onServiceTap?.call(service),
                  itemBuilder: (context) => [
                    for (final service in ServicesCatalog.all)
                      PopupMenuItem<ServiceItem>(
                        value: service,
                        child: Text(service.title),
                      ),
                  ],
                ),
                const SizedBox(width: 8),
              ] else ...[
                for (final service in ServicesCatalog.all)
                  _NavItem(service.menuLabel, () => onServiceTap?.call(service)),
                const SizedBox(width: 16),
              ],
              FilledButton(
                onPressed: onConsultTap,
                child: const Text('상담 요청'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _NavItem(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, this.onConsultTap});

  final VoidCallback? onConsultTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 72),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF1D4ED8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Wrap(
            spacing: 48,
            runSpacing: 36,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 580,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Badge('Automation · Smart Farm · Energy · YouTube · Store · App'),
                    const SizedBox(height: 24),
                    Text(
                      ServicesCatalog.tagline.replaceAll('\n', ' '),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '산업자동화 모니터링, 스마트팜·농촌 개발, 에너지관리, '
                      '유튜브·스토어·앱 개발을 홍보와 운영 흐름으로 연결합니다. '
                      '현장 데이터부터 콘텐츠·판매 채널까지 맞춤 개발합니다.',
                      style: TextStyle(
                        color: Color(0xFFE0E7FF),
                        fontSize: 17,
                        height: 1.65,
                      ),
                    ),
                    const SizedBox(height: 32),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white54),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      ),
                      onPressed: onConsultTap,
                      icon: const Icon(Icons.mail_outline),
                      label: const Text('이메일 상담'),
                    ),
                  ],
                ),
              ),
              const HeroSummaryCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
    );
  }
}

class HeroSummaryCard extends StatelessWidget {
  const HeroSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 28, offset: Offset(0, 16)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('사업 영역', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
          const SizedBox(height: 18),
          for (final area in ServicesCatalog.businessMix)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 36,
                    decoration: BoxDecoration(
                      color: area.color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      area.label.replaceAll('\n', ' '),
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ),
                  Text(
                    area.keyword,
                    style: TextStyle(fontWeight: FontWeight.w600, color: area.color, fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class BusinessMixSection extends StatelessWidget {
  const BusinessMixSection({super.key, required this.onTap});

  final void Function(String id) onTap;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: '메인 메뉴 구성',
      subtitle: '6개 주력 사업을 홍보·마케팅 사이트의 핵심 진입 메뉴로 구성했습니다.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth > 1080
              ? (constraints.maxWidth - 40) / 3
              : constraints.maxWidth > 720
                  ? (constraints.maxWidth - 20) / 2
                  : constraints.maxWidth;

          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for (final area in ServicesCatalog.businessMix)
                if (ServicesCatalog.byId(area.id) case final service?)
                  SizedBox(
                    width: cardWidth,
                    child: _MixCard(
                      area: area,
                      service: service,
                      onTap: () => onTap(area.id),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}

class _MixCard extends StatelessWidget {
  const _MixCard({
    required this.area,
    required this.service,
    required this.onTap,
    this.tall = false,
  });

  final BusinessArea area;
  final ServiceItem service;
  final VoidCallback onTap;
  final bool tall;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(tall ? 28 : 22),
          decoration: BoxDecoration(
            color: area.color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: area.color.withValues(alpha: 0.35)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(service.icon, color: area.color, size: tall ? 32 : 26),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: area.color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      area.keyword,
                      style: TextStyle(color: area.color, fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(height: tall ? 16 : 12),
              Text(
                service.title,
                style: TextStyle(fontSize: tall ? 22 : 17, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Text(
                service.shortDesc,
                style: const TextStyle(color: Color(0xFF475569), height: 1.5, fontSize: 14),
              ),
              SizedBox(height: tall ? 20 : 14),
              Row(
                children: [
                  Text('자세히 보기', style: TextStyle(color: area.color, fontWeight: FontWeight.w700)),
                  Icon(Icons.arrow_forward, size: 16, color: area.color),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key, required this.onTap});

  final void Function(ServiceItem) onTap;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: '6대 주력 개발 서비스',
      subtitle: '각 메뉴를 클릭하면 상세 페이지로 이동합니다. 콘텐츠는 순차적으로 채웁니다.',
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          for (final s in ServicesCatalog.all)
            SizedBox(
              width: 320,
              child: ServiceCard(service: s, onTap: () => onTap(s)),
            ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service, required this.onTap});

  final ServiceItem service;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: service.accentColor.withValues(alpha: 0.35)),
            boxShadow: const [
              BoxShadow(color: Color(0x0F000000), blurRadius: 18, offset: Offset(0, 10)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(service.icon, size: 30, color: service.accentColor),
              const SizedBox(height: 16),
              Text(service.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
              const SizedBox(height: 10),
              Text(service.shortDesc, style: const TextStyle(color: Color(0xFF475569), height: 1.5, fontSize: 14)),
              const SizedBox(height: 14),
              Row(
                children: [
                  Text('자세히 보기', style: TextStyle(color: service.accentColor, fontWeight: FontWeight.w700)),
                  Icon(Icons.arrow_forward, size: 16, color: service.accentColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AreaHighlightsSection extends StatelessWidget {
  const AreaHighlightsSection({super.key, required this.onTap});

  final void Function(ServiceItem) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < ServicesCatalog.all.length; i++)
          _AreaBlock(
            service: ServicesCatalog.all[i],
            title: ServicesCatalog.all[i].title,
            subtitle: ServicesCatalog.all[i].shortDesc,
            chips: ServicesCatalog.all[i].highlightChips,
            dark: i.isEven,
            onTap: () => onTap(ServicesCatalog.all[i]),
            imageAsset: ServicesCatalog.all[i].imageAsset,
            imageCaption: ServicesCatalog.all[i].imageCaption,
            visual: ServicesCatalog.all[i].id == 'apps' ? const _AppShowcaseVisual() : null,
          ),
      ],
    );
  }
}

class _AreaBlock extends StatelessWidget {
  const _AreaBlock({
    required this.service,
    required this.title,
    required this.subtitle,
    required this.chips,
    required this.dark,
    required this.onTap,
    this.imageAsset,
    this.imageCaption,
    this.visual,
  });

  final ServiceItem service;
  final String title;
  final String subtitle;
  final List<String> chips;
  final bool dark;
  final VoidCallback onTap;
  final String? imageAsset;
  final String? imageCaption;
  final Widget? visual;

  @override
  Widget build(BuildContext context) {
    final bg = dark ? const Color(0xFF0F172A) : service.accentColor.withValues(alpha: 0.08);
    final fg = dark ? Colors.white : const Color(0xFF0F172A);
    final subFg = dark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);

    Widget? sideVisual;
    if (visual != null) {
      sideVisual = visual;
    } else if (imageAsset != null) {
      sideVisual = _ThemeImagePanel(asset: imageAsset!, caption: imageCaption);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 44),
      color: bg,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900 && sideVisual != null;
              final content = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: fg, fontSize: 26, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  Text(subtitle, style: TextStyle(color: subFg, fontSize: 16)),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: chips
                        .map((c) => Chip(
                              label: Text(c, style: TextStyle(color: fg, fontSize: 13)),
                              backgroundColor: service.accentColor.withValues(alpha: dark ? 0.2 : 0.12),
                              side: BorderSide(color: service.accentColor.withValues(alpha: 0.4)),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: onTap,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: fg,
                      side: BorderSide(color: dark ? Colors.white38 : service.accentColor.withValues(alpha: 0.5)),
                    ),
                    icon: const Icon(Icons.open_in_new, size: 18),
                    label: const Text('상세 페이지'),
                  ),
                ],
              );

              if (!isWide) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (sideVisual != null) ...[sideVisual, const SizedBox(height: 24)],
                    content,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: content),
                  const SizedBox(width: 32),
                  SizedBox(width: 320, child: sideVisual),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ThemeImagePanel extends StatelessWidget {
  const _ThemeImagePanel({required this.asset, this.caption});

  final String asset;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    return ShowcaseImageCard(asset: asset, caption: caption ?? '');
  }
}

class _AppShowcaseVisual extends StatelessWidget {
  const _AppShowcaseVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            '개발 앱 사례',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            alignment: WrapAlignment.center,
            children: [
              for (final item in ServicesCatalog.appShowcaseImages)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(item.$1, width: 72, height: 72, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.$2,
                      style: const TextStyle(color: Color(0xFFC4B5FD), fontSize: 11),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class CompanyAboutSection extends StatelessWidget {
  const CompanyAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: '회사 소개',
      subtitle: '1인 개발 체제 · 필요 시 협업 · 전국 원격·출장·현장 방문',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Text(
              ServicesCatalog.companyIntro,
              style: const TextStyle(fontSize: 16, height: 1.75, color: Color(0xFF334155)),
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 800;
              final cards = [
                _AboutCard(
                  icon: Icons.route_outlined,
                  title: '일하는 방식',
                  items: ServicesCatalog.workStyleItems,
                  color: const Color(0xFF2563EB),
                ),
                _AboutCard(
                  icon: Icons.map_outlined,
                  title: '지역·상담',
                  items: ServicesCatalog.serviceAreaItems,
                  color: const Color(0xFF16A34A),
                ),
                _AboutCard(
                  icon: Icons.groups_outlined,
                  title: '이런 분께 맞습니다',
                  items: ServicesCatalog.targetClients,
                  color: const Color(0xFF7C3AED),
                ),
              ];
              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < cards.length; i++) ...[
                      if (i > 0) const SizedBox(width: 16),
                      Expanded(child: cards[i]),
                    ],
                  ],
                );
              }
              return Column(
                children: [
                  for (var i = 0; i < cards.length; i++) ...[
                    if (i > 0) const SizedBox(height: 16),
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

class _AboutCard extends StatelessWidget {
  const _AboutCard({
    required this.icon,
    required this.title,
    required this.items,
    required this.color,
  });

  final IconData icon;
  final String title;
  final List<String> items;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: color)),
          const SizedBox(height: 12),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: TextStyle(color: color, fontWeight: FontWeight.w700)),
                  Expanded(
                    child: Text(item, style: const TextStyle(height: 1.55, color: Color(0xFF475569), fontSize: 14)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class StrengthSection extends StatelessWidget {
  const StrengthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: '소통웨어 디지털랩의 강점',
      subtitle: '현장 시스템부터 콘텐츠·판매 채널까지 이어지는 홍보·마케팅 개발 역량.',
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            for (var i = 0; i < ServicesCatalog.all.length; i++)
              StrengthItem(
                number: '${i + 1}'.padLeft(2, '0'),
                title: ServicesCatalog.all[i].menuLabel,
                desc: ServicesCatalog.all[i].shortDesc,
              ),
          ],
        ),
      ),
    );
  }
}

class StrengthItem extends StatelessWidget {
  final String number;
  final String title;
  final String desc;
  const StrengthItem({super.key, required this.number, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: const TextStyle(color: Color(0xFF2563EB), fontSize: 28, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(color: Color(0xFF475569), height: 1.6)),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.onEmailTap, required this.onGuideTap});

  final Future<void> Function({String? topic}) onEmailTap;
  final VoidCallback onGuideTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        padding: const EdgeInsets.all(42),
        constraints: const BoxConstraints(maxWidth: 1180),
        decoration: BoxDecoration(
          color: const Color(0xFF2563EB),
          borderRadius: BorderRadius.circular(32),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 700;
            final info = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '프로젝트 상담을 요청해 주세요',
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, height: 1.25),
                ),
                const SizedBox(height: 12),
                const Text(
                  '산업자동화 · 스마트팜·농촌 · 에너지관리 · 유튜브 · 스토어 · 앱 개발 요구사항을 '
                  '이메일로 보내주시면 '
                  '검토 후 회신드립니다. 상담은 이메일로만 진행합니다.',
                  style: TextStyle(color: Color(0xFFDBEAFE), fontSize: 16, height: 1.65),
                ),
                const SizedBox(height: 20),
                SelectableText(
                  ServicesCatalog.contactEmail,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Text(
                  ServicesCatalog.responseTimeLabel,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 14),
                ),
                const SizedBox(height: 20),
                const Text(
                  '다루는 상담',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15),
                ),
                const SizedBox(height: 8),
                ...ServicesCatalog.consultationTopics.map(
                  (t) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('· $t', style: const TextStyle(color: Color(0xFFDBEAFE), height: 1.5)),
                  ),
                ),
              ],
            );

            final actions = Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton.tonalIcon(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF2563EB),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                  onPressed: () => onEmailTap(),
                  icon: const Icon(Icons.mail),
                  label: const Text('이메일로 문의하기'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white54),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                  onPressed: onGuideTap,
                  icon: const Icon(Icons.checklist_outlined),
                  label: const Text('보내주실 내용 보기'),
                ),
              ],
            );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: info),
                  const SizedBox(width: 32),
                  SizedBox(width: 260, child: actions),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [info, const SizedBox(height: 28), actions],
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
      padding: const EdgeInsets.all(28),
      color: const Color(0xFF020617),
      child: Center(
        child: Text(
          '© 2026 ${ServicesCatalog.brandName} · 산업자동화 · 스마트팜·농촌 · 에너지관리 · 유튜브 · 스토어 · 앱',
          style: const TextStyle(color: Color(0xFF94A3B8)),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  const _Section({required this.title, required this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 56),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF0F172A))),
              const SizedBox(height: 10),
              Text(subtitle, style: const TextStyle(fontSize: 16, color: Color(0xFF64748B), height: 1.6)),
              const SizedBox(height: 28),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

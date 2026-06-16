import 'package:flutter/material.dart';

/// 홍보 사이트 서비스 — 산업 모니터링 · 스마트팜 · 앱 개발.
class ServiceItem {
  const ServiceItem({
    required this.id,
    required this.title,
    required this.shortDesc,
    required this.icon,
    required this.summary,
    required this.features,
    this.detailSections = const [],
    this.accentColor = const Color(0xFF2563EB),
    this.imageAsset,
    this.imageCaption,
  });

  final String id;
  final String title;
  final String shortDesc;
  final IconData icon;
  final String summary;
  final List<String> features;
  final List<ServiceDetailSection> detailSections;
  final Color accentColor;
  final String? imageAsset;
  final String? imageCaption;
}

class ServiceDetailSection {
  const ServiceDetailSection({
    required this.title,
    required this.placeholder,
    this.imageAsset,
    this.imageCaption,
  });

  final String title;
  final String placeholder;
  final String? imageAsset;
  final String? imageCaption;
}

class BusinessArea {
  const BusinessArea({
    required this.label,
    required this.keyword,
    required this.color,
  });

  final String label;
  final String keyword;
  final Color color;
}

class ServicesCatalog {
  ServicesCatalog._();

  static const brandName = '소통웨어 디지털랩';
  static const tagline = '현장 경험을 디지털 서비스로 연결하는\n개발 파트너';
  static const contactEmail = 'sotongware@naver.com';
  static const responseTimeLabel = '영업일 기준 2~3일 내 이메일 회신';

  static const companyIntro = '''
소통웨어 디지털랩은 공장·농장·현장에서 쌓은 경험을 바탕으로
산업 모니터링, 스마트팜 관제, 앱·소프트웨어를 설계·개발합니다.

1인 개발 체제로 요구사항을 빠르게 파악하고 직접 구현합니다.
규모나 일정에 따라 협업 파트너와 함께 진행할 수 있습니다.''';

  static const workStyleItems = [
    '현장·요구사항 파악 → 화면·구조 설계 → 단계별 개발',
    'PLC·MES·DB·센서 등 기존 환경과의 연동을 전제로 설계',
    '운영·유지보수까지 고려한 구조로 개발',
  ];

  static const serviceAreaItems = [
    '전국 어디나 출장·현장 방문 가능',
    '원격 개발·화면 공유 미팅 지원',
    '이메일(sotongware@naver.com)로 상담 접수',
  ];

  static const targetClients = [
    '공장·조립라인 모니터링이 필요한 제조·자동화 업체',
    '스마트팜·농장 관제를 구축하려는 농가·시공사',
    '현장·농업·서비스용 맞춤 앱을 개발하려는 사업자',
  ];

  static const consultationTopics = [
    '신규 모니터링·관제·앱 개발',
    '기존 시스템(PLC, MES, DB) 연동',
    '대시보드·그래프·알람 기능 추가',
    'Flutter 앱·웹·Windows 포팅',
  ];

  static const consultationChecklist = [
    '문의 분야 (모니터링 / 스마트팜 / 앱개발)',
    '현장·사업 개요',
    '연동·장비 환경 (PLC, MES, 센서 등)',
    '원하시는 기능·화면',
    '희망 일정·예산 범위',
    '연락처',
  ];

  static const consultationEmailBody = '''안녕하세요. 소통웨어 디지털랩에 프로젝트 상담을 요청합니다.

1. 문의 분야: (모니터링 / 스마트팜 / 앱개발)
2. 현장·사업 개요:
3. 연동·장비 환경: (PLC, MES, 센서 등)
4. 원하시는 기능·화면:
5. 희망 일정·예산 범위:
6. 연락처:

감사합니다.''';

  static const businessMix = [
    BusinessArea(
      label: '산업자동화\n모니터링 시스템',
      keyword: '공장·조립라인',
      color: Color(0xFF2563EB),
    ),
    BusinessArea(
      label: '스마트팜\n개발',
      keyword: '온실·축사 관제',
      color: Color(0xFF16A34A),
    ),
    BusinessArea(
      label: '앱·소프트웨어\n개발',
      keyword: 'Flutter·웹·Windows',
      color: Color(0xFF7C3AED),
    ),
  ];

  static const List<ServiceItem> all = [
    ServiceItem(
      id: 'monitoring',
      title: '산업자동화 모니터링 시스템',
      shortDesc: '공장·조립라인 Tool·PLC·MES 연동, 데이터 수집·분석·시각화',
      icon: Icons.precision_manufacturing_outlined,
      accentColor: Color(0xFF2563EB),
      summary:
          '생산·제조 현장의 설비·조립·물류 상태를 모니터링합니다. '
          '조립 Tool에서 데이터를 수집하고, PLC와 연동해 물류 흐름·제어 상태를 파악하며, '
          '수집 정보를 Excel(CSV)·내부 DB·MES로 전달합니다. '
          '맞춤형 분석·그래프·리포트 모듈도 함께 개발합니다.',
      features: [
        '조립 Tool 연동 — 토크·체결·공정 데이터 수집',
        'PLC 연동 — 물류 흐름·제어 상태',
        '데이터 저장 — CSV/Excel·내부 DB',
        'MES 연동 — 상위 시스템 데이터 전송',
        '대시보드·알람·이력 조회',
        '맞춤형 분석·그래프·통계 모듈',
      ],
      detailSections: [
        ServiceDetailSection(
          title: 'Tool 연동 (조립·체결)',
          placeholder: '블로그·현장 사례 콘텐츠를 이 영역에 추가 예정입니다.',
        ),
        ServiceDetailSection(
          title: 'PLC 연동 (물류·제어)',
          placeholder: 'PLC 통신·상태 모니터링·제어 연동 상세를 채울 예정입니다.',
        ),
        ServiceDetailSection(
          title: '데이터 수집·저장·MES',
          placeholder: 'CSV/Excel, 내부 DB, MES 전송 흐름을 정리할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '모니터링 화면·대시보드',
          placeholder: '현장 모니터링 UI·그래프·알람 화면 예시를 추가할 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'smartfarm',
      title: '스마트팜 개발',
      shortDesc: '온실·축사 환경 관제, 센서·제어·데이터 시각화',
      icon: Icons.agriculture_outlined,
      accentColor: Color(0xFF16A34A),
      imageAsset: 'assets/images/app_farmjigi_logo.png',
      imageCaption: '스마트팜 관제·농장 앱 개발 사례',
      summary:
          '스마트팜 현장에 맞는 관제·데이터 수집·알림 시스템을 개발합니다. '
          '온습도·CO₂·일사량 등 센서 데이터를 모으고, 제어 장비와 연동하며, '
          'PC·모바일에서 상태를 확인할 수 있는 구조를 설계합니다.',
      features: [
        '온실·축사 환경 센서 데이터 수집',
        '온습도·환기·관수 등 제어 연동',
        '실시간·이력 그래프·알람',
        'PC 관제 화면·모바일 보조 앱',
        '농장 맞춤형 대시보드',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '스마트팜 관제 시스템',
          placeholder: '스마트팜 관제·센서 연동 사례를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '농장 데이터·그래프',
          placeholder: '환경 데이터 분석·리포트 화면을 채울 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'apps',
      title: '앱·소프트웨어 개발',
      shortDesc: 'Flutter 모바일, 웹, Windows — 현장·생활·서비스 등 다양한 분야',
      icon: Icons.apps_outlined,
      accentColor: Color(0xFF7C3AED),
      summary:
          '고객·현장·서비스 목적에 맞는 앱과 소프트웨어를 개발합니다. '
          '농산물 직거래·스마트팜 보조, 현장 입력·관제, 생활·콘텐츠 서비스, '
          'Windows·웹 연동 프로그램, AI·자동화 연계까지 폭넓게 대응합니다.',
      features: [
        'Flutter — Android·웹·Windows 앱',
        '농업·직거래·현장 입력 앱',
        '관제·알림·리포트 보조 앱',
        '생활·서비스·콘텐츠 앱',
        'Python·AI 리포트·반복 업무 자동화',
        '기존 시스템·API 연동',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '농업·현장 앱',
          placeholder: '농산물·스마트팜·현장 입력 앱 사례를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '생활·서비스 앱',
          placeholder: '다양한 서비스 앱 포트폴리오를 채울 예정입니다.',
        ),
        ServiceDetailSection(
          title: 'AI·자동화 연계',
          placeholder: 'AI 분석·자동화 적용 사례를 추가할 예정입니다.',
        ),
      ],
    ),
  ];

  static const appShowcaseImages = [
  ('assets/images/app_farmjigi_logo.png', '스마트팜·농장'),
  ('assets/images/app_farmdirect_icon.png', '농산물 직거래'),
  ('assets/images/app_saju_icon.png', '생활·서비스 앱'),
  ];

  static ServiceItem? byId(String id) {
    for (final s in all) {
      if (s.id == id) return s;
    }
    return null;
  }
}

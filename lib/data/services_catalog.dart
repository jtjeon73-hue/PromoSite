import 'package:flutter/material.dart';

/// 홍보 사이트 서비스 — 6개 주력 사업 카탈로그.
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
    required this.id,
    required this.label,
    required this.keyword,
    required this.color,
  });

  final String id;
  final String label;
  final String keyword;
  final Color color;
}

class ServicesCatalog {
  ServicesCatalog._();

  static const brandName = '소통웨어 디지털랩';
  static const tagline = '6개 주력 사업으로 현장과 고객을 연결하는\n디지털 개발 파트너';
  static const contactEmail = 'sotongware@naver.com';
  static const responseTimeLabel = '영업일 기준 2~3일 내 이메일 회신';

  static const companyIntro = '''
소통웨어 디지털랩은 공장·농장·에너지·콘텐츠·커머스 현장에서 필요한
산업자동화, 스마트팜·농촌, 에너지관리, 유튜브, 스토어, 앱개발 서비스를 설계·개발합니다.

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
    '스마트팜·농촌 데이터 서비스를 구축하려는 농가·시공사',
    '에너지 사용량을 수집·분석하려는 사업장',
    '유튜브 콘텐츠·스토어·맞춤 앱으로 고객 접점을 만들려는 사업자',
  ];

  static const consultationTopics = [
    '산업자동화·스마트팜·에너지관리 신규 구축',
    '기존 시스템(PLC, MES, DB) 연동',
    '대시보드·그래프·알람 기능 추가',
    '유튜브·스토어·앱개발 상담',
  ];

  static const consultationChecklist = [
    '문의 분야 (산업자동화 / 스마트팜·농촌 / 에너지관리 / 유튜브 / 스토어 / 앱개발)',
    '현장·사업 개요',
    '연동·장비 환경 (PLC, MES, 센서 등)',
    '원하시는 기능·화면',
    '희망 일정·예산 범위',
    '연락처',
  ];

  static const consultationEmailBody = '''안녕하세요. 소통웨어 디지털랩에 프로젝트 상담을 요청합니다.

1. 문의 분야: (산업자동화 / 스마트팜·농촌 / 에너지관리 / 유튜브 / 스토어 / 앱개발)
2. 현장·사업 개요:
3. 연동·장비 환경: (PLC, MES, 센서 등)
4. 원하시는 기능·화면:
5. 희망 일정·예산 범위:
6. 연락처:

감사합니다.''';

  static const mainMenuItems = [
    (id: 'monitoring', label: '산업자동화'),
    (id: 'smartfarm', label: '스마트팜·농촌'),
    (id: 'energy', label: '에너지관리'),
    (id: 'youtube', label: '유튜브'),
    (id: 'store', label: '스토어'),
    (id: 'apps', label: '앱개발'),
  ];

  static const businessMix = [
    BusinessArea(
      id: 'monitoring',
      label: '산업자동화',
      keyword: '공장·조립라인',
      color: Color(0xFF2563EB),
    ),
    BusinessArea(
      id: 'smartfarm',
      label: '스마트팜·농촌',
      keyword: '온실·축사 관제',
      color: Color(0xFF16A34A),
    ),
    BusinessArea(
      id: 'energy',
      label: '에너지관리',
      keyword: '전력·설비 데이터',
      color: Color(0xFFEA580C),
    ),
    BusinessArea(
      id: 'youtube',
      label: '유튜브',
      keyword: '콘텐츠·채널',
      color: Color(0xFFDC2626),
    ),
    BusinessArea(
      id: 'store',
      label: '스토어',
      keyword: '상품·주문',
      color: Color(0xFF0891B2),
    ),
    BusinessArea(
      id: 'apps',
      label: '앱개발',
      keyword: 'Flutter·웹',
      color: Color(0xFF7C3AED),
    ),
  ];

  static const List<ServiceItem> all = [
    ServiceItem(
      id: 'monitoring',
      title: '산업자동화',
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
      title: '스마트팜·농촌',
      shortDesc: '온실·축사·농촌 현장 관제, 센서·제어·데이터 시각화',
      icon: Icons.agriculture_outlined,
      accentColor: Color(0xFF16A34A),
      imageAsset: 'assets/images/app_farmjigi_logo.png',
      imageCaption: '스마트팜 관제·농장 앱 개발 사례',
      summary:
          '스마트팜·농촌 현장에 맞는 관제·데이터 수집·알림 시스템을 개발합니다. '
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
          title: '스마트팜·농촌 관제 시스템',
          placeholder: '스마트팜·농촌 관제·센서 연동 사례를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '농장 데이터·그래프',
          placeholder: '환경 데이터 분석·리포트 화면을 채울 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'energy',
      title: '에너지관리',
      shortDesc: '전력·설비 에너지 데이터 수집, 사용량 분석, 절감 대시보드',
      icon: Icons.bolt_outlined,
      accentColor: Color(0xFFEA580C),
      summary:
          '사업장과 현장의 에너지 사용 데이터를 수집하고 시각화합니다. '
          '전력·설비·센서 데이터를 기반으로 사용량 추이, 이상 징후, 절감 포인트를 확인할 수 있는 '
          '관리 화면과 리포트 구조를 설계합니다.',
      features: [
        '전력·설비 사용량 데이터 수집',
        '시간대·라인·장비별 사용량 분석',
        '에너지 대시보드·그래프',
        '이상 사용량 알림·리포트',
        '기존 계측기·DB·API 연동',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '에너지 데이터 수집',
          placeholder: '전력량계·설비·센서 데이터 연동 사례를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '사용량 분석·절감 리포트',
          placeholder: '에너지 사용량 그래프와 절감 리포트 화면을 채울 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'youtube',
      title: '유튜브',
      shortDesc: '채널 운영에 필요한 콘텐츠 기획, 영상 자료 정리, 랜딩·홍보 연계',
      icon: Icons.video_library_outlined,
      accentColor: Color(0xFFDC2626),
      summary:
          '사업과 제품을 설명하는 유튜브 콘텐츠 운영을 돕습니다. '
          '영상 주제 정리, 촬영·편집 자료 구성, 소개 페이지·문의 동선 연계 등 '
          '콘텐츠가 실제 고객 접점으로 이어지도록 구조화합니다.',
      features: [
        '채널·콘텐츠 주제 정리',
        '제품·서비스 소개 영상 구성',
        '썸네일·설명문·링크 동선 기획',
        '랜딩 페이지·문의 CTA 연계',
        '콘텐츠 운영 자료 관리',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '유튜브 콘텐츠 구성',
          placeholder: '채널 소개·콘텐츠 기획 사례를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '홍보 동선 연계',
          placeholder: '영상에서 상담·스토어·앱으로 이어지는 흐름을 정리할 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'store',
      title: '스토어',
      shortDesc: '상품 소개, 주문·문의 흐름, 온라인 판매 페이지와 운영 도구',
      icon: Icons.storefront_outlined,
      accentColor: Color(0xFF0891B2),
      summary:
          '상품과 서비스를 온라인에서 소개하고 판매·문의로 연결하는 스토어 구성을 지원합니다. '
          '상품 정보 정리, 상세 페이지, 주문·문의 흐름, 운영 데이터 확인 화면까지 '
          '사업 단계에 맞춰 필요한 기능을 설계합니다.',
      features: [
        '상품·서비스 소개 페이지',
        '주문·문의 접수 흐름 설계',
        '판매·재고·고객 데이터 관리',
        '결제·외부 스토어 링크 연계',
        '유튜브·앱·랜딩 페이지 연결',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '스토어 화면 구성',
          placeholder: '상품 상세·주문·문의 화면 사례를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '운영 데이터 관리',
          placeholder: '판매·고객·재고 관리 화면을 채울 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'apps',
      title: '앱개발',
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

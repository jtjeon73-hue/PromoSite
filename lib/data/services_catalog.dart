import 'package:flutter/material.dart';

/// 홍보 사이트 서비스 — 6개 주력 사업을 메인 메뉴와 상세 페이지에 함께 사용합니다.
class ServiceItem {
  const ServiceItem({
    required this.id,
    required this.menuLabel,
    required this.title,
    required this.shortDesc,
    required this.icon,
    required this.summary,
    required this.features,
    required this.highlightChips,
    this.detailSections = const [],
    this.accentColor = const Color(0xFF2563EB),
    this.imageAsset,
    this.imageCaption,
  });

  final String id;
  final String menuLabel;
  final String title;
  final String shortDesc;
  final IconData icon;
  final String summary;
  final List<String> features;
  final List<String> highlightChips;
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
  static const tagline = '현장 경험을 디지털 서비스로 연결하는\n홍보·마케팅 개발 파트너';
  static const contactEmail = 'sotongware@naver.com';
  static const responseTimeLabel = '영업일 기준 2~3일 내 이메일 회신';

  static const companyIntro = '''
소통웨어 디지털랩은 공장·농장·콘텐츠·커머스 현장에서 필요한
산업자동화 모니터링, 스마트팜·농촌 개발, 에너지관리, 유튜브, 스토어, 앱 개발을 설계·구축합니다.

1인 개발 체제로 요구사항을 빠르게 파악하고 직접 구현합니다.
규모나 일정에 따라 협업 파트너와 함께 진행할 수 있습니다.''';

  static const workStyleItems = [
    '현장·사업 목표 파악 → 메뉴·화면 구조 설계 → 단계별 개발',
    'PLC·MES·DB·센서·API·콘텐츠 채널 등 기존 환경과의 연동을 전제로 설계',
    '홍보·마케팅 운영과 유지보수까지 고려한 구조로 개발',
  ];

  static const serviceAreaItems = [
    '전국 어디나 출장·현장 방문 가능',
    '원격 개발·화면 공유 미팅 지원',
    '이메일(sotongware@naver.com)로 상담 접수',
  ];

  static const targetClients = [
    '공장·조립라인 모니터링이 필요한 제조·자동화 업체',
    '스마트팜·농촌 서비스·에너지관리 시스템을 구축하려는 사업자',
    '유튜브·스토어·앱을 묶어 홍보와 판매 흐름을 만들려는 브랜드',
  ];

  static const consultationTopics = [
    '산업자동화 모니터링 시스템 개발',
    '스마트팜·농촌 개발 및 관제',
    '에너지관리 대시보드·리포트 개발',
    '유튜브·스토어·앱 기반 홍보·마케팅 개발',
  ];

  static const consultationChecklist = [
    '문의 분야 (산업자동화 / 스마트팜·농촌 / 에너지관리 / 유튜브 / 스토어 / 앱)',
    '현장·사업 개요',
    '연동·장비·채널 환경 (PLC, MES, 센서, API, 유튜브, 스토어 등)',
    '원하시는 기능·화면',
    '희망 일정·예산 범위',
    '연락처',
  ];

  static const consultationEmailBody = '''안녕하세요. 소통웨어 디지털랩에 프로젝트 상담을 요청합니다.

1. 문의 분야: (산업자동화 / 스마트팜·농촌 / 에너지관리 / 유튜브 / 스토어 / 앱)
2. 현장·사업 개요:
3. 연동·장비·채널 환경: (PLC, MES, 센서, API, 유튜브, 스토어 등)
4. 원하시는 기능·화면:
5. 희망 일정·예산 범위:
6. 연락처:

감사합니다.''';

  static const businessMix = [
    BusinessArea(
      id: 'monitoring',
      label: '산업자동화\n모니터링 시스템',
      keyword: '공장·조립라인',
      color: Color(0xFF2563EB),
    ),
    BusinessArea(
      id: 'smartfarm',
      label: '스마트팜·농촌\n개발',
      keyword: '온실·농촌 서비스',
      color: Color(0xFF16A34A),
    ),
    BusinessArea(
      id: 'energy',
      label: '에너지관리\n개발',
      keyword: '사용량·절감 관리',
      color: Color(0xFFEA580C),
    ),
    BusinessArea(
      id: 'youtube',
      label: '유튜브\n개발',
      keyword: '콘텐츠·채널 연동',
      color: Color(0xFFDC2626),
    ),
    BusinessArea(
      id: 'store',
      label: '스토어\n개발',
      keyword: '상품·주문·판매',
      color: Color(0xFF0891B2),
    ),
    BusinessArea(
      id: 'apps',
      label: '앱\n개발',
      keyword: 'Flutter·웹·Windows',
      color: Color(0xFF7C3AED),
    ),
  ];

  static const List<ServiceItem> all = [
    ServiceItem(
      id: 'monitoring',
      menuLabel: '산업자동화',
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
      highlightChips: ['Tool 연동', 'PLC 물류·제어', 'CSV/Excel', 'MES 전송', '대시보드'],
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
      menuLabel: '스마트팜·농촌',
      title: '스마트팜·농촌 개발',
      shortDesc: '온실·축사·농촌 서비스 관제, 센서·제어·데이터 시각화',
      icon: Icons.agriculture_outlined,
      accentColor: Color(0xFF16A34A),
      imageAsset: 'assets/images/app_farmjigi_logo.png',
      imageCaption: '스마트팜 관제·농장 앱 개발 사례',
      summary:
          '스마트팜과 농촌 현장에 맞는 관제·데이터 수집·알림 시스템을 개발합니다. '
          '온습도·CO₂·일사량 등 센서 데이터를 모으고, 제어 장비와 연동하며, '
          '농가·시공사·운영자가 PC와 모바일에서 상태를 확인할 수 있는 구조를 설계합니다.',
      features: [
        '온실·축사 환경 센서 데이터 수집',
        '온습도·환기·관수 등 제어 연동',
        '실시간·이력 그래프·알람',
        'PC 관제 화면·모바일 보조 앱',
        '농촌 서비스·직거래·현장 입력 흐름 연계',
      ],
      highlightChips: ['환경 센서', '환기·관수 제어', '실시간 그래프', '알림', '농촌 서비스'],
      detailSections: [
        ServiceDetailSection(
          title: '스마트팜 관제 시스템',
          placeholder: '스마트팜 관제·센서 연동 사례를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '농촌 서비스·데이터 그래프',
          placeholder: '환경 데이터 분석·농촌 서비스 화면을 채울 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'energy',
      menuLabel: '에너지관리',
      title: '에너지관리 개발',
      shortDesc: '전력·설비·사용량 데이터 수집, 절감 대시보드와 리포트 개발',
      icon: Icons.energy_savings_leaf_outlined,
      accentColor: Color(0xFFEA580C),
      summary:
          '건물·공장·농장 등 현장의 에너지 사용량을 보기 쉽게 관리하는 시스템을 개발합니다. '
          '계측 데이터 수집, 사용량 추이, 이상 알림, 절감 리포트를 한 화면에서 확인하도록 구성해 '
          '운영자가 낭비 요인을 빠르게 찾을 수 있게 돕습니다.',
      features: [
        '전력·온도·설비 사용량 데이터 수집',
        '기간별 사용량·요금 추이 대시보드',
        '이상 사용량 감지와 알림',
        '절감 목표·리포트·CSV 출력',
        '기존 계측기·DB·API 연동',
      ],
      highlightChips: ['사용량 수집', '절감 대시보드', '이상 알림', '리포트', 'API 연동'],
      detailSections: [
        ServiceDetailSection(
          title: '에너지 데이터 수집',
          placeholder: '계측기·DB·API 연동 방식과 데이터 구조를 정리할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '절감 대시보드·리포트',
          placeholder: '사용량 비교, 목표 관리, 리포트 화면 예시를 추가할 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'youtube',
      menuLabel: '유튜브',
      title: '유튜브 개발',
      shortDesc: '채널 홍보 페이지, 영상 큐레이션, 콘텐츠 운영 보조 도구 개발',
      icon: Icons.smart_display_outlined,
      accentColor: Color(0xFFDC2626),
      summary:
          '유튜브 채널을 홍보·마케팅 자산으로 활용할 수 있도록 웹·앱 화면과 운영 도구를 개발합니다. '
          '영상 목록, 카테고리, 문의 CTA, 스토어·앱 연결을 구성하고 반복적인 콘텐츠 정리 업무를 줄이는 '
          '관리 화면도 함께 설계할 수 있습니다.',
      features: [
        '유튜브 채널·영상 홍보 랜딩 페이지',
        '영상 카테고리·재생목록 큐레이션',
        '콘텐츠별 문의·구매·상담 CTA 연결',
        '썸네일·제목·설명 관리 보조 화면',
        '스토어·앱·블로그와의 마케팅 동선 연결',
      ],
      highlightChips: ['채널 홍보', '영상 큐레이션', 'CTA 연결', '운영 도구', '스토어 연계'],
      detailSections: [
        ServiceDetailSection(
          title: '유튜브 홍보 페이지',
          placeholder: '채널 소개, 영상 목록, CTA 배치 사례를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '콘텐츠 운영 보조',
          placeholder: '영상 데이터 정리와 운영 자동화 아이디어를 채울 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'store',
      menuLabel: '스토어',
      title: '스토어 개발',
      shortDesc: '상품 소개, 주문·문의, 직거래·예약 흐름을 담은 판매형 웹·앱 개발',
      icon: Icons.storefront_outlined,
      accentColor: Color(0xFF0891B2),
      summary:
          '제품·농산물·서비스를 판매하거나 문의로 전환하기 위한 스토어형 웹·앱을 개발합니다. '
          '상품 소개, 옵션, 주문·예약·문의 동선, 관리자용 상품 관리 화면을 사업 규모에 맞게 구성하고 '
          '유튜브·앱·블로그와 연결되는 홍보 흐름까지 함께 설계합니다.',
      features: [
        '상품·서비스 소개 페이지',
        '주문·예약·문의 CTA 구성',
        '농산물 직거래·소규모 판매 흐름',
        '관리자 상품·공지·콘텐츠 관리',
        '유튜브·앱·외부 결제·API 연동 설계',
      ],
      highlightChips: ['상품 소개', '주문·문의', '직거래', '관리자 화면', '채널 연동'],
      detailSections: [
        ServiceDetailSection(
          title: '판매형 랜딩·스토어',
          placeholder: '상품 소개와 문의 전환 흐름 예시를 추가할 예정입니다.',
        ),
        ServiceDetailSection(
          title: '관리자·운영 화면',
          placeholder: '상품·공지·주문 관리 화면 구성을 채울 예정입니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'apps',
      menuLabel: '앱개발',
      title: '앱 개발',
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
      highlightChips: ['Flutter 앱', '웹·Windows', '현장 입력', '생활·서비스', 'AI 자동화'],
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

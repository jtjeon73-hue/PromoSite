import 'package:flutter/material.dart';

/// 소통 플랫폼 랜딩페이지에서 사용하는 서비스 정보.
class ServiceItem {
  const ServiceItem({
    required this.id,
    required this.title,
    required this.eyebrow,
    required this.shortDesc,
    required this.icon,
    required this.summary,
    required this.features,
    required this.audience,
    required this.outcomes,
    required this.gradientColors,
    this.detailSections = const [],
    this.accentColor = const Color(0xFF6D5DF6),
    this.imageAsset,
    this.imageCaption,
  });

  final String id;
  final String title;
  final String eyebrow;
  final String shortDesc;
  final IconData icon;
  final String summary;
  final List<String> features;
  final List<String> audience;
  final List<String> outcomes;
  final List<Color> gradientColors;
  final List<ServiceDetailSection> detailSections;
  final Color accentColor;
  final String? imageAsset;
  final String? imageCaption;
}

class ServiceDetailSection {
  const ServiceDetailSection({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

class PlatformMetric {
  const PlatformMetric({
    required this.value,
    required this.label,
    required this.description,
  });

  final String value;
  final String label;
  final String description;
}

class ServicesCatalog {
  ServicesCatalog._();

  static const brandName = '소통 플랫폼';
  static const tagline = '일상과 현장을 잇는\n4가지 소통 서비스';
  static const contactEmail = 'sotongware@naver.com';
  static const responseTimeLabel = '서비스 제휴·입점·개발 문의는 이메일로 회신드립니다';
  static const githubPagesUrl = 'https://<GitHub-사용자명>.github.io/PromoSite/';

  static const heroDescription =
      '소통사주, 소통건강, 소통팜지기, 소통사매를 하나의 브랜드 경험으로 연결한 Flutter Web 랜딩페이지입니다. '
      '모바일부터 데스크톱까지 자연스럽게 전환되는 반응형 화면과 Material 3 기반의 세련된 인터랙션을 제공합니다.';

  static const companyIntro =
      '소통 플랫폼은 개인의 관심사, 건강한 생활 습관, 농업 현장, 생활형 거래와 매칭을 하나의 브랜드 아래에서 소개하는 통합 랜딩 서비스입니다. '
      '각 서비스의 특성을 명확히 보여주면서도 같은 디자인 언어와 상담 흐름으로 연결되도록 설계했습니다.';

  static const consultationTopics = [
    '소통 플랫폼 서비스 제휴',
    '소통사주·소통건강 콘텐츠 협업',
    '소통팜지기 농가·스마트팜 도입 문의',
    '소통사매 입점·매칭·지역 커머스 문의',
  ];

  static const consultationChecklist = [
    '문의 서비스 (소통사주 / 소통건강 / 소통팜지기 / 소통사매)',
    '제휴·도입·입점 목적',
    '운영 중인 채널 또는 사업 개요',
    '필요한 기능·콘텐츠·연동 범위',
    '연락 가능한 이메일 또는 전화번호',
  ];

  static const consultationEmailBody = '''안녕하세요. 소통 플랫폼에 문의드립니다.

1. 문의 서비스: (소통사주 / 소통건강 / 소통팜지기 / 소통사매)
2. 문의 목적: (제휴 / 도입 / 입점 / 개발 / 기타)
3. 사업·채널 개요:
4. 필요한 기능·콘텐츠·연동 범위:
5. 연락처:

감사합니다.''';

  static const metrics = [
    PlatformMetric(
      value: '4',
      label: 'Core Services',
      description: '관심사와 현장을 잇는 4개 메뉴',
    ),
    PlatformMetric(
      value: 'M3',
      label: 'Material 3',
      description: '모던 컬러·카드·버튼 체계',
    ),
    PlatformMetric(
      value: '100%',
      label: 'Responsive',
      description: '모바일·태블릿·데스크톱 대응',
    ),
  ];

  static const List<ServiceItem> all = [
    ServiceItem(
      id: 'saju',
      title: '소통사주',
      eyebrow: 'Fortune Insight',
      shortDesc: '사주·운세 콘텐츠를 쉽고 따뜻하게 경험하는 상담형 서비스',
      icon: Icons.auto_awesome_outlined,
      accentColor: Color(0xFF7C3AED),
      gradientColors: [Color(0xFF7C3AED), Color(0xFFDB2777)],
      imageAsset: 'assets/images/app_saju_icon.png',
      imageCaption: '소통사주 브랜드 아이콘',
      summary:
          '소통사주는 사주와 운세 콘텐츠를 어렵지 않게 풀어내는 라이프스타일 서비스입니다. '
          '오늘의 흐름, 관계·일·재물 테마, 상담형 콘텐츠를 통해 사용자가 자신을 돌아보고 다음 행동을 정리하도록 돕습니다.',
      features: [
        '오늘의 운세와 테마별 인사이트',
        '관계·일·재물·건강 흐름 카드',
        '초보자도 이해하기 쉬운 해석 UX',
        '상담 신청과 콘텐츠 구독으로 확장 가능',
      ],
      audience: [
        '매일 짧게 운세를 확인하고 싶은 사용자',
        '사주 콘텐츠를 브랜드 서비스로 운영하려는 파트너',
        '상담형 콘텐츠와 커뮤니티를 함께 제공하려는 운영자',
      ],
      outcomes: [
        '재방문을 유도하는 일일 콘텐츠 구조',
        '상담 전환에 적합한 카드형 랜딩',
        '브랜드 신뢰감을 높이는 차분한 톤앤매너',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '콘텐츠 경험',
          body: '오늘의 흐름, 주간 키워드, 관계·일·재물 테마를 카드로 구성해 빠르게 읽고 저장할 수 있는 경험을 제공합니다.',
        ),
        ServiceDetailSection(
          title: '상담 전환',
          body: '흥미 위주의 콘텐츠에서 상담 요청으로 자연스럽게 이어지는 CTA와 문의 흐름을 설계할 수 있습니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'health',
      title: '소통건강',
      eyebrow: 'Wellness Companion',
      shortDesc: '건강 습관과 생활 기록을 부담 없이 이어가는 웰니스 서비스',
      icon: Icons.favorite_border_outlined,
      accentColor: Color(0xFF0EA5E9),
      gradientColors: [Color(0xFF0EA5E9), Color(0xFF14B8A6)],
      summary:
          '소통건강은 생활 습관을 기록하고 건강 루틴을 꾸준히 이어가도록 돕는 웰니스 플랫폼입니다. '
          '의료 진단이 아닌 일상 관리 중심으로 수면, 물 섭취, 운동, 컨디션 체크를 쉽고 명확하게 보여줍니다.',
      features: [
        '수면·운동·수분·컨디션 루틴 기록',
        '주간 리포트와 작은 성취 배지',
        '가족·코치와 공유 가능한 요약 카드',
        '건강 콘텐츠와 알림 캠페인 연동',
      ],
      audience: [
        '생활 습관을 가볍게 관리하고 싶은 사용자',
        '웰니스 콘텐츠를 운영하는 브랜드',
        '가족·커뮤니티 기반 건강 챌린지를 준비하는 팀',
      ],
      outcomes: [
        '꾸준함을 만드는 루틴 UX',
        '정보 과부하를 줄인 시각화',
        '캠페인·콘텐츠 확장에 적합한 구조',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '루틴 관리',
          body: '복잡한 의료 데이터 대신 사용자가 직접 실천할 수 있는 생활 루틴을 중심으로 기록 화면과 리포트를 구성합니다.',
        ),
        ServiceDetailSection(
          title: '웰니스 콘텐츠',
          body: '운동, 식습관, 수면, 마음 관리 콘텐츠를 캠페인과 연결해 서비스 체류 시간을 높일 수 있습니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'farmjigi',
      title: '소통팜지기',
      eyebrow: 'Smart Farm Partner',
      shortDesc: '농장 기록·스마트팜 관제·농가 커뮤니케이션을 연결하는 서비스',
      icon: Icons.eco_outlined,
      accentColor: Color(0xFF16A34A),
      gradientColors: [Color(0xFF16A34A), Color(0xFF65A30D)],
      imageAsset: 'assets/images/app_farmjigi_logo.png',
      imageCaption: '소통팜지기 스마트팜 서비스',
      summary:
          '소통팜지기는 농장 운영 기록과 스마트팜 데이터를 한눈에 확인하도록 돕는 농업 현장형 서비스입니다. '
          '작업 일지, 생육 기록, 알림, 센서 데이터 요약을 연결해 농가와 운영자가 빠르게 소통할 수 있습니다.',
      features: [
        '농장 작업 일지와 생육 기록',
        '온습도·관수·환기 등 스마트팜 데이터 요약',
        '농가·관리자 간 알림과 공지',
        '직거래·출하·재고 서비스로 확장 가능',
      ],
      audience: [
        '농장 기록을 디지털화하려는 농가',
        '스마트팜 데이터를 쉽게 보여주려는 운영사',
        '농업 커뮤니티와 직거래를 연결하려는 파트너',
      ],
      outcomes: [
        '현장 중심의 간단한 입력 UX',
        '데이터 기반 농장 운영 가시화',
        '농가 커뮤니케이션 채널 확장',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '농장 기록',
          body: '작업 내용, 작물 상태, 사진, 출하 메모를 빠르게 남기고 농장별 이력을 확인할 수 있는 구조를 제공합니다.',
        ),
        ServiceDetailSection(
          title: '스마트팜 연동',
          body: '센서와 제어 데이터를 보기 쉬운 상태 카드와 알림으로 정리해 현장 판단을 돕는 방향으로 확장할 수 있습니다.',
        ),
      ],
    ),
    ServiceItem(
      id: 'samae',
      title: '소통사매',
      eyebrow: 'Local Match Market',
      shortDesc: '사람과 매장을 연결하는 생활형 매칭·커머스 서비스',
      icon: Icons.storefront_outlined,
      accentColor: Color(0xFFF97316),
      gradientColors: [Color(0xFFF97316), Color(0xFFEF4444)],
      imageAsset: 'assets/images/app_farmdirect_icon.png',
      imageCaption: '소통사매 지역 매칭·커머스',
      summary:
          '소통사매는 사람과 매장, 지역 상품과 수요를 연결하는 생활형 매칭 서비스입니다. '
          '입점 소개, 상품·서비스 카드, 문의와 예약 흐름을 통해 지역 기반 커머스와 커뮤니티를 확장합니다.',
      features: [
        '매장·상품·서비스 프로필 카드',
        '관심 지역·카테고리 기반 매칭',
        '문의·예약·입점 상담 CTA',
        '농산물·생활 서비스 커머스 확장',
      ],
      audience: [
        '지역 고객과 연결되고 싶은 소상공인',
        '상품 소개와 예약 문의를 한곳에 모으려는 운영자',
        '생활형 매칭·커머스 플랫폼을 준비하는 팀',
      ],
      outcomes: [
        '입점 매력을 보여주는 쇼케이스',
        '문의와 예약으로 이어지는 전환 동선',
        '지역 커뮤니티형 서비스 확장성',
      ],
      detailSections: [
        ServiceDetailSection(
          title: '매칭 흐름',
          body: '사용자의 관심 지역과 카테고리를 기준으로 매장, 상품, 서비스를 발견하고 문의하도록 구성합니다.',
        ),
        ServiceDetailSection(
          title: '입점 쇼케이스',
          body: '매장 소개, 대표 상품, 리뷰 포인트, 이벤트를 카드형 화면으로 보여줘 입점 파트너의 장점을 강조합니다.',
        ),
      ],
    ),
  ];

  static const platformSteps = [
    '관심사 발견',
    '서비스 선택',
    '콘텐츠·기록 경험',
    '상담·입점·제휴 전환',
  ];

  static ServiceItem? byId(String id) {
    for (final service in all) {
      if (service.id == id) return service;
    }
    return null;
  }
}

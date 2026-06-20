# 소통 플랫폼 Flutter Web 랜딩페이지

PromoSite 저장소를 Flutter Web 기반의 반응형 랜딩페이지로 구성한 프로젝트입니다.

## 앱 이름

소통 플랫폼

## 메뉴

- 소통사주
- 소통건강
- 소통팜지기
- 소통사매

## 주요 적용 사항

- Flutter Web 프로젝트 구조
- Material 3 테마 적용
- 모바일, 태블릿, 데스크톱 반응형 레이아웃
- 고급 랜딩페이지 스타일
  - 그라데이션 히어로
  - 유리 질감 카드
  - 서비스별 컬러 시스템
  - 문의 전환 CTA
- GitHub Pages 자동 배포 워크플로

## 로컬 실행

```bash
flutter pub get
flutter run -d chrome
```

## 웹 빌드

```bash
flutter build web --release --base-href "/PromoSite/"
```

## GitHub Pages 자동 배포

`.github/workflows/deploy_pages.yml` 워크플로가 `main` 브랜치 push 시 Flutter Web을 빌드하고 GitHub Pages로 배포합니다.

배포 URL:

```text
https://<GitHub-사용자명>.github.io/PromoSite/
```

저장소명이 변경되면 워크플로의 `base-href`는 GitHub 저장소명을 자동으로 사용합니다.

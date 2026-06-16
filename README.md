# Flutter 홍보·영업용 랜딩 사이트 샘플

VSCode에서 열어서 Flutter Web/Windows로 확인하는 샘플입니다.

## 실행 방법

```bash
flutter pub get
flutter run -d chrome
```

Windows 앱처럼 실행하려면:

```bash
flutter run -d windows
```

만약 Windows 실행이 안 되면 아래 명령을 먼저 실행하세요.

```bash
flutter config --enable-windows-desktop
flutter create .
flutter run -d windows
```

## 수정할 주요 파일

```text
lib/main.dart
```

## 화면 구성

- 상단 메뉴
- 메인 홍보 배너
- 핵심 서비스 카드
- 개발 가능 분야
- 포트폴리오/성과 영역
- 상담 문의 CTA 영역

# AGENTS.md

## Cursor Cloud specific instructions

This is a single-product **Flutter Web** promotional landing site (`flutter_promo_site`).
There is no backend; the only deliverable is the Flutter web app served from `lib/main.dart`.

### Environment
- The Flutter SDK (stable, includes Dart) is installed at `~/flutter` and added to `PATH` via `~/.bashrc`. Run `flutter --version` to confirm it resolves; if not, ensure `~/flutter/bin` is on `PATH`.
- Web support is enabled (`flutter config --enable-web`). The update script runs `flutter pub get`.

### Run (development)
- Serve the app: `flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0`.
  - The cloud VM is headless, so use the `web-server` device (not `-d chrome`). The README's `flutter run -d chrome` assumes a local desktop browser.
  - Once it prints "is being served at http://0.0.0.0:8080", open `http://localhost:8080` to view it.
- Hot reload (`r`) / hot restart (`R`) work from the `flutter run` console.

### Lint / Test / Build
- Lint: `flutter analyze`. Note: there is a pre-existing `unused_element_parameter` warning in `lib/main.dart` (the `tall` parameter), so `flutter analyze` exits non-zero even on a clean checkout. Do not treat that single warning as a regression.
- Test: there is no `test/` directory; `flutter test` has nothing to run.
- Build (production, for reference only): `flutter build web --release --base-href "/PromoSite/"` (matches the GitHub Pages workflow in `.github/workflows/deploy_pages.yml`).

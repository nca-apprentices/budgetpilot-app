# ncaswift

Minimales iOS-SwiftUI-Beispielprojekt. Ziel: so wenig wie möglich mit der Xcode-GUI arbeiten,
alles ueber Terminal steuern.

## Voraussetzungen

- Xcode muss installiert sein (fuer iOS-SDK, Simulator, `xcodebuild`) - die App selbst wird
  aber nie geoeffnet.
- [XcodeGen](https://github.com/yonaskolb/XcodeGen) via `brew install xcodegen`.
- [SwiftLint](https://github.com/realm/SwiftLint) und [SwiftFormat](https://github.com/nicklockwood/SwiftFormat)
  via `brew install swiftlint swiftformat`.

## Wie es aufgebaut ist

- `project.yml` beschreibt das Xcode-Projekt (Targets, Settings).
- `xcodegen generate` erzeugt daraus `ncaswift.xcodeproj`. Diese Datei wird **nicht** committet
  (siehe `.gitignore`) und nie von Hand angefasst - sie ist reines Build-Artefakt.
- Der eigentliche Code liegt in `Sources/ncaswift/`, editierbar mit jedem Editor (z. B. VS Code
  mit der Swift-Extension).

## Befehle

```bash
make build         # generiert das Projekt und baut fuer den Simulator
make test          # generiert das Projekt und fuehrt Tests aus
make run           # baut, startet den Simulator und installiert/startet die App
make lint          # SwiftLint ueber Sources/
make format        # SwiftFormat, schreibt Aenderungen
make format-check  # SwiftFormat im Lint-Modus (fuer CI, aendert nichts)
make simctl-reset  # faehrt alle Simulatoren runter
make clean         # entfernt generiertes .xcodeproj und Build-Ordner
```

## CI

[.github/workflows/ci.yml](.github/workflows/ci.yml) laeuft bei jedem Push/PR auf einem
macOS-Runner: Xcode-Sanity-Check, Lint, Format-Check, Build, Test. Kein Signing, kein
Deployment - nur Simulator-Build+Test, analog zum Muster aus grossen Projekten (z. B.
netgrade), nur ohne die dort noetige Zertifikats-/TestFlight-Logik.

## Wo die Xcode-GUI trotzdem noetig ist

- **SwiftUI Previews** (`#Preview`): nur im Xcode-Canvas verfuegbar, keine Terminal-Alternative.
- **Signing fuer ein echtes Geraet**: im Beispiel ist Code-Signing für den Simulator komplett
  deaktiviert (`CODE_SIGNING_ALLOWED: NO`). Für ein echtes iPhone braucht es ein Team/Zertifikat -
  entweder einmalig ueber die Xcode-GUI einrichten, oder spaeter mit Fastlane (`match`) automatisieren.

Alles andere - Bauen, Testen, im Simulator starten - laeuft komplett per Terminal.

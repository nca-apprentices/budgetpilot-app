# BudgetPilot (Produktivapp)

> Projektkontext für dieses Repo (`nca-apprentices/budgetpilot-app`, lokal auch
> als `budgetpilot-ios` geklont). Enthält die Produktidee und, unten, ein paar
> gelernte Lehren aus dem Projektstart — bewusst getrennt vom vorherigen
> Proof of Concept (`budgetpilot-proof-of-concept`, React Native).

## Hintergrund

BudgetPilot war zunächst ein Proof of Concept (React Native), der zeigen
sollte, dass eine KI-gestützte Budget-App mit on-device-Ausgabenerkennung
technisch machbar ist. Der POC hat das bestätigt (u. a. zuverlässige
Freitext- und Beleg-Extraktion mit einem lokalen LLM). Dieses Projekt hier ist
die echte, produktiv gedachte App — eigenständig neu aufgesetzt, ohne die
technischen Festlegungen des POC zu übernehmen. Fix steht bereits die
Plattform: natives Swift/SwiftUI statt React Native — React Native gilt für
dieses Projekt als zu wenig zukunftsfähig.

## Produktidee

BudgetPilot hilft Nutzer:innen, ihr persönliches Budget einfach im Griff zu
behalten — Einnahmen, Fixkosten, geplante Käufe und offene Forderungen an
einem Ort, mit KI-Unterstützung dort, wo sie wirklich Zeit spart (Ausgaben aus
Freitext oder Kassenzetteln erfassen), aber nie dort, wo Vertrauen
entscheidend ist: die tatsächlichen Zahlen kommen immer aus verlässlichen
Quellen, nie aus einer KI-Schätzung.

## Kernfunktionen (Produktsicht)

1. **Budget & Einkommen** — monatliches Einkommen, Fixkosten und geplante
   Käufe erfassen, Restbudget (absolut + Prozent) auf einen Blick, Warnung
   bei drohender Überschreitung. Zusätzlich ein monatliches Sparziel (Betrag,
   den man diesen Monat zurücklegen möchte) mit Fortschrittsanzeige, sowie
   eine Verlaufsansicht der letzten Monate (Fixkosten vs. variable Ausgaben
   getrennt), damit man Trends über die Zeit erkennt, nicht nur den
   aktuellen Monat.
2. **Ausgaben per Freitext oder Beleg-Foto erfassen** — die Nutzer:in
   beschreibt eine Ausgabe in eigenen Worten oder fotografiert einen
   Kassenzettel; die App schlägt Betrag, Kategorie und Häufigkeit vor, muss
   das Ergebnis aber immer bestätigen lassen, bevor etwas gespeichert wird.
   Unsichere Vorschläge werden klar als solche markiert statt als sicheres
   Ergebnis präsentiert.
3. **Kalenderansicht** — alle Ausgaben und fälligen Forderungen im
   Monatsüberblick; Antippen eines Tages öffnet die Erfassung mit diesem
   Datum vorausgefüllt.
4. **Forderungen** — Geld, das die Nutzer:in noch von jemandem bekommt (z. B.
   ausgelegtes Geld), mit Fälligkeitsdatum, Kalender-Markierung und einer
   Erinnerung am fälligen Tag. Sobald eine Forderung als erhalten markiert
   wird, fliesst der Betrag automatisch ins Restbudget des entsprechenden
   Monats ein.
5. **Preisvergleich** — zu einem geplanten Kauf lässt sich ein realistischer
   Marktpreis nachschlagen, damit die Budgetplanung nicht auf Schätzwerten
   beruht.
6. **Wunschliste für geplante Käufe** — geplante Anschaffungen lassen sich
   sammeln und einzeln per Schalter ein-/ausschliessen, ob sie in die
   aktuelle Budgetplanung einfliessen sollen. Wird ein geplanter Kauf
   tatsächlich getätigt, wandelt die App ihn in eine echte Ausgabe um —
   verbucht am Datum des tatsächlichen Kaufs, nicht am Datum, an dem der
   Kauf ursprünglich geplant wurde.
7. **Zusammenfassung & Export** — verständliche, nachvollziehbare
   Zusammenfassung des Budgets, exportierbar zum Teilen/Aufbewahren.
8. **Korrigierbarkeit überall** — jeder von der KI vorgeschlagene oder
   importierte Wert lässt sich jederzeit nachträglich bearbeiten oder
   löschen; die App merkt sich klar, was manuell korrigiert wurde, damit man
   später nicht rätseln muss, ob ein Wert von der KI stammt oder von einem
   selbst.

## Entwicklungsreihenfolge: erst Grundfunktionen, Rest offen

Die "Kernfunktionen" oben beschreiben die Produktvision, sind aber **kein
fixer Umfang, der so 1:1 gebaut werden muss.** Programmiert wird zuerst nur
ein Grundgerüst, danach schaut man, was sich als Nächstes ergibt/lohnt —
nichts davon ist in Stein gemeisselt.

Der erste Baustein, mit dem die Programmierung beginnt:

- **Ausgaben per Chat eintragen:** Freitext eingeben (z. B. "Kopfhörer Sony
  XM5 für 299") — die KI erkennt Betrag und Kategorie, trägt die Ausgabe ins
  passende Budget ein und sagt, wie viel noch frei ist.
- **Top-Preise suchen:** über ein Dropdown in derselben Eingabeleiste von
  "Eintragen" auf "Preissuche" umschalten — die App sucht dann den
  günstigsten Preis für ein Produkt, statt eine Ausgabe zu erfassen.
- **KI-Analyse:** über ein zweites Dropdown die eigenen Ausgaben auswerten
  lassen (z. B. wo am meisten ausgegeben wird, wo sich sparen liesse).
- **Spracheingabe und Beleg:** per Mikrofon Ausgaben diktieren, per
  Audio-Button direkt mit der KI sprechen, über "+" einen Beleg/ein Foto
  hochladen.
- **Budget-Übersicht:** Budget-Tab zeigt verfügbares Budget für den Monat,
  Prozent bereits ausgegeben, Einkommen, Fixkosten und die letzten Ausgaben
  mit Kategorie und Datum.

Alles, was oben unter "Kernfunktionen" zusätzlich steht (Kalender,
Forderungen, Wunschliste, Sparziel/Verlauf usw.), ist Zielbild für später —
ob und wann das tatsächlich drankommt, entscheidet sich erst während der
Entwicklung.

## Leitplanken aus dem POC (produktrelevant, nicht technisch)

- **KI schlägt vor, entscheidet aber nie endgültig.** Jede automatisch
  erkannte Zahl/Kategorie bleibt vom Nutzer überprüf- und korrigierbar, bevor
  sie gespeichert wird — keine stillen Automatik-Buchungen.
- **Vergangenheit bleibt unantastbar.** Wird eine wiederkehrende Position
  (z. B. Miete, Abo) beendet oder geändert, dürfen bereits vergangene Monate
  — inklusive des gerade angezeigten — davon nicht rückwirkend betroffen
  sein. Ein "Beenden ab jetzt" darf niemals stillschweigend die Historie
  verändern; eine echte, vollständige Rückwirkung (z. B. bei Fehleingaben)
  muss ein separater, bewusster Schritt sein.
- **Unsicherheit sichtbar machen statt verstecken.** Wenn die App sich bei
  einer Erkennung nicht sicher ist, muss das klar erkennbar sein (nicht als
  "wahrscheinlich richtig" getarnt).
- **Preise/Beträge kommen nie aus einer KI-Schätzung**, sondern immer aus
  echten, nachvollziehbaren Quellen (eigene Eingabe oder ein echter
  Marktpreis-Abruf).
- **Privatsphäre zuerst:** Finanzielle Daten sind sensibel — wo immer möglich
  lokal verarbeiten statt an einen Server zu senden.

## Technisches Setup (Stand jetzt)

Terminal-basiert, bewusst mit möglichst wenig Xcode-GUI (siehe `README.md`
für die volle Erklärung):

- `project.yml` (XcodeGen) beschreibt das Projekt, `ncaswift.xcodeproj` wird
  daraus generiert und ist **nicht** eingecheckt — nie von Hand anfassen.
- Code liegt in `Sources/ncaswift/`, editierbar mit jedem Editor.
- `make build` / `make test` / `make lint` / `make format` / `make run` —
  siehe `Makefile`. Aktuell existiert noch **kein Test-Target** in
  `project.yml`, `make test` schlägt deshalb erwartbar fehl (kein Bug,
  einfach noch nicht angelegt).
- Aktueller Target-/Bundle-Name ist noch `ncaswift` / `ch.ncaswift.app`
  (Platzhalter aus dem Ausgangs-Template) — bei Bedarf in `project.yml`
  umbenennen, nicht von Hand im generierten `.xcodeproj`.
- `xcodebuild` braucht auf diesem Mac `DEVELOPER_DIR` auf die installierte
  Xcode.app gesetzt, weil `xcode-select` auf die Command Line Tools zeigt und
  sich ohne Admin-Rechte nicht umstellen lässt:
  `export DEVELOPER_DIR=/Users/eakerman/Applications/Xcode.app/Contents/Developer`.

## Lessons Learned zum Modell/zur KI (aus dem POC, unabhängig vom Tech-Stack)

Diese gelten unabhängig davon, welches Modell/welche Plattform ihr am Ende
wählt — es sind Eigenschaften von LLMs allgemein bzw. von Gemma 4 E2B-it
speziell, keine React-Native-Bugs:

1. **RAM-Bedarf ist real.** Ein ~2.5 GB grosses On-Device-Modell wie Gemma 4
   E2B-it kann auf Geräten mit wenig freiem RAM (z. B. iPhone 12 mit 4 GB
   insgesamt) beim Laden fehlschlagen (OOM-Risiko) — vor Wahl eines
   On-Device-Modells den tatsächlichen RAM-Bedarf gegen die Ziel-Hardware
   prüfen, nicht nur gegen die Download-Grösse.
2. **Bildqualität wirkt sich direkt auf Foto-Erkennung aus.** Niedrigere
   JPEG-Kompression/Unschärfe verschlechtert messbar, wie zuverlässig ein
   Modell feinen Text (z. B. Kassenzettel) liest.
3. **Konversations-State ist eine Falle.** Manche LLM-APIs führen implizit
   eine fortlaufende Konversation — jeder neue, eigentlich unabhängige
   Aufruf hängt sonst an der Historie vorheriger Aufrufe und liefert dadurch
   verunreinigte Antworten. Bei jeder in sich abgeschlossenen Anfrage
   explizit zurücksetzen/neu starten, nicht auf impliziten State verlassen.
4. **Modelle halten sich nicht zuverlässig an strikte Formatvorgaben.**
   "Antworte AUSSCHLIESSLICH mit JSON" wurde trotz sauberem Kontext
   gelegentlich ignoriert. Ein einfacheres, fehlertoleranteres
   Ausgabeformat verlangen (oder constrained/structured output der
   jeweiligen API nutzen) ist robuster als gegen das Modell anzukämpfen.
5. **KI erfindet auch bei reinem Umformulieren vorgegebener Zahlen neue
   Werte.** Selbst wenn ein Prompt exakte Zahlen als feststehende Fakten
   vorgibt ("nutze ausschliesslich diese Werte"), kann das Modell im
   Fliesstext andere, erfundene Zahlen ausgeben. Vom Modell erzeugter Text
   mit Zahlen braucht eine sichtbare "KI · bitte prüfen"-Kennzeichnung,
   niemals blind vertrauen.
6. **Kleine multimodale Modelle lesen Fotos von Belegen unzuverlässig
   direkt.** Ein dediziertes OCR (z. B. Apples Vision-Framework,
   `VNRecognizeTextRequest` — direkt in Swift nutzbar) vor die
   Text-Extraktion zu schalten, statt dem Modell das Bild direkt zu geben,
   war deutlich zuverlässiger.
7. **OCR-Text-Reihenfolge entspricht nicht der visuellen Lesereihenfolge.**
   Texterkennung liefert Wörter oft nach Spalten statt nach Zeilen — Label
   und zugehöriger Wert (z. B. "TOTAL" und der Betrag) können dadurch im
   erkannten Text weit auseinanderliegen. Fix: Erkennungs-Ergebnisse nach
   Bounding-Box-Position (erst Zeile anhand vertikaler Position gruppieren,
   dann horizontal sortieren) zu Zeilen rekonstruieren, bevor sie ans
   Sprachmodell gehen — kein Prompt kann eine strukturell verlorene
   Zuordnung nachträglich reparieren.
8. **Bei mehreren plausiblen Zahlen wählt das Modell nicht automatisch die
   fachlich richtige.** Bei zwei echten Totalsummen in unterschiedlichen
   Währungen (z. B. Fremdwährungs-Umrechnung einer Kartenzahlung) hat das
   Modell die falsche gewählt — beide Zahlen waren real, nur die Auswahl war
   für den Anwendungsfall falsch. Domänenregeln ("bevorzuge immer CHF")
   müssen explizit im Prompt stehen.
9. **Denk-/Reasoning-Budget und Antwort-Budget konkurrieren um dasselbe
   Token-Limit.** Ein unbegrenztes "Thinking"-Budget kann bei einer
   komplexeren Anfrage das gesamte Output-Budget aufbrauchen, bevor die
   eigentliche Antwort überhaupt beginnt. Denk-Budget deckeln UND
   Gesamt-Output-Limit grosszügig genug setzen — beide Werte gehören
   zusammen betrachtet.
10. **"Thinking Mode" ist kein Allheilmittel für Bildverständnis.** Explizit
    aktiviertes Thinking hat die Foto-Erkennungsgenauigkeit in Tests nicht
    verbessert — keine Annahme treffen, dass mehr Reasoning automatisch
    bessere multimodale Ergebnisse liefert, ohne es zu messen.

## Lessons Learned (Projekt-Setup, dieses Repo)

1. **Dieses Projekt-Setup ist komplett anders als beim POC — nicht
   verwechseln.** Der POC war React Native mit `npx react-native run-ios`.
   Dieses Projekt ist natives Swift, aufgesetzt mit XcodeGen + Makefile,
   bewusst terminal-gesteuert (siehe oben). Xcode-GUI-Workflows aus dem POC
   (z. B. `pod install`, `.xcworkspace` öffnen) gelten hier nicht.
2. **Beim Aufsetzen: korrekte, einfache Antworten statt komplizierter
   Mehrschritt-Anleitungen.** Der Nutzer programmiert selbst und will von der
   KI zuverlässige, direkte Hilfe — keine langen GUI-Klickanleitungen "auf
   Verdacht", die bei jedem Xcode-Versions-Unterschied wieder falsch liegen
   können (so beim ersten Versuch passiert: mehrere Runden falscher
   Xcode-Dialog-Beschreibungen, bis klar wurde, dass das Projekt sowieso
   terminal-basiert per XcodeGen laufen sollte). Wenn eine GUI-Anleitung
   nötig ist, lieber vorher kurz nachfragen, was der Nutzer aktuell sieht,
   statt blind mehrere Schritte vorzugeben.
3. **`xcode-select` zeigt auf diesem Mac auf die Command Line Tools, nicht
   auf Xcode.app, und kann ohne Admin-Rechte nicht umgestellt werden
   (`sudo xcode-select -s` schlägt fehl).** Workaround ohne sudo: die
   Umgebungsvariable `DEVELOPER_DIR` pro Befehl setzen (siehe oben) — betrifft
   `xcodebuild`, `xcodegen` u. Ä.

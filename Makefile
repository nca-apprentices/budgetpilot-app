SCHEME    = ncaswift
SIM       = iPhone 18 Pro
DERIVED   = .build
APP       = $(DERIVED)/Build/Products/Debug-iphonesimulator/ncaswift.app
BUNDLE_ID = ch.ncaswift.app

.PHONY: generate build test run clean lint format format-check simctl-reset

generate:
	xcodegen generate

lint:
	swiftlint

format:
	swiftformat Sources

format-check:
	swiftformat --lint Sources

build: generate
	xcodebuild build -scheme $(SCHEME) -destination 'platform=iOS Simulator,name=$(SIM)' -derivedDataPath $(DERIVED)

test: generate
	xcodebuild test -scheme $(SCHEME) -destination 'platform=iOS Simulator,name=$(SIM)' -derivedDataPath $(DERIVED)

run: build
	xcrun simctl boot "$(SIM)" 2>/dev/null || true
	open -a Simulator 2>/dev/null || open "/Applications/Xcode.app/Contents/Applications/DeviceHub.app" 2>/dev/null || true
	xcrun simctl install booted $(APP)
	xcrun simctl launch booted $(BUNDLE_ID)

simctl-reset:
	xcrun simctl shutdown all

clean:
	rm -rf ncaswift.xcodeproj $(DERIVED)

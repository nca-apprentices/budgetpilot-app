import Algorithms
import SwiftUI

struct ContentView: View {
    @State private var taps: [Int] = []

    private var uniqueTapCount: Int {
        Array(taps.uniqued()).count
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("ncaswift")
                .font(.largeTitle)
                .bold()
            Text("Du hast \(taps.count) mal getippt")
            Text("davon \(uniqueTapCount) einzigartig (via swift-algorithms)")
                .font(.caption)
                .foregroundStyle(.secondary)
            Button("Tippen") {
                taps.append(taps.count % 3)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct ContentView: View {

  private let featureKey = "growthbook-backgroundSync-demo"
  let viewModel = ContentViewViewModel()
  @State private var refreshToggle = false

  var body: some View {
    VStack {
      Spacer()

      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, GrowthBook SDK!")

      Text("flag: \"\(featureKey)\"")
        .font(.caption)

      Divider()

      HStack(spacing: 12) {
        Text("Enabled:")
        isFeatureOn
      }

      Divider()

      directAccess

      Divider()

      Spacer()

      Button("Refresh") {
        refreshToggle.toggle()
      }
      .padding(12)
    }
    .padding()
  }
}

private extension ContentView {

  @ViewBuilder
  var isFeatureOn: some View {
    if viewModel.isFeatureOn(featureKey) {
      Text("On")
        .fontWeight(.bold)
        .foregroundStyle(.green)
    } else {
      Text("Off")
        .fontWeight(.bold)
        .foregroundStyle(.red)
    }
  }

  @ViewBuilder
  var directAccess: some View {
    if let demoValue = viewModel.valueFor(key: "growthbook-backgroundSync-demo") {
      Text("direct: \(demoValue ? "✅" : "❌")")
    } else {
      Text("no value")
        .fontWeight(.bold)
        .foregroundStyle(.red)
    }
  }
}


#Preview {
  ContentView()
}

import SwiftUI

struct ContentView: View {

  @State private var viewModel = ContentViewViewModel()

  var body: some View {
    VStack {
      Spacer()

      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, GrowthBook SDK!")

      Text("flag: \"\(viewModel.featureKey)\"")
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
        viewModel.refresh()
      }
      .padding(12)
    }
    .padding()
  }
}

private extension ContentView {

  @ViewBuilder
  var isFeatureOn: some View {
    if viewModel.isFeatureOn(viewModel.featureKey) {
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
    if let demoValue = viewModel.valueFor(key: viewModel.featureKey) {
      Text("Value: \(demoValue ? "✅" : "❌")")
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

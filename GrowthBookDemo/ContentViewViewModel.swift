import Foundation
import GrowthBook

@Observable
final class ContentViewViewModel {

  let featureKey = "growthbook-backgroundSync-demo"
  var lastUpdate = Date()

  private let growthBook: GrowthBookSDK

  init() {
    self.growthBook = GrowthBookBuilder(
      apiHost: "https://cdn.growthbook.io",
      clientKey: "sdk-F1ND_Y0UR_0WN",
      attributes: [:],
      trackingCallback: { _, _ in
        print("🐾 tracking callback called")
      },
      refreshHandler: { didRefresh in
        print("♻️ refreshHandler called with input value: \(didRefresh ? "true" : "false")")
      },
      backgroundSync: true
    ).initializer()
  }

  func isFeatureOn(_ key: String) -> Bool {
    print("🎣 isFeature '\(key)' on called")
    return growthBook.isOn(feature: key)
  }

  func valueFor(key: String) -> Bool? {
    print("🎣 feature value for '\(key)' called")
    return growthBook.getFeatureValue(feature: key, default: JSON.null).bool
  }

  func refresh() {
    print("🧼 Refreshing...")

    lastUpdate = Date()

    print("  isFeatureOn('\(featureKey)'): \(isFeatureOn(featureKey))")
    print("valueFor(key: '\(featureKey)'): \(valueFor(key: featureKey).debugDescription)")
  }
}

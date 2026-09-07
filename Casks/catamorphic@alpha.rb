cask "catamorphic@alpha" do
  version "0.1.0-alpha.4"
  sha256 "aa183eaaf30efbfc9cc7934c8f09565b5daba447ac8b4e78347b7cfa1802a7be"

  url "https://github.com/opencx-labs/catamorphic/releases/download/desktop-v#{version}/Catamorphic-#{version}-arm64.dmg"
  name "Catamorphic"
  desc "Local-first workspace for projects, agents, workflows, and apps"
  homepage "https://github.com/opencx-labs/catamorphic"

  auto_updates true
  conflicts_with cask: "catamorphic"
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Catamorphic.app"

  zap trash: [
    "~/Library/Application Support/Catamorphic",
    "~/Library/Logs/Catamorphic",
    "~/Library/Preferences/dev.catamorphic.desktop.plist",
    "~/Library/Saved Application State/dev.catamorphic.desktop.savedState",
  ]
end

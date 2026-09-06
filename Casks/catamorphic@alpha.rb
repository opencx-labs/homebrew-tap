cask "catamorphic@alpha" do
  version "0.1.0-alpha.3"
  sha256 "0bcf4c044ececbd5bb3a586202b15619c68f11f9679d36538747c63a58cb0ea8"

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

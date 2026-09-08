cask "catamorphic@alpha" do
  version "0.1.0-alpha.5"
  sha256 "1b1a82d981c4b79b12fba5b8e2442927436b13ac1588d74b45daf1c132a5b122"

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

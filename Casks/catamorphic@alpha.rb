cask "catamorphic@alpha" do
  version "0.1.0-alpha.2"
  sha256 "fdb667bc77d6c9c1ddbec3dc19d76532c3d3095b87b61bb7082517a3816ca000"

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

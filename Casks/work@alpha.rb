cask "work@alpha" do
  version "0.1.0-alpha.14"
  sha256 "6feb866c0b71614ba05b29506b49f3dc0152e590c54b0f2c9d9ea1f7cf1bfc16"

  url "https://github.com/opencx-labs/catamorphic/releases/download/desktop-v#{version}/Work-#{version}-arm64.dmg"
  name "Work"
  desc "Local-first workspace for projects, agents, workflows, and apps"
  homepage "https://work.software/"

  auto_updates true
  conflicts_with cask: "work"
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Work.app"

  zap trash: [
    "~/Library/Application Support/Work",
    "~/Library/Logs/Work",
    "~/Library/Preferences/software.work.desktop.plist",
    "~/Library/Saved Application State/software.work.desktop.savedState",
  ]
end

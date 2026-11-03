cask "work@alpha" do
  version "0.1.0-alpha.37"
  sha256 "0f636d283d472c3494009437b63aadbac56bc325b712cc96649ca820f3364e88"

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

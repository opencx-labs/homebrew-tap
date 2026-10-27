cask "work@alpha" do
  version "0.1.0-alpha.31"
  sha256 "7af34b14e2c0e80f7cc0e93cd87e672e9dbeae53d081440bf45348399c0c4856"

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

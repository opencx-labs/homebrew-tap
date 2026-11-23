cask "work@alpha" do
  version "0.1.0-alpha.41"
  sha256 "eeda4b113aed623217650b9cddbe9a6018046675a603aa00bbf5ff5305606bb7"

  url "https://github.com/opencx-labs/catamorphic/releases/download/desktop-v#{version}/Work-#{version}-arm64.dmg"
  name "Work"
  desc "Local-first workspace for projects, agents, workflows, and apps"
  homepage "https://work.software/"

  auto_updates true
  conflicts_with cask: "work"
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Work.app"

  zap trash: [
    "~/Library/Application Support/Work",
    "~/Library/Logs/Work",
    "~/Library/Preferences/software.work.desktop.plist",
    "~/Library/Saved Application State/software.work.desktop.savedState",
  ]
end

cask "work@alpha" do
  version "0.1.0-alpha.28"
  sha256 "f5868f99da57f969e3b759a4f170eea104dab093c5af68deb5c2d28377c17797"

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

class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.48.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.1/difu-0.48.1-aarch64-apple-darwin.tar.gz"
      sha256 "220d6223b6ca62a107d002e8cad6beb76d2629d8ed4b568c14005bf94e3fcb7d"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.1/difu-0.48.1-x86_64-apple-darwin.tar.gz"
      sha256 "35b616795b20a354be7693d4b234b0012857a5fda2a1542d14f73d161663a448"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.1/difu-0.48.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b61b234c865774772e0fcf405f5c5ea40b242801b734e132a60b01d08598d25a"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.1/difu-0.48.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "736624b5560946dfa3631e595c94fd743751e5ac1eef6042c9fcd77c684da914"
    end
  end

  def install
    bin.install "difu"
    libexec.install "DifuNotifications.app" if OS.mac?
  end

  def caveats
    <<~EOS
      Git, GitHub CLI (gh), and Codex CLI must already be on your PATH.
      Authenticate if needed with `gh auth login` and `codex login`.
      Run `difu` to open Agents; switch to Reviews for pull requests.
    EOS
  end

  test do
    assert_match "difu #{version}", shell_output("#{bin}/difu --version")
    assert_match "difu needs an interactive terminal", shell_output("#{bin}/difu 2>&1", 1)
  end
end

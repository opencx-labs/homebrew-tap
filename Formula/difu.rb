class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.50.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.0/difu-0.50.0-aarch64-apple-darwin.tar.gz"
      sha256 "e5215fce1bbb79ee3cd907eb47315a35123a18e6b6b97ea61b13bbefab88c366"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.0/difu-0.50.0-x86_64-apple-darwin.tar.gz"
      sha256 "9c2602591836d9b99d4a232c8a42c418b88d4f15a28d80a196befe182a904d14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.0/difu-0.50.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "088712a17f82aa314733c6b0ce0cba2d31de63ab4b845c58eddaae1acebc23e8"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.0/difu-0.50.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f833d420dbf8a583211762b0fb4e33ed155588764d641bba3606693b3ad997f"
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

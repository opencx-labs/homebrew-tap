class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.48.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.0/difu-0.48.0-aarch64-apple-darwin.tar.gz"
      sha256 "41bcb8a36fc10d8c35e5ed839c2cc5ac9168934ed6decce9dd5b79ce631ee684"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.0/difu-0.48.0-x86_64-apple-darwin.tar.gz"
      sha256 "1b69fecbc2556a1b286711affe6729dd5bc9547b776a06a911129ad17ca9a552"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.0/difu-0.48.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6c2cda959178e7fc29f9a5950be449f975f9e1a456c4165c22258d637dbfd99d"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.0/difu-0.48.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6095c8f523c09f2ead3a8ead1d2dd2947ef72ce635a352461e567fb8a707f349"
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

class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.9.0/difu-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "4c043f6f4764ca691c3ad385dee25bbfc2de19572d7d8b4ce3fcc6f74709c680"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.9.0/difu-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "6daf1dcb31cc9dde6a505f5e8e12a6bb2356381a8e7c58af70609bd80484a1b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.9.0/difu-0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c735ceb7bfa25a6fdae4e37c7d568df364fbbc5a45cd9eab08249a3cf1734c7f"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.9.0/difu-0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "904d45c30853e545f47d2e331c46e4244d54c136ac91cbedc2ae44b1cfd9243a"
    end
  end

  def install
    bin.install "difu"
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

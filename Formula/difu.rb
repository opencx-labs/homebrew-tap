class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.16.0/difu-0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "791840f6169310e17eeb6b1558ccf0050ec009b84421ab67f1e02074203823bb"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.16.0/difu-0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "0421f3978cacc226fbd12153e306995a94c832c4e6d9cf8fa1281414ff4497d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.16.0/difu-0.16.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5e7d14af995fe14fa633183dec32fd07ab4818098bf83839d47adeb877ea5357"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.16.0/difu-0.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bc0004a44ba24fe08d8d9f857c1733bd17723474be3b232ffe3b4c0cf1751a0c"
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

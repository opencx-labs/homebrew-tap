class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.38.0/difu-0.38.0-aarch64-apple-darwin.tar.gz"
      sha256 "52be39d212eadc36fd1d730e99868c14fc84e7d72fe68db1c339c00eeeaa434c"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.38.0/difu-0.38.0-x86_64-apple-darwin.tar.gz"
      sha256 "5c37f4007aba4bf08ee4d3d9af358198f5704eebb60be9e0ce9f9add63f5cbfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.38.0/difu-0.38.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b49839731050cffd57c1bacaea7bc96a1202e159402857f6a830dc5e6514e7f9"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.38.0/difu-0.38.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a131e276f702b7336c45b988a81740c33463934fc9233d41225a5a0a57892b61"
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

class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.40.0/difu-0.40.0-aarch64-apple-darwin.tar.gz"
      sha256 "b295ab7e31fb3d12d5f19998f4375566a5f2f64881049393c2123faa87b98dfd"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.40.0/difu-0.40.0-x86_64-apple-darwin.tar.gz"
      sha256 "d519e321230bd3d17489e2cb5e7ad81a7bd961e0342bf87d7e1caf84e11379e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.40.0/difu-0.40.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "249ae2e5c3e1cc14f59110e1a0f3cd9206b415de0c5d3553359df1309f1f1aa8"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.40.0/difu-0.40.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1697214cd0067dd00293ccd8b6ae9621718f5578809141148ff2d55664f33898"
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

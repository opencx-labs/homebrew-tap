class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.29.0/difu-0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "7c836a8591e7b8e00f5f24892447234bcf9196a3d4c5b29c5c206bd651a7337f"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.29.0/difu-0.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "3c0bb7021b6ff38497184256d511449c20c5800fae5f56f2f97e9eaf19262ac9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.29.0/difu-0.29.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2c16f0c41179d2d595977b7318b270244faeff8b771f87cf99d30aa5c1caedda"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.29.0/difu-0.29.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "91325f4a6375756c3c9db181c43c32cc82888a1223cedd02473031c7b2588929"
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

class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.33.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.3/difu-0.33.3-aarch64-apple-darwin.tar.gz"
      sha256 "afb41304312fabfa03b32d31eb8a68256cf09b3b691ae094f2f77f4421a40880"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.3/difu-0.33.3-x86_64-apple-darwin.tar.gz"
      sha256 "029065b9d2dc93cdc69c7290c88560f1b2e7805553a82355af51991412f0b353"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.3/difu-0.33.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a3cb3fa1d8c691746c6486f3e2d1a35f874c369a6aa1897634020f69e4fd0667"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.3/difu-0.33.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "59182c9cffe31071c38f3dd63fd39245811eae33b63bd678ca0c908ac94499a1"
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

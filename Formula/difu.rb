class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.0/difu-0.33.0-aarch64-apple-darwin.tar.gz"
      sha256 "60fd0343ce89e7d1ae6cf469b329fe88ccfc08e22cd9573a4929ea7810c9541f"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.0/difu-0.33.0-x86_64-apple-darwin.tar.gz"
      sha256 "da61f5e545d6f26022418fba3a5d241e37818f3acdaddf611c0407eb5cd0b432"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.0/difu-0.33.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "10aea52bb5baf6af14194b280205809c84d71ff4c50b85d13b24ad7f71193034"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.0/difu-0.33.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "12cfaec333afb175ca17f95caa93fde9c5e7da841851cc6488640ce315ebdda1"
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

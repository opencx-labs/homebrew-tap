class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.33.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.1/difu-0.33.1-aarch64-apple-darwin.tar.gz"
      sha256 "7adc7d0710c45bcd032e59c6bec3f43f018127438dd9a6ea6d0438dd4d7264ac"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.1/difu-0.33.1-x86_64-apple-darwin.tar.gz"
      sha256 "93e1ec715e4b324a99658778d33d216ed35708832800fadefaa202e4b8ec78fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.1/difu-0.33.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1f133c442a71cf8b7178d7471026f40a2f30e838b806379b8eea652c8ee842e9"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.1/difu-0.33.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d6bac4fdc52a31d047133b8f976b3b49cbc8b02edccbc966126db037310618f5"
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

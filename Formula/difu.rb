class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.3.0/difu-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "49a667d5de181b8b4bdc8171687d27c085a2d85f75b3c2bb0c9ded7ec35e5bc2"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.3.0/difu-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "85eed6f4513bccaefb18dd132119291bd86483602995148313a057646e753cbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.3.0/difu-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "af1899ba0bef9c8c802325119ab0a51244f385492d1b6d95510dd097ce1e04ee"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.3.0/difu-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f8b051826c9caa390f92a8d4980b4c9afe6d256e9f13eb50d09dc2d87b7e6454"
    end
  end

  def install
    bin.install "difu"
  end

  def caveats
    <<~EOS
      Git, GitHub CLI (gh), and Codex CLI must already be on your PATH.
      Authenticate if needed with `gh auth login` and `codex login`.
      Run `difu` to open your review inbox.
    EOS
  end

  test do
    assert_match "difu #{version}", shell_output("#{bin}/difu --version")
    assert_match "difu needs an interactive terminal", shell_output("#{bin}/difu 2>&1", 1)
  end
end

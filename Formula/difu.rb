class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.1/difu-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "9492a25a3156710f7bc68483b08dffd9966984cbad0da09e2152805fd7ef61d7"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.1/difu-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "a1d61595f3c979ffc58bc700f837c89306e4c0e9e4ccda949f64293d6228cfa6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.1/difu-0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fb691e0960d19e15748e5951cc756fa67b0bc0c8d9fe41736a7ebc7c67911f1f"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.1/difu-0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b9ff9b059a354910b2e3fdd3fe0367527662b3a58da48c026c08065551cee11b"
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

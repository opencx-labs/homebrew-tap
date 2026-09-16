class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.4/difu-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "b49625a8ba353bfa01aa6e524f594eb9bde80e8dfea64ec16e02e4b6cfa20519"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.4/difu-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "62be2b1c91a4ea5f1a13eab85eeec4a36fe857f348b551933a5672e95d6a2f4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.4/difu-0.2.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8f9af0a6f1ab1f4ac6fa555d095eb79b2cb0fa69a2e952d87c9f0a2b18e0cb90"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.4/difu-0.2.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f9aea42ffbe9ef6fe7044dca6b6a3a8d9aeede74cd25974765c8ebfc523c7ed2"
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

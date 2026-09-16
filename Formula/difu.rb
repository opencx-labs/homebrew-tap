class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.5.0/difu-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "a1602bb0851879ec104fe6779a49ff0ba9621373d09f42c281325c821c7dbdd3"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.5.0/difu-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "429cfe49d4ffa561b0d89cbad29f371f66273075976cb40a8eb994e0aed10872"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.5.0/difu-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "87a4c08e11cd1ba64b930cc831f109dcb625a0241ffb4678492fe8a73962a45e"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.5.0/difu-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cb3a3fdb810a881a3ba9e8ca8add2391721ef0c50b653c7f6bb2f4ef3d9d7eb1"
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

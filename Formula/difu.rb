class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.7.0/difu-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "90f7cb0f476023962d64b3c1d240999d70735c4bab9ed0cdc0f5914fd54609ba"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.7.0/difu-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "c516866cddca1a7028111de2a7f4de3a9b0bc5d476b2dff136b41a9098c16670"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.7.0/difu-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6b1626e1be61e506fad53c29216a99aaa06dafced07143dc7923a3af8a9396f9"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.7.0/difu-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "61fca994242908c2bb1b3bd1fd11ce79780cf5b618d69709d938365131a9705f"
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
